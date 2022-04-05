

import 'package:uod/core/core.dart';
import 'package:uod/data/data_sources/remote/event_source.dart';
import 'package:uod/domain/entities/event_detail.dart';
import 'package:uod/domain/repositories/event/event_detail_repository.dart';

class EventDetailRepositoryImpl implements EventDetailRepository {
  final EventSource eventSource;
  final InternetInfoService internetInfoService;

  EventDetailRepositoryImpl({required this.eventSource, required this.internetInfoService});

  @override
  Future<Result<Failure, EventDetail>> getDetails(String eventCode)async {
    try {
      if (await internetInfoService.hasConnection()) {
    final result = await eventSource.getDetail(eventCode);
    return Success(result);
    }
    return Error(NotConnectedFailure());
    } on ServerException {
    return Error(ServerFailure());
    }
  }


}
