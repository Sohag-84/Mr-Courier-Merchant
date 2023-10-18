class DeliverymanPickupModel {
  int _id;
  int _pickuptype;
  String _date;
  String _pickupAddress;
  int _merchantId;
  String _note;
  String _estimedparcel;
  int _area;
  int _agent;
  int _deliveryman;
  int _status;
  String _createdAt;
  String _updatedAt;
  String _firstName;
  String _lastName;
  int _phoneNumber;
  String _emailAddress;
  String _companyName;
  int _mstatus;
  int _mid;

  DeliverymanPickupModel(
      {int id,
        int pickuptype,
        String date,
        String pickupAddress,
        int merchantId,
        String note,
        String estimedparcel,
        int area,
        int agent,
        int deliveryman,
        int status,
        String createdAt,
        String updatedAt,
        String firstName,
        String lastName,
        int phoneNumber,
        String emailAddress,
        String companyName,
        int mstatus,
        int mid}) {
    this._id = id;
    this._pickuptype = pickuptype;
    this._date = date;
    this._pickupAddress = pickupAddress;
    this._merchantId = merchantId;
    this._note = note;
    this._estimedparcel = estimedparcel;
    this._area = area;
    this._agent = agent;
    this._deliveryman = deliveryman;
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

  int get id => _id;
  set id(int id) => _id = id;
  int get pickuptype => _pickuptype;
  set pickuptype(int pickuptype) => _pickuptype = pickuptype;
  String get date => _date;
  set date(String date) => _date = date;
  String get pickupAddress => _pickupAddress;
  set pickupAddress(String pickupAddress) => _pickupAddress = pickupAddress;
  int get merchantId => _merchantId;
  set merchantId(int merchantId) => _merchantId = merchantId;
  String get note => _note;
  set note(String note) => _note = note;
  String get estimedparcel => _estimedparcel;
  set estimedparcel(String estimedparcel) => _estimedparcel = estimedparcel;
  int get area => _area;
  set area(int area) => _area = area;
  int get agent => _agent;
  set agent(int agent) => _agent = agent;
  int get deliveryman => _deliveryman;
  set deliveryman(int deliveryman) => _deliveryman = deliveryman;
  int get status => _status;
  set status(int status) => _status = status;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;
  String get firstName => _firstName;
  set firstName(String firstName) => _firstName = firstName;
  String get lastName => _lastName;
  set lastName(String lastName) => _lastName = lastName;
  int get phoneNumber => _phoneNumber;
  set phoneNumber(int phoneNumber) => _phoneNumber = phoneNumber;
  String get emailAddress => _emailAddress;
  set emailAddress(String emailAddress) => _emailAddress = emailAddress;
  String get companyName => _companyName;
  set companyName(String companyName) => _companyName = companyName;
  int get mstatus => _mstatus;
  set mstatus(int mstatus) => _mstatus = mstatus;
  int get mid => _mid;
  set mid(int mid) => _mid = mid;

  DeliverymanPickupModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _pickuptype = json['pickuptype'];
    _date = json['date'];
    _pickupAddress = json['pickupAddress'];
    _merchantId = json['merchantId'];
    _note = json['note'];
    _estimedparcel = json['estimedparcel'];
    _area = json['area'];
    _agent = json['agent'];
    _deliveryman = json['deliveryman'];
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
    data['pickuptype'] = this._pickuptype;
    data['date'] = this._date;
    data['pickupAddress'] = this._pickupAddress;
    data['merchantId'] = this._merchantId;
    data['note'] = this._note;
    data['estimedparcel'] = this._estimedparcel;
    data['area'] = this._area;
    data['agent'] = this._agent;
    data['deliveryman'] = this._deliveryman;
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
