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

  LoginState copyWith({BlocStatus? newStatus, Token? newToken, Failure? newFailure}) {
    return LoginState(
      status: newStatus ?? status,
      token: newToken ?? token,
      failure: newFailure ?? failure,
    );
  }
}
