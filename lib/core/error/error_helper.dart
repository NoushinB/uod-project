

import 'package:dio/dio.dart';

import 'exceptions/app_exception.dart';
import 'exceptions/internal_server_exception.dart';
import 'exceptions/no_internet_exception.dart';

class ErrorHelper {
  static bool ensureSuccessResponse(Response response, {required String defaultMsg}) {
    if (response.statusCode == 200 || response.statusCode == 201) return true;

    if (response.statusCode == 500) {
      throw InternalServerException(message: 'InternalServerException');
    }

    if (response.statusCode == 302) {
      // Network is connected, but it is limited. For example when network need to recharge
      // The target resource resides temporarily under a different URI.
      throw NoInternetException(statusCode: 302, message: 'NoInternetException');
    }

    throw AppException(message: defaultMsg);
  }


}