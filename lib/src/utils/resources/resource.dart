import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource.freezed.dart';

@freezed
sealed class Resource<T> with _$Resource<T> {
  const factory Resource.success(T data) = Success;
  const factory Resource.failure(DioException error) = Failure;
}
