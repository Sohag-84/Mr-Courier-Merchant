import 'dart:convert';
import 'dart:developer';

import 'package:courier/Dialog/LoadingDialog.dart';
import 'package:courier/Dialog/MyDialog.dart';
import 'package:courier/Models/CodChargeModel.dart';
import 'package:courier/Models/DeliverymanModel.dart';
import 'package:courier/Models/MerchantAuthModel.dart';
import 'package:courier/Models/MerchantDashboardModel.dart';
import 'package:courier/Models/MerchantModel.dart';
import 'package:courier/Models/NearestZoneModel.dart';
import 'package:courier/Models/ParcelDetailModel.dart';
import 'package:courier/Models/ParcelModel.dart';
import 'package:courier/Models/ParcelTrackModel.dart';
import 'package:courier/Models/ParcelTypeModel.dart';
import 'package:courier/Models/PaymentModel.dart';
import 'package:courier/Models/PickupModel.dart';
import 'package:courier/Models/ServicesModel.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class MerchantNetwork {
  String rootUrl = 'https://mrdelivery.com.bd/';

  final pref = GetStorage();

  getParcelType() async {
    var jsonData;
    var response = await http.get(Uri.parse(rootUrl + "api/parcelType"));
    jsonData = json.decode(response.body);

    List<ParcelTypeModel> types = jsonData.map<ParcelTypeModel>((json) {
      return ParcelTypeModel.fromJson(json);
    }).toList();

    for (int i = 0; i < types.length; i++) {
      pref.write(types[i].id.toString(), types[i].title);
    }
  }

  register(String businessName, String name, String phoneNumber, String email,
      String username, String pickLocation, String socialLink) async {
    Loading().show();

    Map<String, dynamic> data = {
      'companyName': businessName,
      'firstName': name,
      'phoneNumber': phoneNumber,
      'emailAddress': email,
      'username': username,
      'pickLocation': pickLocation,
      'socialLink': socialLink,
    };
    var jsonData;
    var response = await http.post(Uri.parse(rootUrl + "api/merchant/register"),
        body: data, encoding: Encoding.getByName("utf-8"));

    jsonData = json.decode(response.body);

    MerchantAuthModel responseData = new MerchantAuthModel.fromJson(jsonData);

    Loading().dismiss();
    CustomDialog(Get.context,
        title: responseData.success ? 'Success' : 'Failed',
        body: responseData.message,
        isOkButton: true,
        okButtonText: responseData.success ? "OK" : "Retry", okButtonClick: () {
      Get.back();
      if (responseData.success) {
        Get.back();
      }
    }).show();
  }

  anotherregister({
    String businessName,
    String name,
    String phoneNumber,
    String email,
    String password,
  }) async {
    Loading().show();

    Map<String, dynamic> data = {
      'companyName': businessName,
      'firstName': name,
      'phoneNumber': phoneNumber,
      'emailAddress': email,
      'password': password,
    };
    var jsonData;
    var response = await http.post(Uri.parse(rootUrl + "api/merchant/register"),
        body: data, encoding: Encoding.getByName("utf-8"));

    jsonData = json.decode(response.body);

    MerchantAuthModel responseData = new MerchantAuthModel.fromJson(jsonData);

    Loading().dismiss();
    log(jsonData.toString());
    if (responseData.success) {
      CustomDialog(
        Get.context,
        title: 'Success',
        body: responseData.message,
        isOkButton: true,
        okButtonText: "Ok",
        okButtonClick: () {
          Get.toNamed('/merchant/otp/$phoneNumber', parameters: {
            'phoneNumber': phoneNumber,
          });
        },
      ).show();
    } else {
      CustomDialog(
        Get.context,
        title: 'Failed',
        body: responseData.message,
        isOkButton: true,
        okButtonText: "Retry",
        okButtonClick: () {
          Get.back();
        },
      ).show();
    }
    // Get.toNamed('/merchant/otp/:$phoneNumber');
  }

  Future<bool> login(String phoneNumber) async {
    // Loading().show();

    Map data = {'phoneNumber': phoneNumber};
    var jsonData;
    var response =
        await http.post(Uri.parse(rootUrl + "api/merchant/login"), body: data);

    jsonData = json.decode(response.body);
    log(jsonData.toString());

    if (jsonData['success']) {
      Loading().dismiss();

      Get.snackbar("Code Sent", jsonData['message']);

      return true;
    } else {
      Loading().dismiss();
      CustomDialog(Get.context,
          title: 'Failed',
          body: jsonData['message'],
          isOkButton: true,
          okButtonText: "Retry", okButtonClick: () {
        Get.back();
        Get.back();
      }).show();

      return false;
    }
  }

  anotherlogin(String phonenumber, String password, bool fromStart) async {
    Loading().show();

    Map data = {'phoneNumber': phonenumber, 'password': password};
    var jsonData;
    var response =
        await http.post(Uri.parse(rootUrl + "api/merchant/login"), body: data);

    log(response.body.toString());

    jsonData = json.decode(response.body);

    MerchantAuthModel responseData = new MerchantAuthModel.fromJson(jsonData);

    if (responseData.success) {
      Loading().dismiss();
      pref.write('userId', responseData.data.id);
      pref.write('userName', responseData.data.firstName);
      pref.write('userPhone', responseData.data.phoneNumber);
      // pref.write('username', email);
      // pref.write('userPassword', password);
      pref.write('userType', "Merchant");
      Get.offAndToNamed('/merchant/home');
      // Get.offAllNamed('/merchant/home');
    } else {
      Loading().dismiss();
      if (responseData.wrongPassword == true) {
        CustomDialog(
          Get.context,
          title: 'Failed',
          body: responseData.message,
          isOkButton: true,
          okButtonText: "Retry",
          okButtonClick: () {
            Get.back();
          },
        ).show();

        return;
      } else if (responseData.verified == false) {
        CustomDialog(
          Get.context,
          title: 'Failed',
          body: responseData.message,
          isOkButton: true,
          okButtonText: "Ok",
          okButtonClick: () {
            // Get.back();
            verifyOtpForLogin(phonenumber);
          },
        ).show();
      } else {
        CustomDialog(
          Get.context,
          title: 'Failed',
          body: responseData.message,
          isOkButton: true,
          okButtonText: "Ok",
          okButtonClick: () {
            Get.back();
          },
        ).show();
      }
    }
  }

  verifyOtpForLogin(String phoneNumber) async {
    Loading().show();
    var data = {
      "phoneNumber": "$phoneNumber",
    };
    log(data.toString());
    var response = await http.post(
      Uri.parse(rootUrl + "api/merchant/resendotp"),
      body: data,
    );
    log(response.body.toString());
    Loading().dismiss();

    var jsonData = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      if (jsonData['success'] == true) {
        Get.toNamed('/merchant/otp/$phoneNumber', parameters: {
          'phoneNumber': phoneNumber,
        });
      } else {
        Get.snackbar("Error", "Couldn't send OTP code right now");
      }
    } else {
      Get.snackbar("Error", "Couldn't send OTP code right now");
    }
  }

  verifyOTP(String phoneNumber, String verifyToken) async {
    Loading().show();

    var data = {
      'phoneNumber': phoneNumber,
      'verifyToken': verifyToken,
    };
    log(data.toString());
    var jsonData;

    var response = await http.post(
      Uri.parse(rootUrl+"api/merchant/otpverify"),
      body: data,
    );

    jsonData = json.decode(response.body);
    log(response.body.toString());

    MerchantAuthModel responseData = new MerchantAuthModel.fromJson(jsonData);

    if (responseData.success) {
      Loading().dismiss();

      pref.write('userId', responseData.data.id);
      pref.write('userName', responseData.data.firstName);
      pref.write('userPhone', responseData.data.phoneNumber);
      pref.write('userType', "Merchant");
      Get.offAllNamed('/merchant/home');
    } else {
      Loading().dismiss();
      CustomDialog(Get.context,
          title: 'Failed',
          body: responseData.message,
          isOkButton: true,
          okButtonText: "Retry", okButtonClick: () {
        Get.back();
      }).show();
    }
  }

  logout() async {
    Loading().show();
    await pref.erase();
    Get.offAllNamed('/root');
    Loading().dismiss();
  }

  passwordReset(String phone) async {
    Loading().show();

    Map<String, dynamic> data = {'phoneNumber': phone};
    var jsonData;
    var response = await http.post(
        Uri.parse(rootUrl + "api/merchant/password/reset"),
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
        Get.toNamed('/merchant/password/verify/${jsonData['resetCustomerId']}');
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

  passwordVerify(String id, String verifyPin, String newPassword) async {
    Loading().show();

    Map<String, dynamic> data = {
      'verifyPin': verifyPin,
      'newPassword': newPassword,
    };
    var jsonData;
    var response = await http.post(
        Uri.parse(rootUrl + "api/merchant/password/verify"),
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

  Future<MerchantDashboardModel> getMerchantDashboardData() async {
    var jsonData;
    var response = await http.get(
        Uri.parse(rootUrl + "api/merchant/dashboard/report"),
        headers: {'id': json.encode(pref.read("userId"))});
    jsonData = json.decode(response.body);

    return MerchantDashboardModel.fromJson(jsonData);
  }

  Future<MerchantModel> getUserData() async {
    var jsonData;
    var response = await http.get(Uri.parse(rootUrl + "api/merchant/profile"),
        headers: {'id': json.encode(pref.read("userId"))});
    log(response.body);
    jsonData = json.decode(response.body);

    MerchantModel model = MerchantModel.fromJson(jsonData);

    pref.write('userId', model.id);
    pref.write('userName', model.firstName);
    pref.write('userPhone', model.phoneNumber);

    return model;
  }

  Future<List<NearestZoneModel>> getNearestZones() async {
    var jsonData;
    var response = await http.get(Uri.parse(rootUrl + "api/nearestZone"));
    jsonData = json.decode(response.body);

    List<NearestZoneModel> zones = jsonData.map<NearestZoneModel>((json) {
      return NearestZoneModel.fromJson(json);
    }).toList();

    return zones;
  }

  Future<MerchantModel> updateUserData(
    String phoneNumber,
    String pickLocation,
    String nearestZone,
    String pickupPreference,
    String paymentMethod,
    String withdrawal,
    String nameOfBank,
    String bankBranch,
    String bankAcHolder,
    String bankAcNo,
    String bkashNumber,
    String roketNumber,
    String nogodNumber,
  ) async {
    Loading().show();

    MerchantModel user;

    Map data = {
      'phoneNumber': phoneNumber,
      'pickLocation': pickLocation,
      'nearestZone': nearestZone,
      'pickupPreference': pickupPreference,
      'paymentMethod': paymentMethod,
      'withdrawal': withdrawal,
      'nameOfBank': nameOfBank,
      'bankBranch': bankBranch,
      'bankAcHolder': bankAcHolder,
      'bankAcNo': bankAcNo,
      'bkashNumber': bkashNumber,
      'rocketNumber': roketNumber,
      'nogodNumber': nogodNumber
    };
    var jsonData;
    var response =
        await http.put(Uri.parse(rootUrl + "api/merchant/profile/update"),
            headers: {
              'id': json.encode(pref.read("userId")),
              'Content-type': 'application/json',
              'Accept': 'application/json'
            },
            body: json.encode(data),
            encoding: Encoding.getByName("utf-8"));

    jsonData = json.decode(response.body);

    MerchantAuthModel responseData = new MerchantAuthModel.fromJson(jsonData);

    if (responseData.success) {
      Loading().dismiss();

      user = responseData.data;
      CustomDialog(Get.context,
          title: 'Success',
          body: responseData.message,
          isOkButton: true,
          okButtonText: "Ok", okButtonClick: () {
        Get.back();
      }).show();
    } else {
      Loading().dismiss();

      user = null;
      CustomDialog(Get.context,
          title: 'Failed',
          body: responseData.message,
          isOkButton: true,
          okButtonText: "Retry", okButtonClick: () {
        Get.back();
      }).show();
    }

    return user;
  }

  Future<List<ServicesModel>> getServices() async {
    var jsonData;
    var response = await http.get(Uri.parse(rootUrl + "api/services/choose"));
    jsonData = json.decode(response.body);
    // log(jsonData.toString());

    List<ServicesModel> services = jsonData.map<ServicesModel>((json) {
      return ServicesModel.fromJson(json);
    }).toList();

    return services;
  }

  Future<ServicesModel> getService(String slug) async {
    var jsonData;
    var response = await http
        .get(Uri.parse(rootUrl + "api/service"), headers: {'slug': slug});
    jsonData = json.decode(response.body);

    return ServicesModel.fromJson(jsonData);
  }

  Future<CodChargeModel> getCodCharge() async {
    var jsonData;
    var response = await http.get(Uri.parse(rootUrl + "api/cod/get"));
    jsonData = json.decode(response.body);

    return CodChargeModel.fromJson(jsonData);
  }

  createParcel(
      // String name,
      // String phoneNumber,
      // String address,
      // String invoiceNo,
      // String weight,
      // int parcelType,
      // String cod,
      // String productPrice,
      // int receiveZone,
      // String note,
      // int deliveryCharge,
      // int extraDeliveryCharge,
      // int codCharge,
      // int orderType,
      // int codType, {
      // int divisionId,
      // int districtId,
      // }
      ) async {
    Loading().show();

    // Map data = {
    //   'name': name,
    //   'recipientPhone': phoneNumber,
    //   'recipientAddress': address,
    //   'invoiceNo': invoiceNo,
    //   'productWeight': weight,
    //   'percelType': parcelType,
    //   'cod': cod,
    //   'sale_price': productPrice,
    //   'note': note,
    //   'deliveryCharge': deliveryCharge.toString(),
    //   'extraDeliveryCharge': extraDeliveryCharge.toString(),
    //   'package': orderType.toString(),
    //   'codType': codType.toString(),
    //   'area_id': receiveZone.toString(),
    //   'division_id': divisionId.toString(),
    //   'district_id': districtId.toString(),
    // };
    var data = {
      "cod": "1000",
      "sale_price": "3500",
      "invoice_id": null,
      "percelType": "1",
      "recipientName": "Alif",
      "recipientAddress": "Haragach",
      "recipientPhone": "01770900477",
      "productWeight": 1,
      "note": null,
      "deliveryCharge": 60,
      "extraDeliveryCharge": 20,
      "division_id": "15",
      "district_id": "63",
      "area_id": "290",
      "package": "4"
    };
    print(data.toString());
    var jsonData;
    var response = await http.post(
      Uri.parse(rootUrl + "api/merchant/parcel/create"),
      headers: {
        'id': json.encode(pref.read("userId")),
      },
      body: data,
      // encoding: Encoding.getByName("utf-8"),
    );
    log(response.body.toString());

    jsonData = json.decode(response.body);

    Loading().dismiss();
    log(jsonData.toString());

    CustomDialog(Get.context,
        title: 'Message',
        body: jsonData['message'],
        isOkButton: true,
        okButtonText: "OK", okButtonClick: () {
      Get.back();
      // Get.back();
    }).show();
  }

  createPickupRequest(int pickuptype, int area, String pickupAddress,
      String note, String estimedparcel) async {
    Loading().show();

    Map<String, dynamic> data = {
      'pickuptype': json.encode(pickuptype),
      'area': json.encode(area),
      'pickupAddress': pickupAddress,
      'note': note,
      'estimedparcel': estimedparcel,
    };
    var jsonData;
    var response = await http.post(
        Uri.parse(rootUrl + "api/merchant/pickup/request"),
        headers: {
          'id': json.encode(pref.read("userId")),
          'Accept': 'application/json'
        },
        body: data,
        encoding: Encoding.getByName("utf-8"));

    jsonData = json.decode(response.body);

    Loading().dismiss();

    CustomDialog(Get.context,
        title: 'Message',
        body: jsonData['message'],
        isOkButton: true,
        okButtonText: "OK", okButtonClick: () {
      Get.back();
      Get.back();
    }).show();
  }

  createFoxsParcel({
    String cod,
    String price,
    String parcelType,
    String recipientName,
    String address,
    String phone,
    int parcelWeight,
    String note,
    int deliveryCharge,
    int extraDeliveryCharge,
    String divisionId,
    String districtId,
    String areaId,
    String package,
  }) async {
    Loading().show();
    var data = {
      "cod": cod,
      "sale_price": price,
      "percelType": parcelType,
      "recipientName": recipientName,
      "recipientAddress": address,
      "recipientPhone": phone,
      "productWeight": parcelWeight,
      "note": note,
      "deliveryCharge": deliveryCharge,
      "extraDeliveryCharge": extraDeliveryCharge,
      "division_id": divisionId,
      "district_id": districtId,
      "area_id": areaId,
      "package": package,
    };
    log(data.toString());
    final dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["id"] = pref.read("userId");

    var response = await dio.post(
      "${rootUrl}api/merchant/parcel/create",
      data: data,
    );

    log(response.data.toString());

    Loading().dismiss();
    CustomDialog(Get.context,
        title: 'Message',
        body: response.data['message'],
        isOkButton: true,
        okButtonText: "OK", okButtonClick: () {
      Get.back();
      Get.back();
    }).show();
  }

  Future<List<PickupModel>> getPickups(int startFrom) async {
    var jsonData;
    var response = await http
        .get(Uri.parse(rootUrl + "api/merchant/pickup/$startFrom"), headers: {
      'id': json.encode(pref.read("userId")),
      'Accept': 'application/json'
    });

    jsonData = json.decode(response.body);

    List<PickupModel> pickups = jsonData.map<PickupModel>((json) {
      return PickupModel.fromJson(json);
    }).toList();

    return pickups;
  }

  Future<DeliverymanModel> getDeliveryMen(int id) async {
    var jsonData;
    var response = await http.get(Uri.parse(rootUrl + "api/deliveryman/$id"));

    jsonData = json.decode(response.body);

    return DeliverymanModel.fromJson(jsonData);
  }

  Future<List<ParcelModel>> getParcels(int startFrom) async {
    var jsonData;
    var response = await http
        .get(Uri.parse(rootUrl + "api/merchant/parcels/$startFrom"), headers: {
      'id': json.encode(pref.read("userId")),
      'Accept': 'application/json'
    });
    jsonData = json.decode(response.body);
    print(jsonData.toString());

    List<ParcelModel> parcels = jsonData.map<ParcelModel>((json) {
      return ParcelModel.fromJson(json);
    }).toList();

    return parcels;
  }

  Future<ParcelDetailModel> getParcelDetails(String parcelTrackingCode) async {
    var jsonData;

    log('Percel tracking code : $parcelTrackingCode');
    var response = await http.get(
        Uri.parse(
          rootUrl + "api/parcel/track/$parcelTrackingCode",
          // rootUrl + "api/merchant/parcel/$parcelId",
        ),
        headers: {
          'id': json.encode(pref.read("userId")),
          'Accept': 'application/json'
        });
    // log(response.body);

    jsonData = json.decode(response.body);

    return ParcelDetailModel.fromJson(jsonData['parcel']);
  }

  Future<ServicesModel> getServiceById(int id) async {
    var jsonData;
    var response = await http.get(Uri.parse(
      rootUrl + "api/service/$id}",
    ));
    jsonData = json.decode(response.body);

    return ServicesModel.fromJson(jsonData);
  }

  updateParcel(
      String id,
      String name,
      String phoneNumber,
      String address,
      String invoiceNo,
      String weight,
      int parcelType,
      String cod,
      String productPrice,
      int receiveZone,
      String note,
      int deliveryCharge,
      int extraDeliveryCharge,
      int codCharge,
      int orderType,
      int codType) async {
    Loading().show();

    Map<String, dynamic> data = {
      'hidden_id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'address': address,
      'weight': weight,
      'percelType': json.encode(parcelType),
      'cod': cod,
      'reciveZone': json.encode(receiveZone),
      'note': note,
      'deliveryCharge': json.encode(deliveryCharge),
      'extraDeliveryCharge': json.encode(extraDeliveryCharge),
      'codCharge': json.encode(codCharge),
      'orderType': json.encode(orderType),
      'codType': json.encode(codType)
    };
    var jsonData;
    var response = await http.put(
        Uri.parse(rootUrl + "api/merchant/parcel/update"),
        headers: {
          'id': json.encode(pref.read("userId")),
          'Accept': 'application/json'
        },
        body: data,
        encoding: Encoding.getByName("utf-8"));

    jsonData = json.decode(response.body);

    Loading().dismiss();

    CustomDialog(Get.context,
        title: 'Message',
        body: jsonData['message'],
        isOkButton: true,
        okButtonText: "OK", okButtonClick: () {
      Get.back();
      Get.back();
    }).show();
  }

  Future<List<PaymentModel>> getPayments(int startFrom) async {
    log(pref.read("userId").toString());
    var jsonData;
    var response = await http
        .get(Uri.parse(rootUrl + "api/merchant/payments/$startFrom"), headers: {
      'id': json.encode(pref.read("userId")),
      'Accept': 'application/json'
    });
    jsonData = json.decode(response.body);
    print(jsonData.toString());

    List<PaymentModel> payments = jsonData.map<PaymentModel>((json) {
      return PaymentModel.fromJson(json);
    }).toList();

    return payments;
  }

  Future<List<ParcelModel>> getParcelPayments(int id) async {
    var jsonData;
    var response =
        await http.get(Uri.parse(rootUrl + "api/merchant/parcel/payments/$id"));
    jsonData = json.decode(response.body);
    // print(jsonData.toString());
    List<ParcelModel> payments = jsonData.map<ParcelModel>((json) {
      return ParcelModel.fromJson(json);
    }).toList();

    return payments;
  }

  Future<ParcelTrackModel> getParcelNotes(trackId) async {
    var jsonData;
    print(rootUrl + "api/parcel/track/$trackId");
    var response =
        await http.get(Uri.parse(rootUrl + "api/parcel/track/$trackId"));
    jsonData = json.decode(response.body);
    // log(jsonData.)
    return ParcelTrackModel.fromJson(jsonData);
  }

  support(String subject, String description) async {
    Loading().show();

    Map<String, dynamic> data = {
      'subject': subject,
      'description': description
    };
    var jsonData;
    var response = await http.post(Uri.parse(rootUrl + "api/merchant/support"),
        headers: {
          'id': json.encode(pref.read("userId")),
          'Accept': 'application/json'
        },
        body: data,
        encoding: Encoding.getByName("utf-8"));

    jsonData = json.decode(response.body);

    Loading().dismiss();

    CustomDialog(Get.context,
        title: 'Message',
        body: jsonData['message'],
        isOkButton: true,
        okButtonText: "Ok", okButtonClick: () {
      Get.back();
    }).show();
  }
}
