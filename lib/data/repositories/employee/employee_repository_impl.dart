import 'package:uod/core/core.dart';
import 'package:uod/core/error/failure.dart';
import 'package:uod/core/utils/generics/multiple_results.dart';
import 'package:uod/data/data_sources/remote/employee_source.dart';
import 'package:uod/domain/entities/employee_details.dart';
import 'package:uod/domain/repositories/employee/employee_repository.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final EmployeeSource employeeSource;
  final InternetInfoService internetInfoService;

  const EmployeeRepositoryImpl({required this.employeeSource, required this.internetInfoService});

  @override
  Future<Result<Failure, EmployeeDetails>> getDetails(String id) async {
    try {
      if (await internetInfoService.hasConnection()) {
        final result = await employeeSource.getDetails(id);
        return Success(result);
      }
      return Error(NotConnectedFailure());
    } on ServerException {
      return Error(ServerFailure());
    }
  }
}
