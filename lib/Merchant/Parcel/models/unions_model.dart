// To parse this JSON data, do
//
//     final unionsModel = unionsModelFromJson(jsonString);

import 'dart:convert';

UnionsModel unionsModelFromJson(String str) =>
    UnionsModel.fromJson(json.decode(str));

String unionsModelToJson(UnionsModel data) => json.encode(data.toJson());

class UnionsModel {
  UnionsModel({
    this.success,
    this.unionList,
  });

  bool success;
  List<UnionList> unionList;

  factory UnionsModel.fromJson(Map<String, dynamic> json) => UnionsModel(
        success: json["success"],
        unionList: List<UnionList>.from(
            json["union_list"].map((x) => UnionList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "union_list": List<dynamic>.from(unionList.map((x) => x.toJson())),
      };
}

class UnionList {
  UnionList({
    this.id,
    this.zonename,
    this.areaId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String zonename;
  String areaId;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory UnionList.fromJson(Map<String, dynamic> json) => UnionList(
        id: json["id"],
        zonename: json["zonename"],
        areaId: json["area_id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "zonename": zonename,
        "area_id": areaId,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
