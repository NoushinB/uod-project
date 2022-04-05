import 'package:equatable/equatable.dart';
import 'package:uod/core/core.dart';
import 'package:uod/core/utils/enums/bloc_status.dart';
import 'package:uod/domain/entities/event_detail.dart';

 class EventDetailState extends Equatable{
 final BlocStatus blocStatus;
 final Failure? failure;
 final EventDetail? eventDetail;

   const EventDetailState({required this.blocStatus, this.failure,this.eventDetail});

 @override
 List<Object?> get props => [blocStatus, failure,eventDetail];

 EventDetailState copyWith({BlocStatus? newBlocStatus,Failure? newFailure, EventDetail? newEventDetail}){
   return EventDetailState(blocStatus: newBlocStatus??blocStatus,failure: newFailure?? failure, eventDetail: newEventDetail??eventDetail);
 }
}