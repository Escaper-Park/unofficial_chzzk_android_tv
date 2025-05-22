import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/api.dart';
import '../model/clip.dart';

part 'clip_controller.g.dart';

@riverpod
class ClipController extends _$ClipController {
  @override
  void build() {
    return;
  }

  String getPlayUrl({required NaverClip clip}) =>
      '${BaseUrl.clipEmbed}/${clip.clipUID}?autoplay=1';
}
