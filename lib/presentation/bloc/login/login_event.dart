import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class GetToken extends LoginEvent {
  final String username;
  final String password;

  const GetToken({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}
