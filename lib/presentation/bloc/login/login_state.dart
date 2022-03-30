import 'package:equatable/equatable.dart';
import 'package:uod/core/core.dart';
import 'package:uod/core/utils/enums/bloc_status.dart';
import 'package:uod/domain/entities/token.dart';

class LoginState extends Equatable {
  final BlocStatus status;
  final Token? token;
  final Failure? failure;

  const LoginState({required this.status, this.token, this.failure});

  @override
  List<Object?> get props => [status, token, failure];

  LoginState copyWith({BlocStatus? status1, Token? token1, Failure? failure1}) {
    return LoginState(
      status: status1 ?? status,
      token: token1 ?? token,
      failure: failure1 ?? failure,
    );
  }
}
