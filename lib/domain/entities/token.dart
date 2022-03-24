import 'package:equatable/equatable.dart';

class Token extends Equatable {
  final String accessToken;

  const Token(this.accessToken);

  @override
  List<Object> get props => [accessToken];
}
