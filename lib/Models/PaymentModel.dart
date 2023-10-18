class PaymentModel {
  dynamic _id;
  dynamic _merchantId;
  dynamic _parcelId;
  dynamic _createdAt;
  dynamic _updatedAt;

  PaymentModel(
      {dynamic id,
      dynamic merchantId,
      dynamic parcelId,
      dynamic createdAt,
      dynamic updatedAt}) {
    this._id = id;
    this._merchantId = merchantId;
    this._parcelId = parcelId;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  dynamic get id => _id;
  set id(dynamic id) => _id = id;
  dynamic get merchantId => _merchantId;
  set merchantId(dynamic merchantId) => _merchantId = merchantId;
  dynamic get parcelId => _parcelId;
  set parcelId(dynamic parcelId) => _parcelId = parcelId;
  dynamic get createdAt => _createdAt;
  set createdAt(dynamic createdAt) => _createdAt = createdAt;
  dynamic get updatedAt => _updatedAt;
  set updatedAt(dynamic updatedAt) => _updatedAt = updatedAt;

  PaymentModel.fromJson(Map<dynamic, dynamic> json) {
    _id = json['id'];
    _merchantId = json['merchantId'];
    _parcelId = json['parcelId'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['id'] = this._id;
    data['merchantId'] = this._merchantId;
    data['parcelId'] = this._parcelId;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
