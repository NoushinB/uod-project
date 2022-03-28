import 'package:uod/core/core.dart';
import 'package:uod/core/error/failure.dart';
import 'package:uod/core/utils/generics/multiple_results.dart';
import 'package:uod/data/data_sources/remote/login_remote_source.dart';
import 'package:uod/domain/entities/token.dart';
import 'package:uod/domain/repositories/login/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteSource loginRemoteSource;
  final InternetInfoService internetInfoService;

  const LoginRepositoryImpl({required this.loginRemoteSource, required this.internetInfoService});

  @override
  Future<Result<Failure, Token>> getToken(String userName, String password) async {
    try {
      if (await internetInfoService.hasConnection()) {
        final result = await loginRemoteSource.getToken(userName, password);
        return Success(result);
      }
      return Error(NotConnectedFailure());
    } on ServerException {
      return Error(ServerFailure());
    }
  }
}
