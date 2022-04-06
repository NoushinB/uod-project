import 'package:uod/data/models/properties_model.dart';
import 'package:uod/domain/entities/apply_detail.dart';
import 'package:uod/domain/entities/event_detail.dart';
import 'package:uod/domain/entities/properties.dart';

class EventDetailModel extends EventDetail {
  final bool hasError;
  final int statusCode;
  final String? message;
  final String category;
  final String? description;
  final String? eventStatus;
  final String? profileStatus;
  final String topic;
  final String createdAt;
  final String categoryId;
  final String startDate;
  final String lastEventDate;
  final int? eventThreshold;
  final int? points;

  const EventDetailModel({
    required this.hasError,
    required this.statusCode,
    this.message,
    required this.category,
    this.description,
    this.eventStatus,
    this.profileStatus,
    required this.topic,
    required this.createdAt,
    required this.categoryId,
    required this.startDate,
    required this.lastEventDate,
    this.eventThreshold,
    this.points,
    required int activityType,
    List<Properties>? properties,
    ApplyDetail? applyDetail,
  }) : super(activityType: activityType, properties: properties, applyDetail: applyDetail);

  factory EventDetailModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic>? dataJson;
    if (json["data"] != null) {
      dataJson = json["data"] as Map<String, dynamic>;
    }

    // Properties
    /*if (dataJson!["properties"] != null) {
      propertiesJson = dataJson["properties"] as Map<String, dynamic>;
    }
    List<Properties>? properties;
    if (propertiesJson != null) {
      properties = (propertiesJson as List).map((p) => Properties(name: p["name"], title: p["title"], value: p["value"],)).toList();
    }*/

    // Apply Details
    Map<String, dynamic>? applyJson;
    if (dataJson?["applyDetails"] != null) {
      applyJson = dataJson?["applyDetails"] as Map<String, dynamic>;
    }
    ApplyDetail? applyDetail;
    if (applyJson != null) {
      applyDetail = ApplyDetail(
        applicantEmployeeId: applyJson["applicantEmployeeId"],
        eventTitle: applyJson["eventTitle"],
        eventId: applyJson["eventId"],
      );
    }

    return EventDetailModel(
      hasError: json["hasError"],
      statusCode: json["statusCode"],
      message: json["message"],
      category: dataJson != null ? dataJson["category"] ?? "" : "",
      topic: dataJson != null ? dataJson["topic"] ?? "" : "",
      createdAt: dataJson != null ? dataJson["createdAt"] ?? "" : "",
      categoryId: dataJson != null ? dataJson["categoryId"] ?? "" : "",
      startDate: dataJson != null ? dataJson["startDate"] ?? "" : "",
      lastEventDate: dataJson != null ? dataJson["lastEventDate"] ?? "" : "",
      activityType: dataJson != null ? dataJson["activityType"] ?? "" : "",
      applyDetail: applyDetail,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};

    // Get Properties List Json
    var propertiesList = properties?.map((e) => PropertiesModel(name: e.name, title: e.title, value: e.value)).toList();
    var propertiesListJson = <Map<String, dynamic>>[];
    if (propertiesList != null) {
      propertiesListJson = propertiesList.map((e) => e.toJson()).toList();
    }

    // Get Apply Details Json

    json["hasError"] = hasError;
    json["statusCode"] = statusCode;
    json["message"] = message;
    json["category"] = category;
    json["topic"] = topic;
    json["createdAt"] = createdAt;
    json["categoryId"] = categoryId;
    json["startDate"] = startDate;
    json["lastEventDate"] = lastEventDate;
    json["activityType"] = activityType;
    json["properties"] = propertiesListJson;
    json["applyDetail"] = applyDetail;
    return json;
  }
}
