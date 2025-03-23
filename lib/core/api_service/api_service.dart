import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

enum HttpMethod { get, post }

class ApiService {
  final Dio dio = Dio();

  ApiService() {
    dio.options.baseUrl = '';
    dio.interceptors.addAll([
      ErrorInterceptor(),
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printRequestData: true,
          printResponseData: true,
          printRequestHeaders: true,
          printResponseHeaders: true,
        )
      )
    ]);
  }

  Future<Response?>? apiCall({
    required String url,
    Map<String, dynamic>? body,
    required HttpMethod method,
    Map<String, dynamic>? headers,
    bool? showLoading,
  }) async {
    dio.options.headers.addAll(headers ?? {});
    if (showLoading ?? true) {
      ///TODO: showLoading
    }
    Response? response;
    switch (method) {
      case HttpMethod.get:
        response = await dio.get(url, queryParameters: body);
        break;
      case HttpMethod.post:
        response = await dio.post(url, data: body);
        break;
    }
    if (showLoading ?? false) {
      ///TODO: hideLoading
    }
    return response;
  }
}

class ErrorInterceptor extends Interceptor{

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.sendTimeout:
      // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.receiveTimeout:
      // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.badCertificate:
      // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.badResponse:
      // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.cancel:
      // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.connectionError:
      // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.unknown:
      // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}
