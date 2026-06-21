part of 'search_results_bloc.dart';

List<SearchChannelResult> _displayableChannels(
  List<SearchChannelResult> items,
) {
  return [
    for (final item in items)
      if (item.channel != null) item,
  ];
}

List<SearchLiveResult> _displayableLives(List<SearchLiveResult> items) {
  return [
    for (final item in items)
      if (item.live != null) item,
  ];
}

List<SearchVideoResult> _displayableVideos(List<SearchVideoResult> items) {
  return [
    for (final item in items)
      if (item.video != null) item,
  ];
}

List<SearchLiveResult> _embeddedLiveResults(
  List<SearchChannelResult> items,
) {
  return [
    for (final item in items)
      if (item.content?.live != null)
        SearchLiveResult(
          channel: item.channel,
          live: item.content!.live,
        ),
  ];
}

List<SearchVideoResult> _embeddedVideoResults(
  List<SearchChannelResult> items,
) {
  return [
    for (final item in items)
      for (final video in item.content?.videos ?? const <SearchVideo>[])
        SearchVideoResult(
          channel: item.channel,
          video: video,
        ),
  ];
}

List<SearchLiveResult> _mergeLiveResults({
  required List<SearchLiveResult> embeddedItems,
  required List<SearchLiveResult> resultItems,
}) {
  final seenLiveIds = <int>{};
  final merged = <SearchLiveResult>[];

  for (final item in [...embeddedItems, ...resultItems]) {
    final liveId = item.live?.liveId;
    if (liveId == null || !seenLiveIds.add(liveId)) {
      continue;
    }

    merged.add(item);
  }

  return List.unmodifiable(merged);
}

List<SearchVideoResult> _mergeVideoResults({
  required List<SearchVideoResult> embeddedItems,
  required List<SearchVideoResult> resultItems,
}) {
  final seenVideoNos = <int>{};
  final merged = <SearchVideoResult>[];

  for (final item in [...embeddedItems, ...resultItems]) {
    final videoNo = item.video?.videoNo;
    if (videoNo == null || !seenVideoNos.add(videoNo)) {
      continue;
    }

    merged.add(item);
  }

  return List.unmodifiable(merged);
}
