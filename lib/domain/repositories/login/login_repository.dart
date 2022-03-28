import 'package:uod/core/core.dart';
import 'package:uod/domain/entities/token.dart';

abstract class LoginRepository{
  Future<Result<Failure,Token>> getToken(String username,String password);
}