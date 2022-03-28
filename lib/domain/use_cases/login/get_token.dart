import 'package:equatable/equatable.dart';
import 'package:uod/core/core.dart';
import 'package:uod/domain/entities/token.dart';
import 'package:uod/domain/repositories/login/login_repository.dart';

class TokenInput extends Equatable {
  final String userName;
  final String password;

  TokenInput({required this.userName, required this.password});

  @override
  List<Object?> get props => [userName, password];
}

class GetToken implements UseCase<Token, TokenInput> {
  final LoginRepository loginRepository;

  GetToken({required this.loginRepository});

  @override
  Future<Result<Failure, Token?>> call(TokenInput input) {
    return loginRepository.getToken(input.userName, input.password);
  }
}
