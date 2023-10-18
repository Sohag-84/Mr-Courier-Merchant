class ParcelTrackModel {
  bool success;
  String message;
  Data data;

  ParcelTrackModel({this.success, this.message, this.data});

  ParcelTrackModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['parcel'] != null ? new Data.fromJson(json['parcel']) : dynamic;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['parcel'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
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
  dynamic secondaryPhone;
  dynamic note;
  dynamic deliveryCharge;
  dynamic codCharge;
  dynamic productPrice;
  dynamic deliverymanId;
  dynamic deliverymanAmount;
  dynamic dPayinvoice;
  dynamic deliverymanPaystatus;
  dynamic pickupmanId;
  dynamic agentId;
  dynamic agentAmount;
  dynamic aPayinvoice;
  dynamic agentPaystatus;
  dynamic productWeight;
  dynamic trackingCode;
  dynamic percelType;
  dynamic helpNumber;
  dynamic reciveZone;
  dynamic orderType;
  dynamic codType;
  dynamic salePrice;
  dynamic invoiceId;
  dynamic verifyToken;
  dynamic verifyStatus;
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
      {this.id,
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
      this.secondaryPhone,
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
      this.reciveZone,
      this.orderType,
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
      this.mid});

  Data.fromJson(Map<String, dynamic> json) {
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
    secondaryPhone = json['secondaryPhone'];
    note = json['note'];
    deliveryCharge = json['deliveryCharge'];
    codCharge = json['codCharge'];
    productPrice = json['productPrice'];
    deliverymanId = json['deliverymanId'];
    deliverymanAmount = json['deliverymanAmount'];
    dPayinvoice = json['dPayinvoice'];
    deliverymanPaystatus = json['deliverymanPaystatus'];
    pickupmanId = json['pickupmanId'];
    agentId = json['agentId'];
    agentAmount = json['agentAmount'];
    aPayinvoice = json['aPayinvoice'];
    agentPaystatus = json['agentPaystatus'];
    productWeight = json['productWeight'];
    trackingCode = json['trackingCode'];
    percelType = json['percelType'];
    helpNumber = json['helpNumber'];
    reciveZone = json['reciveZone'];
    orderType = json['orderType'];
    codType = json['codType'];
    salePrice = json['sale_price'];
    invoiceId = json['invoice_id'];
    verifyToken = json['verifyToken'];
    verifyStatus = json['verifyStatus'];
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['invoiceNo'] = this.invoiceNo;
    data['merchantId'] = this.merchantId;
    data['paymentInvoice'] = this.paymentInvoice;
    data['cod'] = this.cod;
    data['merchantAmount'] = this.merchantAmount;
    data['merchantDue'] = this.merchantDue;
    data['merchantpayStatus'] = this.merchantpayStatus;
    data['merchantPaid'] = this.merchantPaid;
    data['recipientName'] = this.recipientName;
    data['recipientAddress'] = this.recipientAddress;
    data['recipientPhone'] = this.recipientPhone;
    data['secondaryPhone'] = this.secondaryPhone;
    data['note'] = this.note;
    data['deliveryCharge'] = this.deliveryCharge;
    data['codCharge'] = this.codCharge;
    data['productPrice'] = this.productPrice;
    data['deliverymanId'] = this.deliverymanId;
    data['deliverymanAmount'] = this.deliverymanAmount;
    data['dPayinvoice'] = this.dPayinvoice;
    data['deliverymanPaystatus'] = this.deliverymanPaystatus;
    data['pickupmanId'] = this.pickupmanId;
    data['agentId'] = this.agentId;
    data['agentAmount'] = this.agentAmount;
    data['aPayinvoice'] = this.aPayinvoice;
    data['agentPaystatus'] = this.agentPaystatus;
    data['productWeight'] = this.productWeight;
    data['trackingCode'] = this.trackingCode;
    data['percelType'] = this.percelType;
    data['helpNumber'] = this.helpNumber;
    data['reciveZone'] = this.reciveZone;
    data['orderType'] = this.orderType;
    data['codType'] = this.codType;
    data['sale_price'] = this.salePrice;
    data['invoice_id'] = this.invoiceId;
    data['verifyToken'] = this.verifyToken;
    data['verifyStatus'] = this.verifyStatus;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phoneNumber'] = this.phoneNumber;
    data['emailAddress'] = this.emailAddress;
    data['companyName'] = this.companyName;
    data['mstatus'] = this.mstatus;
    data['mid'] = this.mid;
    return data;
  }
}
