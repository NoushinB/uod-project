import 'package:equatable/equatable.dart';

class EmployeeDetails extends Equatable {
  final String employeeId;
  final String employeeCode;
  final String fullName;
  final String positionTitle;
  final String birthDate;
  final String? personalEmail;
  final String? image;

  const EmployeeDetails({
    required this.employeeId,
    required this.employeeCode,
    required this.fullName,
    required this.positionTitle,
    required this.birthDate,
    this.personalEmail,
    this.image,
  });

  @override
  List<Object?> get props => [employeeId, employeeCode, fullName, positionTitle, birthDate, personalEmail, image];
}
