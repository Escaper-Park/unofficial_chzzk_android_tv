import 'package:freezed_annotation/freezed_annotation.dart';

part 'auto_complete_tag_response.freezed.dart';
part 'auto_complete_tag_response.g.dart';

/* keyword */
@freezed
@JsonSerializable()
class AutoCompleteTagResponse with _$AutoCompleteTagResponse {
  final List<String> keywords;

  AutoCompleteTagResponse({required this.keywords});

  factory AutoCompleteTagResponse.fromJson(Map<String, dynamic> json) =>
      _$AutoCompleteTagResponseFromJson(json);
}
