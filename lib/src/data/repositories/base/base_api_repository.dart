import 'dart:io' show HttpStatus;

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:retrofit/retrofit.dart';

import '../../../utils/resources/resource.dart';

abstract class BaseApiRepository {
  @protected
  Future<Resource<T>> getStateOf<T>({
    required Future<HttpResponse<T>> Function() response,
  }) async {
    try {
      final httpResponse = await response();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Resource.success(httpResponse.data);
      } else {
        throw DioError(
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
        );
      }
    } on DioError catch (error) {
      return Resource.failure(error);
    }
  }
}
