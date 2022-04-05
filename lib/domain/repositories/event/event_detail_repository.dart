import 'package:uod/core/core.dart';
import 'package:uod/domain/entities/event_detail.dart';

abstract class EventDetailRepository{
  Future<Result<Failure,EventDetail>> getDetails(String eventCode);

}