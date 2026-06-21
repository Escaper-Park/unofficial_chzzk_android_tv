import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/utils/utils.dart';

void main() {
  test('keeps the latest pending value until scheduled', () async {
    var elapsedCount = 0;
    final commit = DebouncedValueCommit<int>(
      delay: const Duration(milliseconds: 10),
      onDebounceElapsed: () {
        elapsedCount += 1;
      },
    );
    addTearDown(commit.dispose);

    commit
      ..setPendingValue(1)
      ..setPendingValue(2);
    await Future<void>.delayed(const Duration(milliseconds: 20));

    expect(elapsedCount, 0);
    expect(commit.takePendingValue(), 2);
    expect(commit.hasPendingValue, isFalse);
  });

  test('notifies after a scheduled debounce delay', () async {
    var elapsedCount = 0;
    final commit = DebouncedValueCommit<int>(
      delay: const Duration(milliseconds: 10),
      onDebounceElapsed: () {
        elapsedCount += 1;
      },
    );
    addTearDown(commit.dispose);

    commit
      ..setPendingValue(1)
      ..schedule();
    await Future<void>.delayed(const Duration(milliseconds: 20));

    expect(elapsedCount, 1);
    expect(commit.takePendingValue(), 1);
  });

  test('clear cancels a scheduled debounce', () async {
    var elapsedCount = 0;
    final commit = DebouncedValueCommit<int>(
      delay: const Duration(milliseconds: 10),
      onDebounceElapsed: () {
        elapsedCount += 1;
      },
    );
    addTearDown(commit.dispose);

    commit
      ..setPendingValue(1)
      ..schedule()
      ..clear();
    await Future<void>.delayed(const Duration(milliseconds: 20));

    expect(elapsedCount, 0);
    expect(commit.hasPendingValue, isFalse);
  });
}
