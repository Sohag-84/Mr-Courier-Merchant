class ServicesModel {
  dynamic _id;
  dynamic _title;
  dynamic _slug;
  dynamic _subtitle;
  dynamic _time;
  dynamic _deliverycharge;
  dynamic _extradeliverycharge;
  dynamic _description;
  dynamic _status;
  dynamic _createdAt;
  dynamic _updatedAt;
  dynamic _cod;

  ServicesModel({
    dynamic id,
    dynamic title,
    dynamic slug,
    dynamic subtitle,
    dynamic time,
    dynamic deliverycharge,
    dynamic extradeliverycharge,
    dynamic description,
    dynamic status,
    dynamic createdAt,
    dynamic updatedAt,
    dynamic cod,
  }) {
    this._id = id;
    this._title = title;
    this._slug = slug;
    this._subtitle = subtitle;
    this._time = time;
    this._deliverycharge = deliverycharge;
    this._extradeliverycharge = extradeliverycharge;
    this._description = description;
    this._status = status;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._cod = cod;
  }

  dynamic get id => _id;
  set id(dynamic id) => _id = id;
  dynamic get title => _title;
  set title(dynamic title) => _title = title;
  dynamic get slug => _slug;
  set slug(dynamic slug) => _slug = slug;
  dynamic get subtitle => _subtitle;
  set subtitle(dynamic subtitle) => _subtitle = subtitle;
  dynamic get time => _time;
  set time(dynamic time) => _time = time;
  dynamic get deliverycharge => _deliverycharge;
  set deliverycharge(dynamic deliverycharge) =>
      _deliverycharge = deliverycharge;
  dynamic get extradeliverycharge => _extradeliverycharge;
  set extradeliverycharge(dynamic extradeliverycharge) =>
      _extradeliverycharge = extradeliverycharge;
  dynamic get description => _description;
  set description(dynamic description) => _description = description;
  dynamic get status => _status;
  set status(dynamic status) => _status = status;
  dynamic get createdAt => _createdAt;
  set createdAt(dynamic createdAt) => _createdAt = createdAt;
  dynamic get updatedAt => _updatedAt;
  set updatedAt(dynamic updatedAt) => _updatedAt = updatedAt;
  dynamic get cod => _cod;
  set cod(dynamic cod) => _cod = cod;

  ServicesModel.fromJson(Map<dynamic, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _slug = json['slug'];
    _subtitle = json['subtitle'];
    _time = json['time'];
    _deliverycharge = json['deliverycharge'];
    _extradeliverycharge = json['extradeliverycharge'];
    _description = json['description'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _cod = json['cod'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    data['slug'] = this._slug;
    data['subtitle'] = this._subtitle;
    data['time'] = this._time;
    data['deliverycharge'] = this._deliverycharge;
    data['extradeliverycharge'] = this._extradeliverycharge;
    data['description'] = this._description;
    data['status'] = this._status;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
