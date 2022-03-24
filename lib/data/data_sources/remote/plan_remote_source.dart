import 'package:dio/dio.dart';
import 'package:uod/core/core.dart';
import 'package:uod/data/models/plan_model.dart';

abstract class PlanRemoteSource {
  Future<List<PlanModel>> getSpecialPlans(int posterId);
}

class PlanRemoteSourceImpl implements PlanRemoteSource {
  final Dio dio;

  const PlanRemoteSourceImpl({required this.dio});

  @override
  Future<List<PlanModel>> getSpecialPlans(int posterId) async {
    try {
      Map<String, dynamic> header = {
        "Accept-Language": "ku-Arab",
      };
      var response = await dio.get(NetworkPath.getSpecialPlans(posterId), options: Options(headers: header));
      ErrorHelper.ensureSuccessResponse(response, defaultMsg: "");
      return (response.data as List).map((i) => PlanModel.fromJson(i)).toList();
    } catch (ex) {
      rethrow;
    }
  }
}
