import 'package:freezed_annotation/freezed_annotation.dart';

import 'live.dart';

part 'live_stream.freezed.dart';
part 'live_stream.g.dart';

@freezed
class LiveStream with _$LiveStream {
  factory LiveStream({
    required LiveDetail liveDetail,
    required List<Uri?> uris,
  }) = _LiveStream;

  factory LiveStream.fromJson(Map<String, dynamic> json) =>
      _$LiveStreamFromJson(json);
}
