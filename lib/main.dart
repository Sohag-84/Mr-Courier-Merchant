/*
Author: QuickTech IT
Author URI: http://quicktech-ltd.com;
Description: QuickTech IT maintain standard quality for Website and Creative Design
*/

import 'dart:io';
import 'package:courier/Merchant/Auth/ForgetPassword.dart';
import 'package:courier/Merchant/Auth/Login.dart';
import 'package:courier/Merchant/Auth/OTPVerification.dart';
import 'package:courier/Merchant/Auth/PasswordVerify.dart';
import 'package:courier/Merchant/Auth/Registration.dart';
import 'package:courier/Merchant/Dashboard/Dashboard.dart';
import 'package:courier/Merchant/Parcel/CreateParcel.dart';
import 'package:courier/Merchant/Parcel/EditParcel.dart';
import 'package:courier/Merchant/Parcel/ParcelDetails.dart';
import 'package:courier/Merchant/Parcel/Parcels.dart';
import 'package:courier/Merchant/Parcel/TrackParcel.dart';
import 'package:courier/Merchant/Parcel/TrackParcelDetails.dart';
import 'package:courier/Merchant/Payments/Payments.dart';
import 'package:courier/Merchant/Pickup/PickupRequest.dart';
import 'package:courier/Merchant/Pickup/Pickups.dart';
import 'package:courier/Merchant/Profile/Profile.dart';
import 'package:courier/Merchant/Setting/Setting.dart';
import 'package:courier/Merchant/Support/Support.dart';
import 'package:courier/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  HttpOverrides.global = new MyHttpOverrides();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    // home: QuicktechIT_MerchantOTPVerification(),
    defaultTransition: Transition.fade,
    getPages: [
      GetPage(
        name: '/',
        page: () => QuickTechIT_SplashScreen(),
      ),
      GetPage(
        name: '/merchant/login',
        page: () => QuickTechIT_MerchantLogin(),
        transition: Transition.zoom,
      ),
      GetPage(
        name: '/merchant/otp/:phoneNumber',
        page: () => QuicktechIT_MerchantOTPVerification(),
      ),
      GetPage(
        name: '/merchant/reg',
        page: () => QuickTechIT_MerchantRegistration(),
      ),
      GetPage(
        name: '/merchant/password/reset',
        page: () => QuickTechIT_MerchantForgetPassword(),
      ),
      GetPage(
        name: '/merchant/password/verify/:id',
        page: () => QuickTechIT_MerchantPasswordVerify(),
      ),
      GetPage(
        name: '/merchant/home',
        page: () => QuickTechIT_Dashboard(),
        transition: Transition.zoom,
      ),
      GetPage(
        name: '/merchant/parcel/new',
        page: () => QuickTechIT_CreateParcel(),
      ),
      GetPage(
        name: '/merchant/parcel/list',
        page: () => QuickTechIT_Parcels(),
      ),
      GetPage(
        name: '/merchant/parcel/track',
        page: () => QuickTechIT_TrackParcel(),
      ),
      GetPage(
        name: '/merchant/parcel/track/:trackId',
        page: () => QuickTechIT_TrackParcelDetails(),
      ),
      GetPage(
        name: '/merchant/parcel/details/:id',
        page: () => QuickTechIT_ParcelDetails(),
      ),
      GetPage(
        name: '/merchant/parcel/edit/:id',
        page: () => QuickTechIT_EditParcel(),
      ),
      GetPage(
        name: '/merchant/pickup/request/:type',
        page: () => QuickTechIT_PickupRequest(),
      ),
      GetPage(
        name: '/merchant/pickup/list',
        page: () => QuickTechIT_Pickups(),
      ),
      GetPage(
        name: '/merchant/payments',
        page: () => QuickTechIT_Payments(),
      ),
      GetPage(
        name: '/merchant/settings',
        page: () => QuickTechIT_Setting(),
      ),
      GetPage(
        name: '/merchant/profile',
        page: () => QuickTechIT_Profile(),
      ),
      GetPage(
        name: '/merchant/support',
        page: () => QuickTechIT_Support(),
      ),
    ],
  ));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
