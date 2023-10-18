class DeliverymanDashboardModel {
  int _totalParcel;
  int _totalDelivery;
  int _totalHold;
  int _totalCancel;
  int _returnPending;
  int _returnMerchant;

  DeliverymanDashboardModel(
      {int totalParcel,
        int totalDelivery,
        int totalHold,
        int totalCancel,
        int returnPending,
        int returnMerchant}) {
    this._totalParcel = totalParcel;
    this._totalDelivery = totalDelivery;
    this._totalHold = totalHold;
    this._totalCancel = totalCancel;
    this._returnPending = returnPending;
    this._returnMerchant = returnMerchant;
  }

  int get totalParcel => _totalParcel;
  set totalParcel(int totalParcel) => _totalParcel = totalParcel;
  int get totalDelivery => _totalDelivery;
  set totalDelivery(int totalDelivery) => _totalDelivery = totalDelivery;
  int get totalHold => _totalHold;
  set totalHold(int totalHold) => _totalHold = totalHold;
  int get totalCancel => _totalCancel;
  set totalCancel(int totalCancel) => _totalCancel = totalCancel;
  int get returnPending => _returnPending;
  set returnPending(int returnPending) => _returnPending = returnPending;
  int get returnMerchant => _returnMerchant;
  set returnMerchant(int returnMerchant) => _returnMerchant = returnMerchant;

  DeliverymanDashboardModel.fromJson(Map<String, dynamic> json) {
    _totalParcel = json['totalParcel'];
    _totalDelivery = json['totalDelivery'];
    _totalHold = json['totalHold'];
    _totalCancel = json['totalCancel'];
    _returnPending = json['returnPending'];
    _returnMerchant = json['returnMerchant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalParcel'] = this._totalParcel;
    data['totalDelivery'] = this._totalDelivery;
    data['totalHold'] = this._totalHold;
    data['totalCancel'] = this._totalCancel;
    data['returnPending'] = this._returnPending;
    data['returnMerchant'] = this._returnMerchant;
    return data;
  }
}
