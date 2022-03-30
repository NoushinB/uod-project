import 'package:uod/domain/entities/confirm_attendance.dart';

class ConfirmAttendanceModel extends ConfirmAttendance {
  final bool hasError;
  final int statusCode;
  final String? message;
  final String? data;

  const ConfirmAttendanceModel({
    required this.hasError,
    required this.statusCode,
    this.message,
    this.data,
  });

  factory ConfirmAttendanceModel.fromJson(Map<String, dynamic> json) {
    return ConfirmAttendanceModel(
      hasError: json["hasError"],
      statusCode: json["statusCode"],
      message: json["message"],
      data: json["data"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json["hasError"] = hasError;
    json["statusCode"] = statusCode;
    json["message"] = message;
    json["data"] = data;
    return json;
  }
}
