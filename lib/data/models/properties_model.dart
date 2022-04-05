import 'package:uod/domain/entities/properties.dart';

class PropertiesModel extends Properties {
  const PropertiesModel({
    required String name,
    required String title,
    required String value,
  }) : super(name: name, title: title, value: value);

  factory PropertiesModel.fromJson(Map<String, dynamic> json) {
    return PropertiesModel(
      name: json["name"],
      title: json["title"],
      value: json["value"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json["name"] = name;
    json["title"] = title;
    json["value"] = value;
    return json;
  }
}
