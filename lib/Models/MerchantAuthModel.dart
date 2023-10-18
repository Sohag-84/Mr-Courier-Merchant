import 'package:courier/Models/MerchantModel.dart';

class MerchantAuthModel {
  bool _success;
  String _message;
  MerchantModel _data;
  bool wrongPassword;
  bool verified;

  MerchantAuthModel({
    bool success,
    String message,
    MerchantModel data,
    this.wrongPassword,
    this.verified,
  }) {
    this._success = success;
    this._message = message;
    this._data = data;
  }

  bool get success => _success;
  set success(bool success) => _success = success;
  String get message => _message;
  set message(String message) => _message = message;
  MerchantModel get data => _data;
  set data(MerchantModel data) => _data = data;

  MerchantAuthModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _message = json['message'];
    _data =
        json['data'] != null ? new MerchantModel.fromJson(json['data']) : null;
    wrongPassword = json["wrongPassword"];
    verified = json["verified"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    data['message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data.toJson();
    }
    return data;
  }
}
