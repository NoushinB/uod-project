import 'package:equatable/equatable.dart';
import 'package:uod/domain/entities/plan.dart';

class Explanation extends Equatable {
  final String icon;
  final String title;

  const Explanation({required this.icon, required this.title});

  @override
  List<Object> get props => [icon, title];

  factory Explanation.fromJson(Map<String, dynamic> json) {
    return Explanation(icon: json["icon"], title: json["title"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json["title"] = title;
    json["icon"] = icon;
    return json;
  }
}

class PlanModel extends Plan {
  final int id;
  final int type;
  final double fee;
  final bool isApplied;
  final int stars;
  final String colorCode;
  final List<Explanation> explanations;

  const PlanModel({
    required String title,
    required String icon,
    required this.id,
    required this.colorCode,
    required this.fee,
    required this.explanations,
    required this.isApplied,
    required this.stars,
    required this.type,
  }) : super(title, icon);

  factory PlanModel.fromJson(Map<String, dynamic> json) {
    return PlanModel(
      title: json["title"],
      icon: json["icon"],
      id: json["id"],
      colorCode: json["colorCode"],
      fee: json["fee"],
      explanations: (json['explanations'] as List).map((i) => Explanation.fromJson(i)).toList(),
      isApplied: json["isApplied"],
      stars: json["stars"],
      type: json["type"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json["title"] = title;
    json["icon"] = icon;
    json["id"] = id;
    json["colorCode"] = colorCode;
    json["fee"] = fee;
    json["explanations"] = explanations.map((v) => v.toJson()).toList();
    json["isApplied"] = isApplied;
    json["stars"] = stars;
    json["type"] = type;
    return json;
  }
}
