abstract class CalculatorService {
  int sum(int x, int y);

  int multiply(int x, int y);

  int minus(int x, int y);

  int divide(int x, int y);
}

class CalculatorServiceImpl implements CalculatorService {
  @override
  int sum(int x, int y) {
    return x + y;
  }

  @override
  int divide(int x, int y) {
    if (y > 0) {
      return x ~/ y;
    }
    return 0;
  }

  @override
  int minus(int x, int y) {
    return x - y;
  }

  @override
  int multiply(int x, int y) {
    return x * y;
  }
}
