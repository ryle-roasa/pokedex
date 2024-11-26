import 'package:freezed_annotation/freezed_annotation.dart';

part 'async_result.freezed.dart';

@freezed
class AsyncResult<T> with _$AsyncResult<T> {
  const factory AsyncResult.success(T value) = Date<T>;
  const factory AsyncResult.loading() = Loading<T>;
  const factory AsyncResult.error([String? errorMessage]) = Error<T>;
}
