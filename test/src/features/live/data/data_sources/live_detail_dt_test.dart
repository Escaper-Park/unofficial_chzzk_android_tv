import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/data/data_sources/live_api_contract.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/data/data_sources/live_detail_dt.dart';

void main() {
  test('creates web-style live detail dt token', () {
    expect(createLiveDetailDt(nextInt: (_) => 0), '186a0');
    expect(createLiveDetailDt(nextInt: (_) => 12345), '1b6d9');
    expect(createLiveDetailDt(nextInt: (_) => 99999), '30d3f');
  });

  test('uses the web-observed live detail dt range', () {
    int? maxValue;

    createLiveDetailDt(
      nextInt: (max) {
        maxValue = max;
        return 0;
      },
    );

    expect(maxValue, LiveApiDefaults.liveDetailDtRange);
  });
}
