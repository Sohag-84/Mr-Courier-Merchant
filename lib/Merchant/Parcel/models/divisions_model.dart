// To parse this JSON data, do
//
//     final divisionsModel = divisionsModelFromJson(jsonString);

import 'dart:convert';

List<DivisionsModel> divisionsModelFromJson(String str) =>
    List<DivisionsModel>.from(
        json.decode(str).map((x) => DivisionsModel.fromJson(x)));

String divisionsModelToJson(List<DivisionsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DivisionsModel {
  DivisionsModel({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  factory DivisionsModel.fromJson(Map<String, dynamic> json) => DivisionsModel(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
