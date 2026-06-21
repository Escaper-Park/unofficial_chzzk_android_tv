import 'dart:math' as math;

import 'live_api_contract.dart';

typedef LiveDetailDtFactory = String Function();

String createLiveDetailDt({int Function(int max)? nextInt}) {
  final randomNextInt = nextInt ?? math.Random().nextInt;
  final value =
      LiveApiDefaults.liveDetailDtBase +
      randomNextInt(LiveApiDefaults.liveDetailDtRange);

  return value.toRadixString(16);
}
