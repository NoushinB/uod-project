import 'package:uod/core/services/test_service/test_service.dart';

abstract class LoveService {
  String love(String x, String y);

  int babak(int n);
}

class LoveServiceImpl implements LoveService {
  final TestService testService;

  const LoveServiceImpl({required this.testService});

  @override
  String love(String x, String y) {
    String z = x + "Love" + y;
    var noushin = testService.iLoveYou(1, 4);
    return z;
  }

  @override
  int babak(int n) {
    return 0;
  }
}
