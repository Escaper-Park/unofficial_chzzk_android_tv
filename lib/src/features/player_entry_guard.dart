final playerEntryGuard = PlayerEntryGuard();

final class PlayerEntryGuard {
  bool _pending = false;

  Future<void> run(Future<void> Function() action) async {
    if (_pending) {
      return;
    }

    _pending = true;
    try {
      await action();
    } finally {
      _pending = false;
    }
  }
}
