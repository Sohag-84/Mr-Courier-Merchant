class DeliverymanModel {
  int _id;
  int _area;
  String _name;
  String _email;
  String _phone;
  String _designation;
  String _password;
  String _passwordReset;
  String _image;
  int _status;
  String _createdAt;
  String _updatedAt;

  DeliverymanModel(
      {int id,
        int area,
        String name,
        String email,
        String phone,
        String designation,
        String password,
        String passwordReset,
        String image,
        int status,
        String createdAt,
        String updatedAt}) {
    this._id = id;
    this._area = area;
    this._name = name;
    this._email = email;
    this._phone = phone;
    this._designation = designation;
    this._password = password;
    this._passwordReset = passwordReset;
    this._image = image;
    this._status = status;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  int get id => _id;
  set id(int id) => _id = id;
  int get area => _area;
  set area(int area) => _area = area;
  String get name => _name;
  set name(String name) => _name = name;
  String get email => _email;
  set email(String email) => _email = email;
  String get phone => _phone;
  set phone(String phone) => _phone = phone;
  String get designation => _designation;
  set designation(String designation) => _designation = designation;
  String get password => _password;
  set password(String password) => _password = password;
  String get passwordReset => _passwordReset;
  set passwordReset(String passwordReset) => _passwordReset = passwordReset;
  String get image => _image;
  set image(String image) => _image = image;
  int get status => _status;
  set status(int status) => _status = status;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;

  DeliverymanModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _area = json['area'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _designation = json['designation'];
    _password = json['password'];
    _passwordReset = json['passwordReset'];
    _image = json['image'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['area'] = this._area;
    data['name'] = this._name;
    data['email'] = this._email;
    data['phone'] = this._phone;
    data['designation'] = this._designation;
    data['password'] = this._password;
    data['passwordReset'] = this._passwordReset;
    data['image'] = this._image;
    data['status'] = this._status;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
