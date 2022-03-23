import 'package:dio/dio.dart';

import 'exceptions.dart';

class ErrorHelper {
  static bool ensureSuccessResponse(Response response, {required String defaultMsg}) {
    if (response.statusCode == 200 || response.statusCode == 201) return true;

    if (response.statusCode == 500) {
      throw ServerException();
    }

    if (response.statusCode == 302) {
      // Network is connected, but it is limited. For example when network need to recharge
      // The target resource resides temporarily under a different URI.
      throw NotConnectedException();
    }

    if (response.statusCode == 401) {
      throw UnauthorizedException();
    }

    throw Exception(defaultMsg);
  }
}
