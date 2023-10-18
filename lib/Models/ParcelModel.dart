class ParcelModel {
  dynamic _id;
  String _invoiceNo;
  dynamic _merchantId;
  dynamic _paymentInvoice;
  dynamic _cod;
  dynamic _merchantAmount;
  dynamic _merchantDue;
  String _merchantpayStatus;
  dynamic _merchantPaid;
  String _recipientName;
  String _recipientAddress;
  dynamic _recipientPhone;
  String _note;
  dynamic _deliveryCharge;
  dynamic _codCharge;
  dynamic _productPrice;
  dynamic _deliverymanId;
  dynamic _agentId;
  dynamic _productWeight;
  String _trackingCode;
  dynamic _percelType;
  dynamic _helpNumber;
  String _reciveZone;
  dynamic _orderType;
  dynamic _codType;
  dynamic _status;
  String _createdAt;
  String _updatedAt;
  String _firstName;
  String _lastName;
  dynamic _phoneNumber;
  String _emailAddress;
  String _companyName;
  dynamic _mstatus;
  dynamic _mid;

  ParcelModel(
      {dynamic id,
      String invoiceNo,
      dynamic merchantId,
      dynamic paymentInvoice,
      dynamic cod,
      dynamic merchantAmount,
      dynamic merchantDue,
      String merchantpayStatus,
      dynamic merchantPaid,
      String recipientName,
      String recipientAddress,
      dynamic recipientPhone,
      String note,
      dynamic deliveryCharge,
      dynamic codCharge,
      dynamic productPrice,
      dynamic deliverymanId,
      dynamic agentId,
      dynamic productWeight,
      String trackingCode,
      dynamic percelType,
      dynamic helpNumber,
      String reciveZone,
      dynamic orderType,
      dynamic codType,
      dynamic status,
      String createdAt,
      String updatedAt,
      String firstName,
      String lastName,
      dynamic phoneNumber,
      String emailAddress,
      String companyName,
      dynamic mstatus,
      dynamic mid}) {
    this._id = id;
    this._invoiceNo = invoiceNo;
    this._merchantId = merchantId;
    this._paymentInvoice = paymentInvoice;
    this._cod = cod;
    this._merchantAmount = merchantAmount;
    this._merchantDue = merchantDue;
    this._merchantpayStatus = merchantpayStatus;
    this._merchantPaid = merchantPaid;
    this._recipientName = recipientName;
    this._recipientAddress = recipientAddress;
    this._recipientPhone = recipientPhone;
    this._note = note;
    this._deliveryCharge = deliveryCharge;
    this._codCharge = codCharge;
    this._productPrice = productPrice;
    this._deliverymanId = deliverymanId;
    this._agentId = agentId;
    this._productWeight = productWeight;
    this._trackingCode = trackingCode;
    this._percelType = percelType;
    this._helpNumber = helpNumber;
    this._reciveZone = reciveZone;
    this._orderType = orderType;
    this._codType = codType;
    this._status = status;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._firstName = firstName;
    this._lastName = lastName;
    this._phoneNumber = phoneNumber;
    this._emailAddress = emailAddress;
    this._companyName = companyName;
    this._mstatus = mstatus;
    this._mid = mid;
  }

  dynamic get id => _id;
  set id(dynamic id) => _id = id;
  String get invoiceNo => _invoiceNo;
  set invoiceNo(String invoiceNo) => _invoiceNo = invoiceNo;
  dynamic get merchantId => _merchantId;
  set merchantId(dynamic merchantId) => _merchantId = merchantId;
  dynamic get paymentInvoice => _paymentInvoice;
  set paymentInvoice(dynamic paymentInvoice) => _paymentInvoice = paymentInvoice;
  dynamic get cod => _cod;
  set cod(dynamic cod) => _cod = cod;
  dynamic get merchantAmount => _merchantAmount;
  set merchantAmount(dynamic merchantAmount) => _merchantAmount = merchantAmount;
  dynamic get merchantDue => _merchantDue;
  set merchantDue(dynamic merchantDue) => _merchantDue = merchantDue;
  String get merchantpayStatus => _merchantpayStatus;
  set merchantpayStatus(String merchantpayStatus) =>
      _merchantpayStatus = merchantpayStatus;
  dynamic get merchantPaid => _merchantPaid;
  set merchantPaid(dynamic merchantPaid) => _merchantPaid = merchantPaid;
  String get recipientName => _recipientName;
  set recipientName(String recipientName) => _recipientName = recipientName;
  String get recipientAddress => _recipientAddress;
  set recipientAddress(String recipientAddress) =>
      _recipientAddress = recipientAddress;
  dynamic get recipientPhone => _recipientPhone;
  set recipientPhone(dynamic recipientPhone) => _recipientPhone = recipientPhone;
  String get note => _note;
  set note(String note) => _note = note;
  dynamic get deliveryCharge => _deliveryCharge;
  set deliveryCharge(dynamic deliveryCharge) => _deliveryCharge = deliveryCharge;
  dynamic get codCharge => _codCharge;
  set codCharge(dynamic codCharge) => _codCharge = codCharge;
  dynamic get productPrice => _productPrice;
  set productPrice(dynamic productPrice) => _productPrice = productPrice;
  dynamic get deliverymanId => _deliverymanId;
  set deliverymanId(dynamic deliverymanId) => _deliverymanId = deliverymanId;
  dynamic get agentId => _agentId;
  set agentId(dynamic agentId) => _agentId = agentId;
  dynamic get productWeight => _productWeight;
  set productWeight(dynamic productWeight) => _productWeight = productWeight;
  String get trackingCode => _trackingCode;
  set trackingCode(String trackingCode) => _trackingCode = trackingCode;
  dynamic get percelType => _percelType;
  set percelType(dynamic percelType) => _percelType = percelType;
  dynamic get helpNumber => _helpNumber;
  set helpNumber(dynamic helpNumber) => _helpNumber = helpNumber;
  String get reciveZone => _reciveZone;
  set reciveZone(String reciveZone) => _reciveZone = reciveZone;
  dynamic get orderType => _orderType;
  set orderType(dynamic orderType) => _orderType = orderType;
  dynamic get codType => _codType;
  set codType(dynamic codType) => _codType = codType;
  dynamic get status => _status;
  set status(dynamic status) => _status = status;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;
  String get firstName => _firstName;
  set firstName(String firstName) => _firstName = firstName;
  String get lastName => _lastName;
  set lastName(String lastName) => _lastName = lastName;
  dynamic get phoneNumber => _phoneNumber;
  set phoneNumber(dynamic phoneNumber) => _phoneNumber = phoneNumber;
  String get emailAddress => _emailAddress;
  set emailAddress(String emailAddress) => _emailAddress = emailAddress;
  String get companyName => _companyName;
  set companyName(String companyName) => _companyName = companyName;
  dynamic get mstatus => _mstatus;
  set mstatus(dynamic mstatus) => _mstatus = mstatus;
  dynamic get mid => _mid;
  set mid(dynamic mid) => _mid = mid;

  ParcelModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _invoiceNo = json['invoiceNo'];
    _merchantId = json['merchantId'];
    _paymentInvoice = json['paymentInvoice'];
    _cod = json['cod'];
    _merchantAmount = json['merchantAmount'];
    _merchantDue = json['merchantDue'];
    _merchantpayStatus = json['merchantpayStatus'];
    _merchantPaid = json['merchantPaid'];
    _recipientName = json['recipientName'];
    _recipientAddress = json['recipientAddress'];
    _recipientPhone = json['recipientPhone'];
    _note = json['note'];
    _deliveryCharge = json['deliveryCharge'];
    _codCharge = json['codCharge'];
    _productPrice = json['productPrice'];
    _deliverymanId = json['deliverymanId'];
    _agentId = json['agentId'];
    _productWeight = json['productWeight'];
    _trackingCode = json['trackingCode'];
    _percelType = json['percelType'];
    _helpNumber = json['helpNumber'];
    _reciveZone = json['reciveZone'];
    _orderType = json['orderType'];
    _codType = json['codType'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _phoneNumber = json['phoneNumber'];
    _emailAddress = json['emailAddress'];
    _companyName = json['companyName'];
    _mstatus = json['mstatus'];
    _mid = json['mid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['invoiceNo'] = this._invoiceNo;
    data['merchantId'] = this._merchantId;
    data['paymentInvoice'] = this._paymentInvoice;
    data['cod'] = this._cod;
    data['merchantAmount'] = this._merchantAmount;
    data['merchantDue'] = this._merchantDue;
    data['merchantpayStatus'] = this._merchantpayStatus;
    data['merchantPaid'] = this._merchantPaid;
    data['recipientName'] = this._recipientName;
    data['recipientAddress'] = this._recipientAddress;
    data['recipientPhone'] = this._recipientPhone;
    data['note'] = this._note;
    data['deliveryCharge'] = this._deliveryCharge;
    data['codCharge'] = this._codCharge;
    data['productPrice'] = this._productPrice;
    data['deliverymanId'] = this._deliverymanId;
    data['agentId'] = this._agentId;
    data['productWeight'] = this._productWeight;
    data['trackingCode'] = this._trackingCode;
    data['percelType'] = this._percelType;
    data['helpNumber'] = this._helpNumber;
    data['reciveZone'] = this._reciveZone;
    data['orderType'] = this._orderType;
    data['codType'] = this._codType;
    data['status'] = this._status;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['firstName'] = this._firstName;
    data['lastName'] = this._lastName;
    data['phoneNumber'] = this._phoneNumber;
    data['emailAddress'] = this._emailAddress;
    data['companyName'] = this._companyName;
    data['mstatus'] = this._mstatus;
    data['mid'] = this._mid;
    return data;
  }
}
