import 'package:equatable/equatable.dart';

class EmployeeDetails extends Equatable {
  final String employeeId;
  final String employeeCode;
  final String fullName;
  final String positionTitle;

  const EmployeeDetails({
    required this.employeeId,
    required this.employeeCode,
    required this.fullName,
    required this.positionTitle,
  });

  @override
  List<Object?> get props => [employeeId, employeeCode, fullName, positionTitle];
}
