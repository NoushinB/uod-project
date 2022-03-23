import 'package:uod/core/error/failure.dart';
import 'package:uod/core/utils/generics/multiple_results.dart';

abstract class UseCase<Output, Input> {
  Future<Result<Failure, Output?>> call(Input input);
}
