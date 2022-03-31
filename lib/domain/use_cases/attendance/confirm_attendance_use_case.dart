import 'package:uod/core/error/failure.dart';
import 'package:uod/core/utils/generics/multiple_results.dart';
import 'package:uod/core/utils/generics/use_case.dart';
import 'package:uod/domain/entities/confirm_attendance.dart';
import 'package:uod/domain/repositories/attendance/attendance_repository.dart';

class ConfirmAttendanceUseCase implements UseCase<ConfirmAttendanceEntity, String> {
  final AttendanceRepository attendanceRepository;

  const ConfirmAttendanceUseCase({required this.attendanceRepository});

  @override
  Future<Result<Failure, ConfirmAttendanceEntity?>> call(String input) {
    return attendanceRepository.confirmAttendance(input);
  }
}
