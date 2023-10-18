class DeliverymanParcelModel {
  int _id;
  int _invoiceNo;
  int _merchantId;
  int _paymentInvoice;
  int _cod;
  int _merchantAmount;
  int _merchantDue;
  String _merchantpayStatus;
  int _merchantPaid;
  String _recipientName;
  String _recipientAddress;
  int _recipientPhone;
  String _note;
  int _deliveryCharge;
  int _codCharge;
  int _productPrice;
  int _deliverymanId;
  int _agentId;
  int _productWeight;
  String _trackingCode;
  int _percelType;
  int _helpNumber;
  String _reciveZone;
  int _orderType;
  int _codType;
  int _status;
  String _createdAt;
  String _updatedAt;
  String _companyName;
  String _firstName;
  String _lastName;
  int _phoneNumber;
  String _emailAddress;

  DeliverymanParcelModel(
      {int id,
        int invoiceNo,
        int merchantId,
        int paymentInvoice,
        int cod,
        int merchantAmount,
        int merchantDue,
        String merchantpayStatus,
        int merchantPaid,
        String recipientName,
        String recipientAddress,
        int recipientPhone,
        String note,
        int deliveryCharge,
        int codCharge,
        int productPrice,
        int deliverymanId,
        int agentId,
        int productWeight,
        String trackingCode,
        int percelType,
        int helpNumber,
        String reciveZone,
        int orderType,
        int codType,
        int status,
        String createdAt,
        String updatedAt,
        String companyName,
        String firstName,
        String lastName,
        int phoneNumber,
        String emailAddress}) {
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
    this._companyName = companyName;
    this._firstName = firstName;
    this._lastName = lastName;
    this._phoneNumber = phoneNumber;
    this._emailAddress = emailAddress;
  }

  int get id => _id;
  set id(int id) => _id = id;
  int get invoiceNo => _invoiceNo;
  set invoiceNo(int invoiceNo) => _invoiceNo = invoiceNo;
  int get merchantId => _merchantId;
  set merchantId(int merchantId) => _merchantId = merchantId;
  int get paymentInvoice => _paymentInvoice;
  set paymentInvoice(int paymentInvoice) => _paymentInvoice = paymentInvoice;
  int get cod => _cod;
  set cod(int cod) => _cod = cod;
  int get merchantAmount => _merchantAmount;
  set merchantAmount(int merchantAmount) => _merchantAmount = merchantAmount;
  int get merchantDue => _merchantDue;
  set merchantDue(int merchantDue) => _merchantDue = merchantDue;
  String get merchantpayStatus => _merchantpayStatus;
  set merchantpayStatus(String merchantpayStatus) =>
      _merchantpayStatus = merchantpayStatus;
  int get merchantPaid => _merchantPaid;
  set merchantPaid(int merchantPaid) => _merchantPaid = merchantPaid;
  String get recipientName => _recipientName;
  set recipientName(String recipientName) => _recipientName = recipientName;
  String get recipientAddress => _recipientAddress;
  set recipientAddress(String recipientAddress) =>
      _recipientAddress = recipientAddress;
  int get recipientPhone => _recipientPhone;
  set recipientPhone(int recipientPhone) => _recipientPhone = recipientPhone;
  String get note => _note;
  set note(String note) => _note = note;
  int get deliveryCharge => _deliveryCharge;
  set deliveryCharge(int deliveryCharge) => _deliveryCharge = deliveryCharge;
  int get codCharge => _codCharge;
  set codCharge(int codCharge) => _codCharge = codCharge;
  int get productPrice => _productPrice;
  set productPrice(int productPrice) => _productPrice = productPrice;
  int get deliverymanId => _deliverymanId;
  set deliverymanId(int deliverymanId) => _deliverymanId = deliverymanId;
  int get agentId => _agentId;
  set agentId(int agentId) => _agentId = agentId;
  int get productWeight => _productWeight;
  set productWeight(int productWeight) => _productWeight = productWeight;
  String get trackingCode => _trackingCode;
  set trackingCode(String trackingCode) => _trackingCode = trackingCode;
  int get percelType => _percelType;
  set percelType(int percelType) => _percelType = percelType;
  int get helpNumber => _helpNumber;
  set helpNumber(int helpNumber) => _helpNumber = helpNumber;
  String get reciveZone => _reciveZone;
  set reciveZone(String reciveZone) => _reciveZone = reciveZone;
  int get orderType => _orderType;
  set orderType(int orderType) => _orderType = orderType;
  int get codType => _codType;
  set codType(int codType) => _codType = codType;
  int get status => _status;
  set status(int status) => _status = status;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;
  String get companyName => _companyName;
  set companyName(String companyName) => _companyName = companyName;
  String get firstName => _firstName;
  set firstName(String firstName) => _firstName = firstName;
  String get lastName => _lastName;
  set lastName(String lastName) => _lastName = lastName;
  int get phoneNumber => _phoneNumber;
  set phoneNumber(int phoneNumber) => _phoneNumber = phoneNumber;
  String get emailAddress => _emailAddress;
  set emailAddress(String emailAddress) => _emailAddress = emailAddress;

  DeliverymanParcelModel.fromJson(Map<String, dynamic> json) {
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
    _companyName = json['companyName'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _phoneNumber = json['phoneNumber'];
    _emailAddress = json['emailAddress'];
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
    data['companyName'] = this._companyName;
    data['firstName'] = this._firstName;
    data['lastName'] = this._lastName;
    data['phoneNumber'] = this._phoneNumber;
    data['emailAddress'] = this._emailAddress;
    return data;
  }
}
