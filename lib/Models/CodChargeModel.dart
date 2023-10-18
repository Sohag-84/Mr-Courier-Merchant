class CodChargeModel {
  dynamic _id;
  dynamic _codcharge;
  dynamic _status;
  dynamic _createdAt;
  dynamic _updatedAt;

  CodChargeModel({
    dynamic id,
    dynamic codcharge,
    dynamic status,
    dynamic createdAt,
    dynamic updatedAt,
  }) {
    this._id = id;
    this._codcharge = codcharge;
    this._status = status;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  dynamic get id => _id;
  set id(dynamic id) => _id = id;
  dynamic get codcharge => _codcharge;
  set codcharge(dynamic codcharge) => _codcharge = codcharge;
  dynamic get status => _status;
  set status(dynamic status) => _status = status;
  dynamic get createdAt => _createdAt;
  set createdAt(dynamic createdAt) => _createdAt = createdAt;
  dynamic get updatedAt => _updatedAt;
  set updatedAt(dynamic updatedAt) => _updatedAt = updatedAt;

  CodChargeModel.fromJson(Map<dynamic, dynamic> json) {
    _id = json['id'];
    _codcharge = json['codcharge'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['id'] = this._id;
    data['codcharge'] = this._codcharge;
    data['status'] = this._status;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
