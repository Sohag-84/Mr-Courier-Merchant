// To parse this JSON data, do
//
//     final chargeOfDeliveryModel = chargeOfDeliveryModelFromJson(jsonString);

import 'dart:convert';

List<ChargeOfDeliveryModel> chargeOfDeliveryModelFromJson(String str) =>
    List<ChargeOfDeliveryModel>.from(
        json.decode(str).map((x) => ChargeOfDeliveryModel.fromJson(x)));

String chargeOfDeliveryModelToJson(List<ChargeOfDeliveryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChargeOfDeliveryModel {
  ChargeOfDeliveryModel({
    this.id,
    this.merchantId,
    this.packageId,
    this.delivery,
    this.extradelivery,
    this.cod,
    this.codpercent,
  });

  int id;
  dynamic merchantId;
  dynamic packageId;
  dynamic delivery;
  dynamic extradelivery;
  dynamic cod;
  dynamic codpercent;

  factory ChargeOfDeliveryModel.fromJson(Map<String, dynamic> json) =>
      ChargeOfDeliveryModel(
        id: json["id"],
        merchantId: json["merchantId"],
        packageId: json["packageId"],
        delivery: json["delivery"],
        extradelivery: json["extradelivery"],
        cod: json["cod"],
        codpercent: json["codpercent"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "merchantId": merchantId,
        "packageId": packageId,
        "delivery": delivery,
        "extradelivery": extradelivery,
        "cod": cod,
        "codpercent": codpercent,
      };
}
