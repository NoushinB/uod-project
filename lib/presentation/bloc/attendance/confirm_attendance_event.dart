import 'package:equatable/equatable.dart';

abstract class ConfirmAttendanceEvent extends Equatable{

 const ConfirmAttendanceEvent();

 @override
  List<Object> get props=> [];
}
class DoAttendance extends ConfirmAttendanceEvent{
  final String eventCode;

  const DoAttendance({required this.eventCode});
  @override
  List<Object> get props=> [eventCode];
}