// To parse this JSON data, do
//
//     final parcelTrackModel = parcelTrackModelFromJson(jsonString);

import 'dart:convert';

ParcelTrackModel parcelTrackModelFromJson(String str) =>
    ParcelTrackModel.fromJson(json.decode(str));

String parcelTrackModelToJson(ParcelTrackModel data) =>
    json.encode(data.toJson());

class ParcelTrackModel {
  ParcelTrackModel({
    this.success,
    this.message,
    this.data,
    this.parcel,
  });

  bool success;
  String message;
  List<Datum> data;
  Parcel parcel;

  factory ParcelTrackModel.fromJson(Map<String, dynamic> json) =>
      ParcelTrackModel(
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
  Datum({
    this.id,
    this.parcelId,
    this.note,
    this.createdAt,
    this.updatedAt,
    this.notes,
  });

  int id;
  int parcelId;
  String note;
  DateTime createdAt;
  DateTime updatedAt;
  Notes notes;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        parcelId: json["parcelId"],
        note: json["note"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        notes: json["notes"] == null ? null : Notes.fromJson(json["notes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parcelId": parcelId,
        "note": note,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "notes": notes == null ? null : notes.toJson(),
      };
}

class Notes {
  Notes({
    this.id,
    this.title,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String title;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Notes.fromJson(Map<String, dynamic> json) => Notes(
        id: json["id"],
        title: json["title"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Parcel {
  Parcel({
    this.id,
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
    this.payReturn,
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
    this.productName,
    this.productColor,
    this.productQty,
    this.productWeight,
    this.trackingCode,
    this.percelType,
    this.helpNumber,
    this.reciveZone,
    this.orderType,
    this.codType,
    this.paymentOption,
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

  int id;
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
  int payReturn;
  int codCharge;
  dynamic productPrice;
  int deliverymanId;
  int deliverymanAmount;
  dynamic dPayinvoice;
  dynamic deliverymanPaystatus;
  dynamic pickupmanId;
  dynamic agentId;
  dynamic agentAmount;
  dynamic aPayinvoice;
  dynamic agentPaystatus;
  String productName;
  String productColor;
  int productQty;
  int productWeight;
  String trackingCode;
  int percelType;
  dynamic helpNumber;
  String reciveZone;
  int orderType;
  int codType;
  int paymentOption;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  String firstName;
  dynamic lastName;
  String phoneNumber;
  String emailAddress;
  String companyName;
  int mstatus;
  int mid;

  factory Parcel.fromJson(Map<String, dynamic> json) => Parcel(
        id: json["id"],
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
        payReturn: json["pay_return"],
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
        productName: json["productName"],
        productColor: json["productColor"],
        productQty: json["productQty"],
        productWeight: json["productWeight"],
        trackingCode: json["trackingCode"],
        percelType: json["percelType"],
        helpNumber: json["helpNumber"],
        reciveZone: json["reciveZone"],
        orderType: json["orderType"],
        codType: json["codType"],
        paymentOption: json["payment_option"],
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
        "pay_return": payReturn,
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
        "productName": productName,
        "productColor": productColor,
        "productQty": productQty,
        "productWeight": productWeight,
        "trackingCode": trackingCode,
        "percelType": percelType,
        "helpNumber": helpNumber,
        "reciveZone": reciveZone,
        "orderType": orderType,
        "codType": codType,
        "payment_option": paymentOption,
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
