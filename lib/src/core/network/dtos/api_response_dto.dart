import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response_dto.freezed.dart';
part 'api_response_dto.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class ApiResponseDto<T> with _$ApiResponseDto<T> {
  const factory ApiResponseDto({
    int? code,
    String? message,
    T? content,
  }) = _ApiResponseDto<T>;

  factory ApiResponseDto.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$ApiResponseDtoFromJson(json, fromJsonT);
}

extension ApiResponseDtoContent<T> on ApiResponseDto<T> {
  T requireContent() {
    _throwIfFailure();

    final value = content;
    if (value == null) {
      throw ApiResponseException(
        code: code,
        message: message,
      );
    }

    return value;
  }

  T contentOr(T fallback) {
    _throwIfFailure();
    return content ?? fallback;
  }

  void _throwIfFailure() {
    final responseCode = code;
    if (responseCode != null && responseCode != 200) {
      throw ApiResponseException(
        code: responseCode,
        message: message,
      );
    }
  }
}

final class ApiResponseException implements Exception {
  const ApiResponseException({
    this.code,
    this.message,
  });

  final int? code;
  final String? message;

  @override
  String toString() {
    final responseCode = code;
    final responseMessage = message;
    if (responseCode == null && responseMessage == null) {
      return 'ApiResponseException';
    }
    return 'ApiResponseException(code: $responseCode, message: $responseMessage)';
  }
}
