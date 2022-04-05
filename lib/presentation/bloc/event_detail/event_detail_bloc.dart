import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uod/core/utils/enums/bloc_status.dart';
import 'package:uod/domain/use_cases/event/get_event.dart';
import 'package:uod/presentation/bloc/employee/employee_detail_state.dart';
import 'package:uod/presentation/bloc/event_detail/event_detail_event.dart';
import 'package:uod/presentation/bloc/event_detail/event_detail_state.dart';

class EventDetaiBloc extends Bloc<EventDetailEvent, EventDetailState> {
  final GetEventUseCase getEventUseCase;

  EventDetaiBloc({required this.getEventUseCase}) : super(const EmployeeDetailState(Status: BlocStatus.uninitialized))

  on<FetchEventDetail>(_onFetchEventDetail);

}

Future<void>_onFetchEventDetail(FetchEventDetail eventDetail,Emitter<EventDetailState> emit)async{
  emit(state.copyWith(newStatus: BlocStatus.loading));
  var result = await getEventUsecase
}