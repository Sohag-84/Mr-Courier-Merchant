class MerchantDashboardModel {
  int _placeParcel;
  int _pendingParcel;
  int _deliveredParcel;
  int _cancelParcel;
  int _collectAmount;
  int _totalPaid;
  int _parcelReturn;
  int _totalHold;
  int _totalAmount;
  int _merchantUnpaid;
  int _merchantPaid;

  MerchantDashboardModel(
      {int placeParcel,
      int pendingParcel,
      int deliveredParcel,
      int cancelParcel,
      int collectAmount,
      int totalPaid,
      int parcelReturn,
      int totalHold,
      int totalAmount,
      int merchantUnpaid,
      int merchantPaid}) {
    this._placeParcel = placeParcel;
    this._pendingParcel = pendingParcel;
    this._deliveredParcel = deliveredParcel;
    this._cancelParcel = cancelParcel;
    this._collectAmount = collectAmount;
    this._totalPaid = totalPaid;
    this._parcelReturn = parcelReturn;
    this._totalHold = totalHold;
    this._totalAmount = totalAmount;
    this._merchantUnpaid = merchantUnpaid;
    this._merchantPaid = merchantPaid;
  }

  int get placeParcel => _placeParcel;
  set placeParcel(int placeParcel) => _placeParcel = placeParcel;
  int get pendingParcel => _pendingParcel;
  set pendingParcel(int pendingParcel) => _pendingParcel = pendingParcel;
  int get deliveredParcel => _deliveredParcel;
  set deliveredParcel(int deliveredParcel) =>
      _deliveredParcel = deliveredParcel;
  int get cancelParcel => _cancelParcel;
  set cancelParcel(int cancelParcel) => _cancelParcel = cancelParcel;
  int get collectAmount => _collectAmount;
  set collectAmount(int collectAmount) => _collectAmount = collectAmount;
  int get totalPaid => _totalPaid;
  set totalPaid(int totalPaid) => _totalPaid = totalPaid;
  int get parcelReturn => _parcelReturn;
  set parcelReturn(int parcelReturn) => _parcelReturn = parcelReturn;
  int get totalHold => _totalHold;
  set totalHold(int totalHold) => _totalHold = totalHold;
  int get totalAmount => _totalAmount;
  set totalAmount(int totalAmount) => _totalAmount = totalAmount;
  int get merchantUnpaid => _merchantUnpaid;
  set merchantUnpaid(int merchantUnpaid) => _merchantUnpaid = merchantUnpaid;
  int get merchantPaid => _merchantPaid;
  set merchantPaid(int merchantPaid) => _merchantPaid = merchantPaid;

  MerchantDashboardModel.fromJson(Map<String, dynamic> json) {
    _placeParcel = json['placeParcel'];
    _pendingParcel = json['pendingParcel'];
    _deliveredParcel = json['deliveredParcel'];
    _cancelParcel = json['cancelParcel'];
    _collectAmount = json['collectAmount'];
    _totalPaid = json['totalPaid'];
    _parcelReturn = json['parcelReturn'];
    _totalHold = json['totalHold'];
    _totalAmount = json['totalAmount'];
    _merchantUnpaid = json['merchantUnpaid'];
    _merchantPaid = json['merchantPaid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['placeParcel'] = this._placeParcel;
    data['pendingParcel'] = this._pendingParcel;
    data['deliveredParcel'] = this._deliveredParcel;
    data['cancelParcel'] = this._cancelParcel;
    data['collectAmount'] = this._collectAmount;
    data['totalPaid'] = this._totalPaid;
    data['parcelReturn'] = this._parcelReturn;
    data['totalHold'] = this._totalHold;
    data['totalAmount'] = this._totalAmount;
    data['merchantUnpaid'] = this._merchantUnpaid;
    data['merchantPaid'] = this._merchantPaid;
    return data;
  }
}
