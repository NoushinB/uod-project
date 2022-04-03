import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio getDioClient() {
  var options = BaseOptions(connectTimeout: 30000, receiveTimeout: 30000);

  var dio = Dio(options);

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      // Do something before request is sent
      var token = "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjM2QzY0QjIxNDFENDZBMzFFQ0M5RjMxMjVDNTREOTg1RDRCM0NENzgiLCJ0eXAiOiJKV1QiLCJ4NXQiOiJOc1pMSVVIVWFqSHN5Zk1TWEZUWmhkU3p6WGcifQ.eyJuYmYiOjE2NDg5Nzk3NjYsImV4cCI6MTY4MDUxNTc2NiwiaXNzIjoiaHR0cHM6Ly91b2QtaWRzLmF3cm9zb2Z0LmNvbSIsImF1ZCI6WyJodHRwczovL3VvZC1pZHMuYXdyb3NvZnQuY29tL3Jlc291cmNlcyIsInFhQXBpIl0sImNsaWVudF9pZCI6InFhLmNsaWVudCIsInN1YiI6IjJlNGMyYmI2LTU1MmMtNGJkYi05MTRjLTI2ZWQ1NDRkYmYwNyIsImF1dGhfdGltZSI6MTY0ODk3OTc2NiwiaWRwIjoibG9jYWwiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJyb290YWRtaW4iLCJ1bmlxdWVfbmFtZSI6InJvb3RhZG1pbiIsIlBlcnNvbklkIjoiIiwiVXNlclR5cGUiOiIyIiwiVGVuYW50SWQiOiJiN2NiZDc3ZS05OGRlLTRhMjEtYWYwOS1kZGMxYTM5OTQzYjciLCJzY29wZSI6WyJxYUFwaSJdLCJhbXIiOlsicHdkIl19.0x_ByEC9_0VZ8yhPOdKLZcWOuFewzylpwROcuQEIMFTZaRbY2bIbNfihQbuQRUT-IKPL0CmwRDBYNRFf7zQ_FxWWelHckOP8MyCb8xZSzkseUCtMCUF0pEpZRUwrMNmKoFYZxpllRqwcu42gR0jYNSbZhlahdF2oYetQDX2JoTVaURr2w1JpZ0owh5Uf7517d67GLUV0n56s62j-EOm7KQK9dh8sVM80Yc9Vqkxa3PE18CD60zMaegzw52xwKdtag_O8UejmIqechIqhMsjacbhsDGd3mIvPcnJd1rrK-Ov_UI5LwBdlprQhn501Se78RYIe5uXgMSnSrOLJn4J0NPb1EX8cCLJrJGubLV7T96d9MJ1WFpzHf_9OmOO6JZJjsbnkfYt7ZfIETKFlRIc-hgcbGrwXs-3Lg0rV2C61tFDUCxMQlKhrjpFARsM1ubEfOzToG6INeWM9Ur4zK-qZVJ7WHkP1XQ9t_gcgBiO4OKgE1XEOCczfNHC5_C8vWga4dWMVA8v1HDFcUAx-Imb5dqbaTjWrDLsjiZGEvR6ewK-MaFyfRrvXPWRX7LvjaoYpu_LVaTtvLRWmYmyWxsmzY9e8V1EnotrMFQfMr8e3HmTQPQK451-wYKYv40RRubhBv571DxuZKqPbhS9PqRXvF8EJBA-ZxMyD5Q-Fhd1Ozp0";
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
