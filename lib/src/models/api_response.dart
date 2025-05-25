import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.g.dart';
part 'api_response.freezed.dart';

@Freezed(genericArgumentFactories: true)
abstract class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    required T data,
    required String message,
  }) = _ApiResponse<T>;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$ApiResponseFromJson<T>(json, fromJsonT);
}
