import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uod/core/utils/enums/bloc_status.dart';
import 'package:uod/domain/use_cases/event/get_event.dart';
import 'package:uod/presentation/bloc/event_detail/event_detail_event.dart';
import 'package:uod/presentation/bloc/event_detail/event_detail_state.dart';

class EventDetailBloc extends Bloc<EventDetailEvent, EventDetailState> {
  final GetEventUseCase getEventUseCase;

  EventDetailBloc({required this.getEventUseCase}) : super(const EventDetailState(blocStatus: BlocStatus.uninitialized)) {
    on<FetchEventDetail>(_onFetchEventDetail);
  }

  Future<void> _onFetchEventDetail(FetchEventDetail eventDetail, Emitter<EventDetailState> emit) async {
    emit(state.copyWith(newBlocStatus: BlocStatus.loading));
    var result = await getEventUseCase.call(eventDetail.eventCode);
    if (result.isSuccess()) {
      emit(state.copyWith(newBlocStatus: BlocStatus.loaded, newEventDetail: result.getSuccess()));
    } else {
      emit(state.copyWith(newBlocStatus: BlocStatus.error, newFailure: result.getError()));
    }
  }
}
