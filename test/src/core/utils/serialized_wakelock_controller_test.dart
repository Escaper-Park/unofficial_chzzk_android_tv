// ignore_for_file: cascade_invocations

import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/utils/serialized_wakelock_controller.dart';

void main() {
  test('serializes enable and disable requests', () async {
    final calls = <bool>[];
    final gates = <Completer<void>>[];
    final controller = SerializedWakelockController(
      setEnabled: ({required enabled}) {
        calls.add(enabled);
        final gate = Completer<void>();
        gates.add(gate);
        return gate.future;
      },
    );

    controller
      ..setEnabled(enabled: true)
      ..setEnabled(enabled: false);
    await Future<void>.delayed(Duration.zero);

    expect(calls, [true]);

    gates.removeAt(0).complete();
    await Future<void>.delayed(Duration.zero);

    expect(calls, [true, false]);

    gates.removeAt(0).complete();
    await controller.drain();
  });

  test('dispose queues a final disable request', () async {
    final calls = <bool>[];
    final gates = <Completer<void>>[];
    final controller = SerializedWakelockController(
      setEnabled: ({required enabled}) {
        calls.add(enabled);
        final gate = Completer<void>();
        gates.add(gate);
        return gate.future;
      },
    );

    controller
      ..setEnabled(enabled: true)
      ..dispose()
      ..setEnabled(enabled: true);
    await Future<void>.delayed(Duration.zero);

    expect(calls, [true]);

    gates.removeAt(0).complete();
    await Future<void>.delayed(Duration.zero);

    expect(calls, [true, false]);

    gates.removeAt(0).complete();
    await controller.drain();
  });
}
