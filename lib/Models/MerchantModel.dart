class MerchantModel {
  dynamic _id;
  String _firstName;
  String _lastName;
  String _username;
  String _companyName;
  String _pickLocation;
  String _phoneNumber;
  String _emailAddress;
  dynamic _nearestZone;
  dynamic _pickupPreference;
  String _socialLink;
  dynamic _paymentMethod;
  String _paymentmode;
  dynamic _withdrawal;
  String _nameOfBank;
  String _bankBranch;
  String _bankAcHolder;
  dynamic _bankAcNo;
  dynamic _bkashNumber;
  dynamic _roketNumber;
  dynamic _nogodNumber;
  dynamic _balance;
  String _password;
  String _passwordReset;
  String _logo;
  String _agree;
  dynamic _verify;
  dynamic _status;
  String _createdAt;
  String _updatedAt;

  MerchantModel(
      {dynamic id,
      String firstName,
      String lastName,
      String username,
      String companyName,
      String pickLocation,
      String phoneNumber,
      String emailAddress,
      dynamic nearestZone,
      dynamic pickupPreference,
      String socialLink,
      dynamic paymentMethod,
      String paymentmode,
      dynamic withdrawal,
      String nameOfBank,
      String bankBranch,
      String bankAcHolder,
      dynamic bankAcNo,
      dynamic bkashNumber,
      dynamic roketNumber,
      dynamic nogodNumber,
      dynamic balance,
      String password,
      String passwordReset,
      String logo,
      String agree,
      dynamic verify,
      dynamic status,
      String createdAt,
      String updatedAt}) {
    this._id = id;
    this._firstName = firstName;
    this._lastName = lastName;
    this._username = username;
    this._companyName = companyName;
    this._pickLocation = pickLocation;
    this._phoneNumber = phoneNumber;
    this._emailAddress = emailAddress;
    this._nearestZone = nearestZone;
    this._pickupPreference = pickupPreference;
    this._socialLink = socialLink;
    this._paymentMethod = paymentMethod;
    this._paymentmode = paymentmode;
    this._withdrawal = withdrawal;
    this._nameOfBank = nameOfBank;
    this._bankBranch = bankBranch;
    this._bankAcHolder = bankAcHolder;
    this._bankAcNo = bankAcNo;
    this._bkashNumber = bkashNumber;
    this._roketNumber = roketNumber;
    this._nogodNumber = nogodNumber;
    this._balance = balance;
    this._password = password;
    this._passwordReset = passwordReset;
    this._logo = logo;
    this._agree = agree;
    this._verify = verify;
    this._status = status;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  dynamic get id => _id;
  set id(dynamic id) => _id = id;
  String get firstName => _firstName;
  set firstName(String firstName) => _firstName = firstName;
  String get lastName => _lastName;
  set lastName(String lastName) => _lastName = lastName;
  String get username => _username;
  set username(String username) => _username = username;
  String get companyName => _companyName;
  set companyName(String companyName) => _companyName = companyName;
  String get pickLocation => _pickLocation;
  set pickLocation(String pickLocation) => _pickLocation = pickLocation;
  String get phoneNumber => _phoneNumber;
  set phoneNumber(String phoneNumber) => _phoneNumber = phoneNumber;
  String get emailAddress => _emailAddress;
  set emailAddress(String emailAddress) => _emailAddress = emailAddress;
  dynamic get nearestZone => _nearestZone;
  set nearestZone(dynamic nearestZone) => _nearestZone = nearestZone;
  dynamic get pickupPreference => _pickupPreference;
  set pickupPreference(dynamic pickupPreference) =>
      _pickupPreference = pickupPreference;
  String get socialLink => _socialLink;
  set socialLink(String socialLink) => _socialLink = socialLink;
  dynamic get paymentMethod => _paymentMethod;
  set paymentMethod(dynamic paymentMethod) => _paymentMethod = paymentMethod;
  String get paymentmode => _paymentmode;
  set paymentmode(String paymentmode) => _paymentmode = paymentmode;
  dynamic get withdrawal => _withdrawal;
  set withdrawal(dynamic withdrawal) => _withdrawal = withdrawal;
  String get nameOfBank => _nameOfBank;
  set nameOfBank(String nameOfBank) => _nameOfBank = nameOfBank;
  String get bankBranch => _bankBranch;
  set bankBranch(String bankBranch) => _bankBranch = bankBranch;
  String get bankAcHolder => _bankAcHolder;
  set bankAcHolder(String bankAcHolder) => _bankAcHolder = bankAcHolder;
  dynamic get bankAcNo => _bankAcNo;
  set bankAcNo(dynamic bankAcNo) => _bankAcNo = bankAcNo;
  dynamic get bkashNumber => _bkashNumber;
  set bkashNumber(dynamic bkashNumber) => _bkashNumber = bkashNumber;
  dynamic get roketNumber => _roketNumber;
  set roketNumber(dynamic roketNumber) => _roketNumber = roketNumber;
  dynamic get nogodNumber => _nogodNumber;
  set nogodNumber(dynamic nogodNumber) => _nogodNumber = nogodNumber;
  dynamic get balance => _balance;
  set balance(dynamic balance) => _balance = balance;
  String get password => _password;
  set password(String password) => _password = password;
  String get passwordReset => _passwordReset;
  set passwordReset(String passwordReset) => _passwordReset = passwordReset;
  String get logo => _logo;
  set logo(String logo) => _logo = logo;
  String get agree => _agree;
  set agree(String agree) => _agree = agree;
  dynamic get verify => _verify;
  set verify(dynamic verify) => _verify = verify;
  dynamic get status => _status;
  set status(dynamic status) => _status = status;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;

  MerchantModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _username = json['username'];
    _companyName = json['companyName'];
    _pickLocation = json['pickLocation'];
    _phoneNumber = json['phoneNumber'];
    _emailAddress = json['emailAddress'];
    _nearestZone = json['nearestZone'];
    _pickupPreference = json['pickupPreference'];
    _socialLink = json['socialLink'];
    _paymentMethod = json['paymentMethod'];
    _paymentmode = json['paymentmode'];
    _withdrawal = json['withdrawal'];
    _nameOfBank = json['nameOfBank'];
    _bankBranch = json['bankBranch'];
    _bankAcHolder = json['bankAcHolder'];
    _bankAcNo = json['bankAcNo'];
    _bkashNumber = json['bkashNumber'];
    _roketNumber = json['roketNumber'];
    _nogodNumber = json['nogodNumber'];
    _balance = json['balance'];
    _password = json['password'];
    _passwordReset = json['passwordReset'];
    _logo = json['logo'];
    _agree = json['agree'];
    _verify = json['verify'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['firstName'] = this._firstName;
    data['lastName'] = this._lastName;
    data['username'] = this._username;
    data['companyName'] = this._companyName;
    data['pickLocation'] = this._pickLocation;
    data['phoneNumber'] = this._phoneNumber;
    data['emailAddress'] = this._emailAddress;
    data['nearestZone'] = this._nearestZone;
    data['pickupPreference'] = this._pickupPreference;
    data['socialLink'] = this._socialLink;
    data['paymentMethod'] = this._paymentMethod;
    data['paymentmode'] = this._paymentmode;
    data['withdrawal'] = this._withdrawal;
    data['nameOfBank'] = this._nameOfBank;
    data['bankBranch'] = this._bankBranch;
    data['bankAcHolder'] = this._bankAcHolder;
    data['bankAcNo'] = this._bankAcNo;
    data['bkashNumber'] = this._bkashNumber;
    data['roketNumber'] = this._roketNumber;
    data['nogodNumber'] = this._nogodNumber;
    data['balance'] = this._balance;
    data['password'] = this._password;
    data['passwordReset'] = this._passwordReset;
    data['logo'] = this._logo;
    data['agree'] = this._agree;
    data['verify'] = this._verify;
    data['status'] = this._status;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
