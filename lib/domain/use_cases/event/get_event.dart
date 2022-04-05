import 'package:uod/core/core.dart';
import 'package:uod/domain/entities/event_detail.dart';
import 'package:uod/domain/repositories/event/event_detail_repository.dart';

class GetEventUseCase implements UseCase<EventDetail,String>{
  final EventDetailRepository eventDetailRepository;
  GetEventUseCase({required this.eventDetailRepository});

  @override
  Future<Result<Failure, EventDetail?>> call(String input) {
   return eventDetailRepository.getDetails(input);
  }

}