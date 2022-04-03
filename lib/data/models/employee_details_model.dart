import 'package:flutter/cupertino.dart';
import 'package:uod/domain/entities/employee_details.dart';

class EmployeeDetailsModel extends EmployeeDetails {
  final bool hasError;
  final int statusCode;
  final String? message;

  const EmployeeDetailsModel({
    required this.hasError,
    required this.statusCode,
    this.message,
    required String employeeId,
    required String employeeCode,
    required String fullName,
    required String positionTitle,
     required String image,
  }) : super(
          employeeId: employeeId,
          employeeCode: employeeCode,
          fullName: fullName,
          positionTitle: positionTitle,
    image: image,
        );

  factory EmployeeDetailsModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic>? dataJson;

    if (json["data"] != null) {
      dataJson = json["data"] as Map<String, dynamic>;
    }

    return EmployeeDetailsModel(
      hasError: json["hasError"],
      statusCode: json["statusCode"],
      message: json["message"],
      employeeId: dataJson != null ? dataJson["employeeId"] : null,
      employeeCode: dataJson != null ? dataJson["employeeCode"] : null,
      fullName: dataJson != null ? dataJson["fullName"] : null,
      positionTitle: dataJson != null ? dataJson["positionTitle"] : null,
      image: dataJson != null ? dataJson["image"] : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json["hasError"] = hasError;
    json["statusCode"] = statusCode;
    json["message"] = message;
    json["data"]["employeeId"] = employeeId;
    json["data"]["employeeCode"] = employeeId;
    json["data"]["fullName"] = employeeId;
    json["data"]["positionTitle"] = employeeId;
    json["data"]["image"] = image;

    return json;
  }
}
