part of 'tv_focus_section.dart';

bool requestTvSectionFocus(
  FocusScopeNode target, {
  double ensureVisibleAlignment = _defaultEnsureVisibleAlignment,
  bool ensureVisible = true,
  bool ensureVisibleScope = false,
}) {
  final ensureVisibleContext = ensureVisibleScope ? target.context : null;
  final rememberedChild = target.focusedChild;
  if (rememberedChild != null && _canRequestTvFocus(rememberedChild)) {
    return _requestFocusAndEnsureVisible(
      rememberedChild,
      ensureVisibleAlignment: ensureVisibleAlignment,
      ensureVisible: ensureVisible,
      ensureVisibleContext: ensureVisibleContext,
    );
  }

  for (final descendant in target.traversalDescendants) {
    if (_canRequestTvFocus(descendant)) {
      return _requestFocusAndEnsureVisible(
        descendant,
        ensureVisibleAlignment: ensureVisibleAlignment,
        ensureVisible: ensureVisible,
        ensureVisibleContext: ensureVisibleContext,
      );
    }
  }

  return false;
}

bool _canRequestTvFocus(FocusNode target) {
  return target.canRequestFocus && target.context != null;
}

bool _requestFocusAndEnsureVisible(
  FocusNode target, {
  required double ensureVisibleAlignment,
  required bool ensureVisible,
  BuildContext? ensureVisibleContext,
}) {
  target.requestFocus();
  if (!target.hasFocus && target.enclosingScope?.focusedChild != target) {
    return false;
  }

  if (!ensureVisible) {
    return true;
  }

  final context = ensureVisibleContext ?? target.context;
  if (context == null) {
    return true;
  }

  unawaited(
    Scrollable.ensureVisible(
      context,
      alignment: ensureVisibleAlignment,
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeOut,
    ),
  );
  return true;
}

const _defaultEnsureVisibleAlignment = 0.08;
