import 'package:freezed_annotation/freezed_annotation.dart';

part 'auto_complete_tag_response.freezed.dart';
part 'auto_complete_tag_response.g.dart';

/* keyword */
@freezed
class AutoCompleteTagResponse with _$AutoCompleteTagResponse {
  const factory AutoCompleteTagResponse({required List<String> keywords}) =
      _AutoCompleteTagResponse;

  factory AutoCompleteTagResponse.fromJson(Map<String, dynamic> json) =>
      _$AutoCompleteTagResponseFromJson(json);
}
