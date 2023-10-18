import 'dart:convert';

import 'package:courier/Dialog/LoadingDialog.dart';
import 'package:courier/Dialog/MyDialog.dart';
import 'package:courier/Models/DeliverymanAuthModel.dart';
import 'package:courier/Models/DeliverymanDashboardModel.dart';
import 'package:courier/Models/DeliverymanParcelModel.dart';
import 'package:courier/Models/DeliverymanPickupModel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class DeliverymanNetwork {
  String rootUrl = 'https://pcourier.xyz/';

  final pref = GetStorage();

  login(String email, String password, bool fromStart) async {
    Loading().show();

    Map data = {'email': email, 'password': password};
    var jsonData;
    var response = await http.post(Uri.parse(rootUrl + "api/deliveryman/login"),
        body: data);

    jsonData = json.decode(response.body);

    DeliverymanAuthModel responseData =
        new DeliverymanAuthModel.fromJson(jsonData);

    if (responseData.success) {
      pref.write('userId', responseData.data.id);
      pref.write('userName', responseData.data.name);
      pref.write('userPhone', responseData.data.phone);
      pref.write('username', email);
      pref.write('userPassword', password);
      pref.write('userType', "Deliveryman");
      Get.offAndToNamed('/deliveryman/home');
    } else {
      Loading().dismiss();
      if (!fromStart) {
        CustomDialog(Get.context,
            title: 'Failed',
            body: responseData.message,
            isOkButton: true,
            okButtonText: "Retry", okButtonClick: () {
          Get.back();
        }).show();
      } else {
        Loading().dismiss();
        Get.offAndToNamed('/root');
      }
    }
  }

  logout() async {
    Loading().show();
    await pref.erase();
    Get.offAllNamed('/root');
    Loading().dismiss();
  }

  passwordReset(String email) async {
    Loading().show();

    Map<String, dynamic> data = {'email': email};
    var jsonData;
    var response = await http.post(
        Uri.parse(rootUrl + "api/deliveryman/password/reset"),
        headers: {'Accept': 'application/json'},
        body: data,
        encoding: Encoding.getByName("utf-8"));

    jsonData = json.decode(response.body);

    if (jsonData['success']) {
      Loading().dismiss();
      CustomDialog(Get.context,
          title: 'Success',
          body: jsonData['message'],
          isOkButton: true,
          okButtonText: "Ok", okButtonClick: () {
        Get.toNamed(
            '/deliveryman/password/verify/${jsonData['resetDeliverymanId']}');
      }).show();
    } else {
      Loading().show();
      CustomDialog(Get.context,
          title: 'Failed',
          body: jsonData['message'],
          isOkButton: true,
          okButtonText: "Retry", okButtonClick: () {
        Get.back();
      }).show();
    }
  }

  passwordVerify(String id, String verifyPin, String newPassword) async {
    Loading().show();

    Map<String, dynamic> data = {
      'verifyPin': verifyPin,
      'newPassword': newPassword,
    };
    var jsonData;
    var response = await http.post(
        Uri.parse(rootUrl + "api/deliveryman/password/verify"),
        headers: {'id': id, 'Accept': 'application/json'},
        body: data,
        encoding: Encoding.getByName("utf-8"));

    jsonData = json.decode(response.body);

    if (jsonData['success']) {
      Loading().dismiss();
      CustomDialog(Get.context,
          title: 'Success',
          body: jsonData['message'],
          isOkButton: true,
          okButtonText: "Ok", okButtonClick: () {
        Get.offAndToNamed('/root');
      }).show();
    } else {
      Loading().dismiss();
      CustomDialog(Get.context,
          title: 'Failed',
          body: jsonData['message'],
          isOkButton: true,
          okButtonText: "Retry", okButtonClick: () {
        Get.back();
      }).show();
    }
  }

  Future<DeliverymanDashboardModel> getDashboardData() async {
    var jsonData;
    var response = await http.get(
        Uri.parse(rootUrl + "api/deliveryman/dashboard/report"),
        headers: {'id': json.encode(pref.read("userId"))});
    jsonData = json.decode(response.body);

    return DeliverymanDashboardModel.fromJson(jsonData);
  }

  Future<List<DeliverymanParcelModel>> getParcels(int startFrom) async {
    var jsonData;
    var response = await http.post(
        Uri.parse(rootUrl + "api/deliveryman/parcels/$startFrom"),
        headers: {
          'id': json.encode(pref.read("userId")),
          'Accept': 'application/json'
        });
    jsonData = json.decode(response.body);

    List<DeliverymanParcelModel> parcels =
        jsonData.map<DeliverymanParcelModel>((json) {
      return DeliverymanParcelModel.fromJson(json);
    }).toList();

    return parcels;
  }

  Future<DeliverymanParcelModel> getParcel(String parcelId) async {
    var jsonData;
    var response = await http.post(
        Uri.parse(rootUrl + "api/deliveryman/parcel/$parcelId"),
        headers: {
          'id': json.encode(pref.read("userId")),
          'Accept': 'application/json'
        });
    jsonData = json.decode(response.body);

    return DeliverymanParcelModel.fromJson(jsonData[0]);
  }

  parcelStatusUpdate(String parcelId, String status, String note) async {
    Loading().show();

    Map data = {'hidden_id': parcelId, 'status': status, 'note': note};
    var jsonData;
    var response = await http.post(
        Uri.parse(rootUrl + "api/deliveryman/parcel/status/update"),
        headers: {'Accept': 'application/json'},
        body: data);

    jsonData = json.decode(response.body);

    Loading().dismiss();

    CustomDialog(Get.context,
        title: 'Parcel Status Update',
        body: jsonData['message'],
        isOkButton: true,
        okButtonText: "OK", okButtonClick: () {
      Get.back();
    }).show();
  }

  Future<List<DeliverymanPickupModel>> getPickups(int startFrom) async {
    var jsonData;
    var response = await http.post(
        Uri.parse(rootUrl + "api/deliveryman/pickups/$startFrom"),
        headers: {
          'id': json.encode(pref.read("userId")),
          'Accept': 'application/json'
        });
    jsonData = json.decode(response.body);

    List<DeliverymanPickupModel> pickups =
        jsonData.map<DeliverymanPickupModel>((json) {
      return DeliverymanPickupModel.fromJson(json);
    }).toList();

    return pickups;
  }

  Future<DeliverymanPickupModel> getPickup(String pickupId) async {
    var jsonData;
    var response = await http.post(
        Uri.parse(rootUrl + "api/deliveryman/pickup/$pickupId"),
        headers: {
          'id': json.encode(pref.read("userId")),
          'Accept': 'application/json'
        });

    jsonData = json.decode(response.body);

    return DeliverymanPickupModel.fromJson(jsonData[0]);
  }

  pickupStatusUpdate(String pickupId, String status) async {
    Loading().show();

    Map data = {'hidden_id': pickupId, 'status': status};
    var jsonData;
    var response = await http.post(
        Uri.parse(rootUrl + "api/deliveryman/pickup/status/update"),
        headers: {'Accept': 'application/json'},
        body: data);

    jsonData = json.decode(response.body);

    Loading().dismiss();

    CustomDialog(Get.context,
        title: 'Pickup Status Update',
        body: jsonData['message'],
        isOkButton: true,
        okButtonText: "OK", okButtonClick: () {
      Get.back();
    }).show();
  }
}
