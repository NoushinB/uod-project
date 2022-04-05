import 'package:equatable/equatable.dart';

abstract class EventDetailEvent extends Equatable{
  const EventDetailEvent();

  @override
  List<Object> get props =>[];
}
class FetchEventDetail extends EventDetailEvent{
final String eventCode;
const FetchEventDetail({required this.eventCode});

@override
List<Object> get props=> [eventCode];
}