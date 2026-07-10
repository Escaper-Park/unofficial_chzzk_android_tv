part of 'live_player_bloc.dart';

extension _LivePlayerBlocBrowseHelpers on LivePlayerBloc {
  Future<void> _onBrowseRequested(
    _BrowseRequested event,
    Emitter<LivePlayerState> emit,
  ) async {
    if (state.overlayMode == LivePlayerOverlayMode.browse) {
      return;
    }

    final slot = state.activeSlot;
    if (slot.channelId == null) {
      return;
    }

    final requestSerial = ++_browseRequestSerial;
    final browseSessionSerial = ++_browseSessionSerial;
    final openingState = state.copyWith(
      overlayMode: LivePlayerOverlayMode.browse,
      isSignedIn: event.isSignedIn,
    );
    final openingSection = openingState.initialBrowseSection;
    emit(_browseLoadingState(openingState, openingSection));

    final groupCollectionFuture = _readBrowseGroupCollection(
      fallback: openingState.groupCollection,
    );
    final browseLoadFuture = _loadBrowseSection(
      emit,
      openingSection,
      requestSerial: requestSerial,
    );
    final groupCollection = await groupCollectionFuture;
    if (!emit.isDone &&
        !isClosed &&
        browseSessionSerial == _browseSessionSerial &&
        state.overlayMode == LivePlayerOverlayMode.browse &&
        state.groupCollection == openingState.groupCollection &&
        groupCollection != state.groupCollection) {
      emit(state.copyWith(groupCollection: groupCollection));
    }
    await browseLoadFuture;
  }

  Future<GroupCollection> _readBrowseGroupCollection({
    required GroupCollection fallback,
  }) async {
    final existingRead = _browseGroupCollectionReadInFlight;
    final read = existingRead ?? _startBrowseGroupCollectionRead();
    try {
      return await read.timeout(
            _browseGroupCollectionReadTimeout,
            onTimeout: () => fallback,
          ) ??
          fallback;
    } on Object {
      return fallback;
    }
  }

  Future<GroupCollection?> _startBrowseGroupCollectionRead() {
    final read = _readBrowseGroupCollectionOnce(groupRepository);
    _browseGroupCollectionReadInFlight = read;
    final owner = WeakReference(this);
    unawaited(
      read.whenComplete(() {
        final bloc = owner.target;
        if (identical(bloc?._browseGroupCollectionReadInFlight, read)) {
          bloc?._browseGroupCollectionReadInFlight = null;
        }
      }),
    );
    return read;
  }

  void _onBrowseClosed(
    _BrowseClosed event,
    Emitter<LivePlayerState> emit,
  ) {
    ++_browseRequestSerial;
    ++_browseSessionSerial;
    emit(
      state.copyWith(
        overlayMode: LivePlayerOverlayMode.none,
        browseLoadingMore: false,
        pendingReplacementLive: null,
      ),
    );
  }

  Future<void> _onBrowseNextSectionRequested(
    _BrowseNextSectionRequested event,
    Emitter<LivePlayerState> emit,
  ) async {
    if (state.overlayMode != LivePlayerOverlayMode.browse ||
        state.browseStatus == LivePlayerBrowseLoadStatus.loading) {
      return;
    }

    await _switchBrowseSection(emit, state.nextBrowseSection);
  }

  Future<void> _onBrowsePreviousSectionRequested(
    _BrowsePreviousSectionRequested event,
    Emitter<LivePlayerState> emit,
  ) async {
    if (state.overlayMode != LivePlayerOverlayMode.browse ||
        state.browseStatus == LivePlayerBrowseLoadStatus.loading) {
      return;
    }

    await _switchBrowseSection(emit, state.previousBrowseSection);
  }

  Future<void> _onBrowseFallbackPressed(
    _BrowseFallbackPressed event,
    Emitter<LivePlayerState> emit,
  ) async {
    if (state.overlayMode != LivePlayerOverlayMode.browse) {
      return;
    }

    switch (state.browseFallbackAction) {
      case LivePlayerBrowseFallbackAction.none:
        return;
      case LivePlayerBrowseFallbackAction.showPopular:
        await _switchBrowseSection(emit, LivePlayerBrowseSection.popular);
      case LivePlayerBrowseFallbackAction.closeBrowse:
        add(const LivePlayerEvent.browseClosed());
    }
  }

  Future<void> _onBrowseLoadMoreRequested(
    _BrowseLoadMoreRequested event,
    Emitter<LivePlayerState> emit,
  ) async {
    if (state.overlayMode != LivePlayerOverlayMode.browse ||
        state.browseLoadingMore ||
        !state.browseHasMore) {
      return;
    }

    final section = state.browseSection;
    if (section != LivePlayerBrowseSection.popular &&
        section != LivePlayerBrowseSection.category) {
      return;
    }

    final requestSerial = _browseRequestSerial;
    final existingItems = state.browseItems;
    emit(state.copyWith(browseLoadingMore: true));

    try {
      final result = await _fetchBrowseSection(
        section,
        requestSerial: requestSerial,
        liveCursor: state.browseLiveCursor,
        categoryCursor: state.browseCategoryCursor,
      );
      if (emit.isDone ||
          isClosed ||
          requestSerial != _browseRequestSerial ||
          state.overlayMode != LivePlayerOverlayMode.browse ||
          state.browseSection != section) {
        return;
      }

      emit(
        state.copyWith(
          browseStatus: LivePlayerBrowseLoadStatus.success,
          browseItems: [...existingItems, ...result.items],
          browseLiveCursor: result.liveCursor,
          browseCategoryCursor: result.categoryCursor,
          browseHasMore: result.hasMore,
          browseLoadingMore: false,
          browseFallbackAction: LivePlayerBrowseFallbackAction.none,
        ),
      );
    } on Object {
      if (emit.isDone ||
          isClosed ||
          requestSerial != _browseRequestSerial ||
          state.overlayMode != LivePlayerOverlayMode.browse ||
          state.browseSection != section) {
        return;
      }

      emit(
        state.copyWith(
          browseHasMore: false,
          browseLoadingMore: false,
        ),
      );
    }
  }
}

Future<GroupCollection?> _readBrowseGroupCollectionOnce(
  GroupRepository repository,
) async {
  try {
    return await repository.read();
  } on Object {
    return null;
  }
}

const _browseGroupCollectionReadTimeout = Duration(seconds: 2);
