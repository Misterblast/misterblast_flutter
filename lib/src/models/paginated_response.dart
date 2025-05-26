import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_response.g.dart';
part 'paginated_response.freezed.dart';

@Freezed(genericArgumentFactories: true)
abstract class PaginatedResponse<T> with _$PaginatedResponse<T> {
  const factory PaginatedResponse({
    required List<T> data,
    required int total,
    required int page,
    required int limit,
  }) = _PaginatedResponse<T>;

  factory PaginatedResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$PaginatedResponseFromJson(json, fromJsonT);
}
