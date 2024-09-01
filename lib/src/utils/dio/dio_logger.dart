import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class CustomInterceptor extends Interceptor {
  final Logger logger = Logger();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.d('Request > uri: ${options.uri} \nheaders: ${options.headers}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.t(
        'Response > code: ${response.statusCode} \npath: ${response.requestOptions.path}\nheaders: ${response.headers}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.e(
        'Error > msg: ${err.message} \npath: ${err.requestOptions.path} \n${err.response}');
    super.onError(err, handler);
  }
}
