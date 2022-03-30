import 'package:uod/core/core.dart';
import 'package:uod/core/error/failure.dart';
import 'package:uod/core/utils/generics/multiple_results.dart';
import 'package:uod/data/data_sources/remote/attendance_source.dart';
import 'package:uod/domain/entities/confirm_attendance.dart';
import 'package:uod/domain/repositories/attendance/attendance_repository.dart';

class AttendanceRepositoryImpl implements AttendanceRepository{
  final AttendanceSource attendanceSource;
  final InternetInfoService internetInfoService;
const AttendanceRepositoryImpl({required this.attendanceSource,required this.internetInfoService});
  @override
  Future<Result<Failure, ConfirmAttendance>> confirmAttendance(String eventCode) async{
    try{
      if(await internetInfoService.hasConnection()){
        final result= await attendanceSource.confirmAttendance(eventCode);
        return Success(result);
      }
      return Error(NotConnectedFailure());

    }on Exception{return Error(ServerFailure());}
  }

}