// ignore_for_file: file_names

class ParcelDetailModel {
  bool success;
  String message;
  Data data;
  List<ParcelNotes> parcelNotes;

  ParcelDetailModel({this.success, this.message, this.data, this.parcelNotes});

  ParcelDetailModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    if (json['parcel_notes'] != null) {
      parcelNotes = <ParcelNotes>[];
      json['parcel_notes'].forEach((v) {
        parcelNotes.add(ParcelNotes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    if (parcelNotes != null) {
      data['parcel_notes'] = parcelNotes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  dynamic title;
  dynamic zoneName;
  dynamic id;
  dynamic invoiceNo;
  dynamic merchantId;
  dynamic paymentInvoice;
  dynamic cod;
  dynamic merchantAmount;
  dynamic merchantDue;
  dynamic merchantpayStatus;
  dynamic merchantPaid;
  dynamic recipientName;
  dynamic recipientAddress;
  dynamic recipientPhone;
  dynamic note;
  dynamic deliveryCharge;
  dynamic codCharge;
  dynamic productPrice;
  dynamic deliverymanId;
  dynamic agentId;
  dynamic productWeight;
  dynamic trackingCode;
  dynamic percelType;
  dynamic helpNumber;
  dynamic reciveZone;
  dynamic orderType;
  dynamic codType;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic firstName;
  dynamic lastName;
  dynamic phoneNumber;
  dynamic emailAddress;
  dynamic companyName;
  dynamic mstatus;
  dynamic mid;

  Data(
      {this.title,
      this.zoneName,
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
      this.codCharge,
      this.productPrice,
      this.deliverymanId,
      this.agentId,
      this.productWeight,
      this.trackingCode,
      this.percelType,
      this.helpNumber,
      this.reciveZone,
      this.orderType,
      this.codType,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.emailAddress,
      this.companyName,
      this.mstatus,
      this.mid});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    zoneName = json['zonename'];
    id = json['id'];
    invoiceNo = json['invoiceNo'];
    merchantId = json['merchantId'];
    paymentInvoice = json['paymentInvoice'];
    cod = json['cod'];
    merchantAmount = json['merchantAmount'];
    merchantDue = json['merchantDue'];
    merchantpayStatus = json['merchantpayStatus'];
    merchantPaid = json['merchantPaid'];
    recipientName = json['recipientName'];
    recipientAddress = json['recipientAddress'];
    recipientPhone = json['recipientPhone'];
    note = json['note'];
    deliveryCharge = json['deliveryCharge'];
    codCharge = json['codCharge'];
    productPrice = json['productPrice'];
    deliverymanId = json['deliverymanId'];
    agentId = json['agentId'];
    productWeight = json['productWeight'];
    trackingCode = json['trackingCode'];
    percelType = json['percelType'];
    helpNumber = json['helpNumber'];
    reciveZone = json['reciveZone'];
    orderType = json['orderType'];
    codType = json['codType'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    emailAddress = json['emailAddress'];
    companyName = json['companyName'];
    mstatus = json['mstatus'];
    mid = json['mid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['invoiceNo'] = invoiceNo;
    data['merchantId'] = merchantId;
    data['paymentInvoice'] = paymentInvoice;
    data['cod'] = cod;
    data['merchantAmount'] = merchantAmount;
    data['merchantDue'] = merchantDue;
    data['merchantpayStatus'] = merchantpayStatus;
    data['merchantPaid'] = merchantPaid;
    data['recipientName'] = recipientName;
    data['recipientAddress'] = recipientAddress;
    data['recipientPhone'] = recipientPhone;
    data['note'] = note;
    data['deliveryCharge'] = deliveryCharge;
    data['codCharge'] = codCharge;
    data['productPrice'] = productPrice;
    data['deliverymanId'] = deliverymanId;
    data['agentId'] = agentId;
    data['productWeight'] = productWeight;
    data['trackingCode'] = trackingCode;
    data['percelType'] = percelType;
    data['helpNumber'] = helpNumber;
    data['reciveZone'] = reciveZone;
    data['orderType'] = orderType;
    data['codType'] = codType;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phoneNumber'] = phoneNumber;
    data['emailAddress'] = emailAddress;
    data['companyName'] = companyName;
    data['mstatus'] = mstatus;
    data['mid'] = mid;
    return data;
  }
}

class ParcelNotes {
  dynamic id;
  dynamic parcelId;
  dynamic note;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic noteTitle;

  ParcelNotes(
      {this.id,
      this.parcelId,
      this.note,
      this.createdAt,
      this.updatedAt,
      this.noteTitle});

  ParcelNotes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parcelId = json['parcelId'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    noteTitle = json['noteTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parcelId'] = parcelId;
    data['note'] = note;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['noteTitle'] = noteTitle;
    return data;
  }
}
