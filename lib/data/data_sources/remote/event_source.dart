import 'package:dio/dio.dart';
import 'package:uod/core/core.dart';
import 'package:uod/data/models/event_detail_model.dart';

abstract class EventSource {
  Future<EventDetailModel> getDetail(String eventCode);
}

class EventSourceImpl implements EventSource {
  final Dio dio;

  EventSourceImpl({required this.dio});

  @override
  Future<EventDetailModel> getDetail(String eventCode) async {
    try {
      var response = await dio.get(NetworkPath.eventDetail(eventCode));
      ErrorHelper.ensureSuccessResponse(response, defaultMsg: "");
      return EventDetailModel.fromJson(response.data);
    } catch (ex) {
      throw ServerException();
    }
  }
}
