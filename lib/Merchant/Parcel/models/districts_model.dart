// To parse this JSON data, do
//
//     final districtsModel = districtsModelFromJson(jsonString);

import 'dart:convert';

DistrictsModel districtsModelFromJson(String str) =>
    DistrictsModel.fromJson(json.decode(str));

String districtsModelToJson(DistrictsModel data) => json.encode(data.toJson());

class DistrictsModel {
  DistrictsModel({
    this.success,
    this.districtList,
  });

  bool success;
  List<DistrictList> districtList;

  factory DistrictsModel.fromJson(Map<String, dynamic> json) => DistrictsModel(
        success: json["success"],
        districtList: List<DistrictList>.from(
            json["district_list"].map((x) => DistrictList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "district_list":
            List<dynamic>.from(districtList.map((x) => x.toJson())),
      };
}

class DistrictList {
  DistrictList({
    this.id,
    this.name,
    this.divisionId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  dynamic divisionId;
  DateTime createdAt;
  DateTime updatedAt;

  factory DistrictList.fromJson(Map<String, dynamic> json) => DistrictList(
        id: json["id"],
        name: json["name"],
        divisionId: json["division_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "division_id": divisionId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
