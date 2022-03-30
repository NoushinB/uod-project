import 'package:uod/core/core.dart';
import 'package:uod/domain/entities/employee_details.dart';

abstract class EmployeeRepository {
  Future<Result<Failure,EmployeeDetails>> getDetails(String id);
}