import 'package:uod/core/services/calculator/calculator_service.dart';

abstract class TestService {
  String iLoveYou(int x, int y);
}

class TestServiceImpl implements TestService {
  final CalculatorService calculatorService;

  const TestServiceImpl({required this.calculatorService});

  @override
  String iLoveYou(int x, int y) {
    double noushin;
    noushin = 15.1;

    var farzad = calculatorService.multiply(x, y);
    return farzad.toString();
  }
}
