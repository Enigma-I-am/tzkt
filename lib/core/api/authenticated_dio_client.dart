import 'dart:async';

import 'package:dio/dio.dart';
import 'package:tzkt/core/api/exception/request_failure.dart';
import 'package:tzkt/core/services/logger_service.dart';
import 'package:tzkt/utils/pretty_json.dart';

/// Lighthouse Authenticated Networking Client
class AuthenticatedDioClient {
  final int timeout;

  AuthenticatedDioClient({this.timeout = 60 * 1000}) {
    _dio.options.responseType = ResponseType.plain;
    _dio.interceptors.add(InterceptorsWrapper(requestInterceptor));
    _dio.options.connectTimeout = Duration(milliseconds: timeout);
    _dio.options.receiveTimeout = Duration(milliseconds: timeout);
  }

  final _dio = Dio();

  Future<Response<String>> delete(
    String path, {
    data,
    Map<String, Object>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) =>
      _dio.delete<String>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

  Future<Response<String>> get(
    String path, {
    Map<String, Object>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    onReceiveProgress,
  }) =>
      _dio.get<String>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

  Future<Response<String>> head(
    String path, {
    data,
    Map<String, Object>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) =>
      _dio.head<String>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

  Future<Response<String>> patch(
    String path, {
    data,
    Map<String, Object>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    onSendProgress,
    onReceiveProgress,
  }) =>
      _dio.patch<String>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

  Future<Response<String>> post(
    String path, {
    data,
    Map<String, Object>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    onSendProgress,
    onReceiveProgress,
  }) =>
      _dio.post<String>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

  Future<Response<String>> put(
    String path, {
    data,
    Map<String, Object>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    onSendProgress,
    onReceiveProgress,
  }) =>
      _dio.put<String>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

  void requestInterceptor(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers.putIfAbsent(
      'Content-type',
      () => 'application/json;charset=UTF-8',
    );

    options.headers.putIfAbsent(
      'Accept',
      () => 'application/json;charset=UTF-8',
    );

    return handler.next(options);
  }

  Response<String> errorInterceptor(
    Response<String> res, {
    bool? shouldThrowErrorIf,
    bool? shouldReturnIf,
    RequestFailure? err,
  }) {
    if (shouldReturnIf == true) {
      return res;
    }

    if ((shouldThrowErrorIf ??
        ((res.statusCode != null &&
                res.statusCode! < 200 &&
                res.statusCode! >= 205) ||
            res.data == null ||
            res.data!.isEmpty))) {
      throw err ?? RequestFailure.transformError(res.data ?? '');
    } else {
      return res;
    }
  }
}

class InterceptorsWrapper extends Interceptor {
  InterceptorsWrapper(this.requestInterceptor);
  void Function(RequestOptions options, RequestInterceptorHandler handler)
      requestInterceptor;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    logger
      ..d('Host -> ${options.uri.host}')
      ..d('Url -> ${options.uri.path}')
      ..f('QueryParams -> ${jsonPretty(options.uri.queryParametersAll)}')
      ..i('Data -> ${jsonPretty(options.data)}');

    return requestInterceptor(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger
      ..d('Status Code -> ${response.statusCode}')
      ..i('Response -> ${jsonPretty(response.data)}');

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger
      ..d('Status Code -> ${err.response?.statusCode}')
      ..i('Error Response -> ${jsonPretty(err.response?.data)}');
    super.onError(err, handler);
  }
}
