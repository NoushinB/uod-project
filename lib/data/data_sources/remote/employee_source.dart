import 'package:dio/dio.dart';
import 'package:uod/core/core.dart';
import 'package:uod/data/models/employee_details_model.dart';

abstract class EmployeeSource {
  Future<EmployeeDetailsModel> getDetails();
}

class EmployeeSourceImpl implements EmployeeSource {
  final Dio dio;

  EmployeeSourceImpl({required this.dio});

  @override
  Future<EmployeeDetailsModel> getDetails() async {
    try {
      var response = await dio.get(NetworkPath.findEmployeeById());
      ErrorHelper.ensureSuccessResponse(response, defaultMsg: "");
      return EmployeeDetailsModel.fromJson(response.data);
    } catch (ex) {
      throw ServerException();
    }
  }
}
