import 'package:equatable/equatable.dart';

class ApplyDetail extends Equatable{
  final String eventId;
  final String eventTitle;
  final String applicantEmployeeId;

  const ApplyDetail({required this.eventId, required this.eventTitle, required this.applicantEmployeeId});

  @override
  List<Object?> get props => [eventId,eventTitle,applicantEmployeeId];
}
