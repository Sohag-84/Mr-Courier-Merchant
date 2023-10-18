// To parse this JSON data, do
//
//     final trackModel = trackModelFromJson(jsonString);

import 'dart:convert';

TrackModel trackModelFromJson(String str) =>
    TrackModel.fromJson(json.decode(str));

String trackModelToJson(TrackModel data) => json.encode(data.toJson());

class TrackModel {
  bool success;
  String message;
  Parcel parcel;
  List<TrackInfo> trackInfos;

  TrackModel({
    this.success,
    this.message,
    this.parcel,
    this.trackInfos,
  });

  factory TrackModel.fromJson(Map<String, dynamic> json) => TrackModel(
        success: json["success"],
        message: json["message"],
        parcel: Parcel.fromJson(json["parcel"]),
        trackInfos: List<TrackInfo>.from(
            json["trackInfos"].map((x) => TrackInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "parcel": parcel.toJson(),
        "trackInfos": List<dynamic>.from(trackInfos.map((x) => x.toJson())),
      };
}

class Parcel {
  String firstName;
  dynamic lastName;
  String phoneNumber;
  dynamic emailAddress;
  String companyName;
  int mstatus;
  int mid;
  int id;
  int areaId;
  int divisionId;
  int upDistrictId;
  dynamic reciveZone;
  dynamic invoiceNo;
  int merchantId;
  dynamic paymentInvoice;
  int cod;
  int merchantAmount;
  int merchantDue;
  dynamic merchantpayStatus;
  int merchantPaid;
  String recipientName;
  String recipientAddress;
  String recipientPhone;
  dynamic note;
  int deliveryCharge;
  int codCharge;
  dynamic productPrice;
  int deliverymanId;
  int deliverymanAmount;
  dynamic dPayinvoice;
  dynamic deliverymanPaystatus;
  int pickupmanId;
  dynamic agentId;
  dynamic courierId;
  dynamic courierMetadata;
  dynamic agentAmount;
  dynamic aPayinvoice;
  dynamic agentPaystatus;
  int productWeight;
  String trackingCode;
  int percelType;
  dynamic helpNumber;
  int orderType;
  dynamic secondaryPhone;
  int codType;
  String salePrice;
  dynamic invoiceId;
  dynamic verifyToken;
  String verifyStatus;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  String deliverymanName;
  String deliverymanPhone;
  String pickupmanName;
  String pickupmanPhone;

  Parcel({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.emailAddress,
    this.companyName,
    this.mstatus,
    this.mid,
    this.id,
    this.areaId,
    this.divisionId,
    this.upDistrictId,
    this.reciveZone,
    this.invoiceNo,
    this.merchantId,
    this.paymentInvoice,
    this.cod,
    this.merchantAmount,
    this.merchantDue,
    this.merchantpayStatus,
    this.merchantPaid,
    this.recipientName,
    this.recipientAddress,
    this.recipientPhone,
    this.note,
    this.deliveryCharge,
    this.codCharge,
    this.productPrice,
    this.deliverymanId,
    this.deliverymanAmount,
    this.dPayinvoice,
    this.deliverymanPaystatus,
    this.pickupmanId,
    this.agentId,
    this.courierId,
    this.courierMetadata,
    this.agentAmount,
    this.aPayinvoice,
    this.agentPaystatus,
    this.productWeight,
    this.trackingCode,
    this.percelType,
    this.helpNumber,
    this.orderType,
    this.secondaryPhone,
    this.codType,
    this.salePrice,
    this.invoiceId,
    this.verifyToken,
    this.verifyStatus,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deliverymanName,
    this.deliverymanPhone,
    this.pickupmanName,
    this.pickupmanPhone,
  });

  factory Parcel.fromJson(Map<String, dynamic> json) => Parcel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        emailAddress: json["emailAddress"],
        companyName: json["companyName"],
        mstatus: json["mstatus"],
        mid: json["mid"],
        id: json["id"],
        areaId: json["area_id"],
        divisionId: json["division_id"],
        upDistrictId: json["up_district_id"],
        reciveZone: json["reciveZone"],
        invoiceNo: json["invoiceNo"],
        merchantId: json["merchantId"],
        paymentInvoice: json["paymentInvoice"],
        cod: json["cod"],
        merchantAmount: json["merchantAmount"],
        merchantDue: json["merchantDue"],
        merchantpayStatus: json["merchantpayStatus"],
        merchantPaid: json["merchantPaid"],
        recipientName: json["recipientName"],
        recipientAddress: json["recipientAddress"],
        recipientPhone: json["recipientPhone"],
        note: json["note"],
        deliveryCharge: json["deliveryCharge"],
        codCharge: json["codCharge"],
        productPrice: json["productPrice"],
        deliverymanId: json["deliverymanId"],
        deliverymanAmount: json["deliverymanAmount"],
        dPayinvoice: json["dPayinvoice"],
        deliverymanPaystatus: json["deliverymanPaystatus"],
        pickupmanId: json["pickupmanId"],
        agentId: json["agentId"],
        courierId: json["courierId"],
        courierMetadata: json["courierMetadata"],
        agentAmount: json["agentAmount"],
        aPayinvoice: json["aPayinvoice"],
        agentPaystatus: json["agentPaystatus"],
        productWeight: json["productWeight"],
        trackingCode: json["trackingCode"],
        percelType: json["percelType"],
        helpNumber: json["helpNumber"],
        orderType: json["orderType"],
        secondaryPhone: json["secondaryPhone"],
        codType: json["codType"],
        salePrice: json["sale_price"],
        invoiceId: json["invoice_id"],
        verifyToken: json["verifyToken"],
        verifyStatus: json["verifyStatus"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deliverymanName: json["deliveryman_name"],
        deliverymanPhone: json["deliveryman_phone"],
        pickupmanName: json["pickupman_name"],
        pickupmanPhone: json["pickupman_phone"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "emailAddress": emailAddress,
        "companyName": companyName,
        "mstatus": mstatus,
        "mid": mid,
        "id": id,
        "area_id": areaId,
        "division_id": divisionId,
        "up_district_id": upDistrictId,
        "reciveZone": reciveZone,
        "invoiceNo": invoiceNo,
        "merchantId": merchantId,
        "paymentInvoice": paymentInvoice,
        "cod": cod,
        "merchantAmount": merchantAmount,
        "merchantDue": merchantDue,
        "merchantpayStatus": merchantpayStatus,
        "merchantPaid": merchantPaid,
        "recipientName": recipientName,
        "recipientAddress": recipientAddress,
        "recipientPhone": recipientPhone,
        "note": note,
        "deliveryCharge": deliveryCharge,
        "codCharge": codCharge,
        "productPrice": productPrice,
        "deliverymanId": deliverymanId,
        "deliverymanAmount": deliverymanAmount,
        "dPayinvoice": dPayinvoice,
        "deliverymanPaystatus": deliverymanPaystatus,
        "pickupmanId": pickupmanId,
        "agentId": agentId,
        "courierId": courierId,
        "courierMetadata": courierMetadata,
        "agentAmount": agentAmount,
        "aPayinvoice": aPayinvoice,
        "agentPaystatus": agentPaystatus,
        "productWeight": productWeight,
        "trackingCode": trackingCode,
        "percelType": percelType,
        "helpNumber": helpNumber,
        "orderType": orderType,
        "secondaryPhone": secondaryPhone,
        "codType": codType,
        "sale_price": salePrice,
        "invoice_id": invoiceId,
        "verifyToken": verifyToken,
        "verifyStatus": verifyStatus,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deliveryman_name": deliverymanName,
        "deliveryman_phone": deliverymanPhone,
        "pickupman_name": pickupmanName,
        "pickupman_phone": pickupmanPhone,
      };
}

class TrackInfo {
  int id;
  int parcelId;
  String note;
  DateTime createdAt;
  DateTime updatedAt;

  TrackInfo({
    this.id,
    this.parcelId,
    this.note,
    this.createdAt,
    this.updatedAt,
  });

  factory TrackInfo.fromJson(Map<String, dynamic> json) => TrackInfo(
        id: json["id"],
        parcelId: json["parcelId"],
        note: json["note"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parcelId": parcelId,
        "note": note,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
