abstract class GenericCalculatorService<T> {
  T add(T x, T y);

  T multiply(T x, T y);
}

class GenericCalculatorServiceImpl implements GenericCalculatorService {
  @override
  add(x, y) {
    return x + y;
  }

  @override
  multiply(x, y) {
    return x * y;
  }
}
