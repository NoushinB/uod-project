import 'package:dio/dio.dart';
import 'package:uod/core/core.dart';
import 'package:uod/data/models/token_model.dart';

abstract class LoginRemoteSource {
  Future<TokenModel> getToken(String userName, String password);
}

class LoginRemoteSourceImpl implements LoginRemoteSource {
  final Dio dio;

  const LoginRemoteSourceImpl({required this.dio});

  @override
  Future<TokenModel> getToken(String userName, String password) async {
    try {
      Map<String, dynamic> body = {
        "grant_type": "password",
        "client_id": "mobile.admin",
        "client_secret": "secret",
        "username": userName,
        "password": password,
      };
      Map<String, dynamic> headers = {
        "Content-Type": "application/x-www-form-urlencoded",
      };
      dio.options.headers.addAll(headers);
      var response = await dio.post(NetworkPath.token, data: body);
      ErrorHelper.ensureSuccessResponse(response, defaultMsg: "");
      return TokenModel.fromJson(response.data);
    } catch (ex) {
      throw ServerException();
    }
  }
}
