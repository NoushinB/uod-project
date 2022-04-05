import 'package:uod/domain/entities/apply_detail.dart';

class ApplyDetailModel extends ApplyDetail {
  final int eventStatus;
  final String eventCategoryId;
  final int status;
  final String rejectNote;
  final String createdAt;
  final String id;

  const ApplyDetailModel(
    this.eventStatus,
    this.eventCategoryId,
    this.status,
    this.rejectNote,
    this.createdAt,
    this.id, {
    required String eventId,
    required String eventTitle,
    required String applicantEmployeeId,
  }) : super(
          eventId: eventId,
          eventTitle: eventTitle,
          applicantEmployeeId: applicantEmployeeId,
        );

  factory ApplyDetailModel.fromJson(Map<String, dynamic> json) {
    return ApplyDetailModel(
      json["eventStatus"],
      json["eventCategoryId"],
      json["status"],
      json["rejectNote"],
      json["createdAt"],
      json["id"],
      eventId:json ["eventId"],
      eventTitle: json["eventTitle"],
      applicantEmployeeId: json["applicantEmployeeId"],
    );
  }
}
