import 'package:uod/core/core.dart';
import 'package:uod/domain/entities/confirm_attendance.dart';

abstract class AttendanceRepository{
  Future<Result<Failure,ConfirmAttendanceEntity?>> confirmAttendance(String eventCode);
}