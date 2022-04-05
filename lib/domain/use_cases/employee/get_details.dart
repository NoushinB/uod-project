import 'package:equatable/equatable.dart';
import 'package:uod/core/core.dart';
import 'package:uod/domain/entities/employee_details.dart';
import 'package:uod/domain/repositories/employee/employee_repository.dart';

class NoInput extends Equatable {
  @override
  List<Object> get props => [];
}

class GetDetailsUseCase implements UseCase<EmployeeDetails, NoInput> {
  final EmployeeRepository employeeRepository;

  const GetDetailsUseCase({required this.employeeRepository});

  @override
  Future<Result<Failure, EmployeeDetails?>> call(NoInput input) {
    return employeeRepository.getDetails();
  }
}
