// To parse this JSON data, do
//
//     final getAreaModel = getAreaModelFromJson(jsonString);

import 'dart:convert';

GetAreaModel getAreaModelFromJson(String str) =>
    GetAreaModel.fromJson(json.decode(str));

String getAreaModelToJson(GetAreaModel data) => json.encode(data.toJson());

class GetAreaModel {
  GetAreaModel({
    this.success,
    this.areaList,
  });

  bool success;
  List<AreaList> areaList;

  factory GetAreaModel.fromJson(Map<String, dynamic> json) => GetAreaModel(
        success: json["success"],
        areaList: List<AreaList>.from(
            json["area_list"].map((x) => AreaList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "area_list": List<dynamic>.from(areaList.map((x) => x.toJson())),
      };
}

class AreaList {
  AreaList({
    this.id,
    this.name,
    this.districtId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  int districtId;
  DateTime createdAt;
  DateTime updatedAt;

  factory AreaList.fromJson(Map<String, dynamic> json) => AreaList(
        id: json["id"],
        name: json["name"],
        districtId: json["district_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "district_id": districtId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
