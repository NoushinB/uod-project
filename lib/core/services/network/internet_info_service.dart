import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class InternetInfoService {
  Future<bool> hasConnection();
}

class InternetInfoImpl implements InternetInfoService {
  final InternetConnectionChecker checker;

  const InternetInfoImpl({required this.checker});

  @override
  Future<bool> hasConnection() => checker.hasConnection;
}
