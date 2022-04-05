import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:uod/data/data_sources/local/shared_prefs/local_storage_service.dart';

Dio getDioClient() {
  var options = BaseOptions(connectTimeout: 30000, receiveTimeout: 30000);

  var dio = Dio(options);

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      // Do something before request is sent
      var _storage = await LocalStorageService.getInstance();
      var accessToken = _storage?.token;
      if (accessToken != null) {
        options.headers["Authorization"] = "Bearer $accessToken";
      }
      return handler.next(options); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: `handler.resolve(response)`.
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: `handler.reject(dioError)`
    },
    onResponse: (response, handler) {
      // Do something with response data
      return handler.next(response); // continue
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: `handler.reject(dioError)`
    },
    onError: (DioError e, handler) {
      // Do something with response error
      return handler.next(e); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: `handler.resolve(response)`.
    },
  ));

  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
  ));
  return dio;
}
