import 'package:uod/core/core.dart';
import 'package:uod/domain/entities/employee_details.dart';
import 'package:uod/domain/repositories/employee/employee_repository.dart';

class GetDetails implements UseCase<EmployeeDetails,String>{
  final EmployeeRepository employeeRepository;
  const GetDetails({required this.employeeRepository});
  @override
  Future<Result<Failure, EmployeeDetails?>> call(String input) {
    return employeeRepository.getDetails(input);
  }

}