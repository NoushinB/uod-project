import 'package:equatable/equatable.dart';
import 'package:uod/core/core.dart';
import 'package:uod/core/utils/enums/bloc_status.dart';
import 'package:uod/domain/entities/employee_details.dart';

class EmployeeDetailState extends Equatable {
  final BlocStatus status;
  final Failure? failure;
  final EmployeeDetails? details;

  const EmployeeDetailState({required this.status, this.failure, this.details});

  @override
  List<Object?> get props => [status, failure];

  EmployeeDetailState copyWith({BlocStatus? newStatus, Failure? newFailure, EmployeeDetails? newDetails}) {
    return EmployeeDetailState(status: newStatus ?? status, failure: newFailure ?? failure, details: newDetails ?? details);
  }
}
