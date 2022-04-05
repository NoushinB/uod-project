import 'package:uod/domain/entities/token.dart';

class TokenModel extends Token {
  final int expiresIn;
  final String tokenType;

  const TokenModel({
    required String accessToken,
    required this.expiresIn,
    required this.tokenType,
  }) : super(accessToken);

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      accessToken: json["access_token"],
      expiresIn: json["expires_in"],
      tokenType: json["token_type"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json["access_token"] = accessToken;
    json["expires_in"] = expiresIn;
    json["token_type"] = tokenType;
    return json;
  }
}
