class NearestZoneModel {
  dynamic _id;
  dynamic _zonename;
  dynamic _status;
  dynamic _createdAt;
  dynamic _updatedAt;

  NearestZoneModel(
      {dynamic id,
      dynamic zonename,
      dynamic status,
      dynamic createdAt,
      dynamic updatedAt}) {
    this._id = id;
    this._zonename = zonename;
    this._status = status;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  dynamic get id => _id;
  set id(dynamic id) => _id = id;
  dynamic get zonename => _zonename;
  set zonename(dynamic zonename) => _zonename = zonename;
  dynamic get status => _status;
  set status(dynamic status) => _status = status;
  dynamic get createdAt => _createdAt;
  set createdAt(dynamic createdAt) => _createdAt = createdAt;
  dynamic get updatedAt => _updatedAt;
  set updatedAt(dynamic updatedAt) => _updatedAt = updatedAt;

  NearestZoneModel.fromJson(Map<dynamic, dynamic> json) {
    _id = json['id'];
    _zonename = json['zonename'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['id'] = this._id;
    data['zonename'] = this._zonename;
    data['status'] = this._status;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
