// To parse this JSON data, do
//
//     final trackParcelNotesModel = trackParcelNotesModelFromJson(jsonString);

import 'dart:convert';

TrackParcelNotesModel trackParcelNotesModelFromJson(String str) =>
    TrackParcelNotesModel.fromJson(json.decode(str));

String trackParcelNotesModelToJson(TrackParcelNotesModel data) =>
    json.encode(data.toJson());

class TrackParcelNotesModel {
  bool success;
  String message;
  List<Datum> data;
  Parcel parcel;

  TrackParcelNotesModel({
    this.success,
    this.message,
    this.data,
    this.parcel,
  });

  factory TrackParcelNotesModel.fromJson(Map<String, dynamic> json) =>
      TrackParcelNotesModel(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        parcel: Parcel.fromJson(json["parcel"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "parcel": parcel.toJson(),
      };
}

class Datum {
  int id;
  int parcelId;
  String note;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    this.id,
    this.parcelId,
    this.note,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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

class Parcel {
  int id;
  int areaId;
  dynamic divisionId;
  dynamic upDistrictId;
  String reciveZone;
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
  String note;
  int deliveryCharge;
  int codCharge;
  dynamic productPrice;
  int deliverymanId;
  int deliverymanAmount;
  dynamic dPayinvoice;
  dynamic deliverymanPaystatus;
  int pickupmanId;
  dynamic agentId;
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
  dynamic salePrice;
  dynamic invoiceId;
  dynamic verifyToken;
  String verifyStatus;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  String firstName;
  dynamic lastName;
  String phoneNumber;
  dynamic emailAddress;
  String companyName;
  int mstatus;
  int mid;

  Parcel({
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
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.emailAddress,
    this.companyName,
    this.mstatus,
    this.mid,
  });

  factory Parcel.fromJson(Map<String, dynamic> json) => Parcel(
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
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        emailAddress: json["emailAddress"],
        companyName: json["companyName"],
        mstatus: json["mstatus"],
        mid: json["mid"],
      );

  Map<String, dynamic> toJson() => {
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
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "emailAddress": emailAddress,
        "companyName": companyName,
        "mstatus": mstatus,
        "mid": mid,
      };
}
