import 'package:dio/dio.dart';
import 'package:uod/core/core.dart';
import 'package:uod/data/models/confirm_attendance_model.dart';

abstract class AttendanceSource {
  Future<ConfirmAttendanceModel> confirmAttendance(String eventCode);
}

class AttendanceSourceImpl implements AttendanceSource {
  final Dio dio;

  const AttendanceSourceImpl({required this.dio});

  @override
  Future<ConfirmAttendanceModel> confirmAttendance(String eventCode) async {
    try {
      var response = await dio.get(NetworkPath.confirmAttendance(eventCode));
      ErrorHelper.ensureSuccessResponse(response, defaultMsg: "");
      return ConfirmAttendanceModel.fromJson(response.data);
    } catch (ex) {
      throw ServerException();
    }
    ;
  }
}
