import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio getDioClient() {
  var options = BaseOptions(connectTimeout: 30000, receiveTimeout: 30000);

  var dio = Dio(options);

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      // Do something before request is sent
      var token = "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjM2QzY0QjIxNDFENDZBMzFFQ0M5RjMxMjVDNTREOTg1RDRCM0NENzgiLCJ0eXAiOiJKV1QiLCJ4NXQiOiJOc1pMSVVIVWFqSHN5Zk1TWEZUWmhkU3p6WGcifQ.eyJuYmYiOjE2NDkxNDc1NDksImV4cCI6MTY4MDY4MzU0OSwiaXNzIjoiaHR0cHM6Ly91b2QtaWRzLmF3cm9zb2Z0LmNvbSIsImF1ZCI6WyJodHRwczovL3VvZC1pZHMuYXdyb3NvZnQuY29tL3Jlc291cmNlcyIsInFhQXBpIl0sImNsaWVudF9pZCI6InFhLmNsaWVudCIsInN1YiI6IjJiNjgyODIzLTQxMjItNDYyYi1hODNiLWU4ZDU2NGJkZTU4YSIsImF1dGhfdGltZSI6MTY0OTE0NzU0OSwiaWRwIjoibG9jYWwiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJhemFkX2thcmltIiwidW5pcXVlX25hbWUiOiJhemFkX2thcmltIiwiUGVyc29uSWQiOiJhOWZkYzI5OC01YWVhLTRkM2YtOTU1Ny0yYTg5ZDVlOGRkMTciLCJVc2VyVHlwZSI6IjQiLCJUZW5hbnRJZCI6ImI3Y2JkNzdlLTk4ZGUtNGEyMS1hZjA5LWRkYzFhMzk5NDNiNyIsInNjb3BlIjpbInFhQXBpIl0sImFtciI6WyJwd2QiXX0.GAJrCLWh0iAsuFWWTHcJjjDJxm5LGU7PZt5sprz7iZ93rnXv-hbanJGxKjY2ZLf8hvMPlNq5z9XRNzHyhXYygH4nud7OhPRQiPh9QBTp1Tu4258s-X4L9H8AhSY96jqvofdD_zoAcv6WwSkM_-M6ExMVUwwOtcLJ3SAo1jOoLKr4lcZS6HipNIc_E1NnFQpiOvNtUgWYm6bsQr07yrHf8I6MF-9Wdv3bALX5plCXP3r-f_u-g7N79oARgCtMXdHl6eWi9QzeQS6Ryh0rrczxZr5Z-B0YjGggW_-AbRhG7Z_li5s7UXY4ajqYat2dREhJuwAonUPapYlM_gOO-0bwJIH51t3oDzAOHtPUDRwJR_nF-RkIngIU8hcuFt0mUqtsyIgGmX8ZgnVTI9rRVcMxKpUzzwfUGZlM9d_KginXvBIDT3CNFKob7TmKgk2RRXciCrPAlDS9ngULRTKspsb7Ftzf5TuzzFCU0Lb2yJLzLmSVrCSAlZbb_OWVpo9AUfz18fcGpNXUVSDIguY24zZ2FPCnKT13EcD-phEnLioiDhTMF-3Hb0_i8-Hvp_2w6yqZhN4MrIalYjsW3uoQYlzE_ultvOOfumrgZy4akJOl_QXoF-Q3qpltDHutjeo3VMFS1vP-b5IjucvHxZlwl0GDLDgb-l1-HQFeKAQH6daxIfY";
      options.headers["Authorization"] = token;
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
