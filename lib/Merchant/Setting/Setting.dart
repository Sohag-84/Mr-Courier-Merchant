/*
Author: QuickTech IT
Author URI: http://quicktech-ltd.com;
Description: QuickTech IT maintain standard quality for Website and Creative Design
*/

import 'package:animated_widgets/widgets/scale_animated.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:courier/GlobalUtils/Decoration.dart';
import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Merchant/Utils/MerchantBottomBar.dart';
import 'package:courier/Merchant/Utils/NavigationDrawer.dart';
import 'package:courier/Models/MerchantModel.dart';
import 'package:courier/Models/NearestZoneModel.dart';
import 'package:courier/Network/MerchantNetwork.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

// ignore: camel_case_types
class QuickTechIT_Setting extends StatefulWidget {
  @override
  _QuickTechIT_SettingState createState() => _QuickTechIT_SettingState();
}

// ignore: camel_case_types
class _QuickTechIT_SettingState extends State<QuickTechIT_Setting> {
  bool companyInformation = true,
      ownerInformation = false,
      pickupMethod = false,
      paymentMethod = false,
      bankAccount = false,
      otherAccount = false;

  TextEditingController phoneController = new TextEditingController();
  TextEditingController pickupAddressController = new TextEditingController();
  TextEditingController bankNameController = new TextEditingController();
  TextEditingController branchController = new TextEditingController();
  TextEditingController holderNameController = new TextEditingController();
  TextEditingController bankAcNoController = new TextEditingController();
  TextEditingController bkashController = new TextEditingController();
  TextEditingController rocketController = new TextEditingController();
  TextEditingController nogodController = new TextEditingController();

  List<String> pickupPreference = ['As Per Request', 'Daily']; // Option 2
  int _selectedPickupPreference;

  List<String> defaultPayment = [
    'Bank',
    'Bkash',
    'Rocket',
    'Nogod'
  ]; // Option 2
  int _selectedDefaultPayment;

  List<String> withdrawal = ['As Per Request', 'Daily', 'Weekly']; // Option 2
  int _selectedWithdrawal;

  MerchantModel userData;

  List<NearestZoneModel> nearestZone = [];
  int _selectedNearestZone;

  @override
  void initState() {
    getData();

    super.initState();
  }

  getData() {
    MerchantNetwork().getUserData().then((value) {
      setState(() {
        userData = value;

        phoneController.text =
            userData.phoneNumber == null ? "" : "${userData.phoneNumber}";
        pickupAddressController.text =
            userData.pickLocation == null ? "" : userData.pickLocation;
        bankNameController.text =
            userData.nameOfBank == null ? "" : userData.nameOfBank;
        branchController.text =
            userData.bankBranch == null ? "" : userData.bankBranch;
        holderNameController.text =
            userData.bankAcHolder == null ? "" : userData.bankAcHolder;
        bankAcNoController.text =
            userData.bankAcNo == null ? "" : userData.bankAcNo.toString();
        bkashController.text =
            userData.bkashNumber == null ? "" : "0${userData.bkashNumber}";
        rocketController.text =
            userData.roketNumber == null ? "" : "0${userData.roketNumber}";
        nogodController.text =
            userData.nogodNumber == null ? "" : "0${userData.nogodNumber}";
        _selectedDefaultPayment = userData.paymentMethod != null
            ? userData.paymentMethod - 1
            : userData.paymentMethod;
        _selectedPickupPreference = userData.pickupPreference != null
            ? userData.pickupPreference - 1
            : userData.pickupPreference;
        _selectedWithdrawal = userData.withdrawal != null
            ? userData.withdrawal - 1
            : userData.withdrawal;
      });
    });

    MerchantNetwork().getNearestZones().then((value) {
      setState(() {
        nearestZone = value;

        _selectedNearestZone =
            userData.nearestZone != null ? userData.nearestZone : null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        elevation: 0,
        backgroundColor: UIColors.primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Setting",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: UIColors.pageBackground,
      endDrawer: NavigationDrawer(),
      bottomNavigationBar: MerchantBottomBar(),
      body: userData == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: <
                      Widget>[
                Container(
                  width: Get.width,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(UIColors.primaryColor2),
                      padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      )),
                    ),
                    child: Text(
                      'Company Information',
                      style: TextStyle(
                          fontSize: ResponsiveFlutter.of(context).fontSize(2.3),
                          color: Colors.white),
                    ),
                    onPressed: () {
                      pageChange(0);
                    },
                  ),
                ),
                companyInformation
                    ? ScaleAnimatedWidget.tween(
                        enabled: true,
                        duration: Duration(milliseconds: 300),
                        scaleDisabled: 0.3,
                        scaleEnabled: 1,
                        child: companyInformationWidget())
                    : Divider(),
                Container(
                  width: Get.width,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(UIColors.primaryColor2),
                      padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      )),
                    ),
                    child: Text(
                      'Owner Information',
                      style: TextStyle(
                          fontSize: ResponsiveFlutter.of(context).fontSize(2.3),
                          color: Colors.white),
                    ),
                    onPressed: () {
                      pageChange(1);
                    },
                  ),
                ),
                ownerInformation
                    ? ScaleAnimatedWidget.tween(
                        enabled: true,
                        duration: Duration(milliseconds: 300),
                        scaleDisabled: 0.3,
                        scaleEnabled: 1,
                        child: ownerInformationWidget())
                    : Divider(),
                Container(
                  width: Get.width,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(UIColors.primaryColor2),
                      padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      )),
                    ),
                    child: Text(
                      'Pickup Method',
                      style: TextStyle(
                          fontSize: ResponsiveFlutter.of(context).fontSize(2.3),
                          color: Colors.white),
                    ),
                    onPressed: () {
                      pageChange(2);
                    },
                  ),
                ),
                pickupMethod
                    ? ScaleAnimatedWidget.tween(
                        enabled: true,
                        duration: Duration(milliseconds: 300),
                        scaleDisabled: 0.3,
                        scaleEnabled: 1,
                        child: pickupMethodWidget())
                    : Divider(),
                Container(
                  width: Get.width,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(UIColors.primaryColor2),
                      padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      )),
                    ),
                    child: Text(
                      'Payment Method',
                      style: TextStyle(
                          fontSize: ResponsiveFlutter.of(context).fontSize(2.3),
                          color: Colors.white),
                    ),
                    onPressed: () {
                      pageChange(3);
                    },
                  ),
                ),
                paymentMethod
                    ? ScaleAnimatedWidget.tween(
                        enabled: true,
                        duration: Duration(milliseconds: 300),
                        scaleDisabled: 0.3,
                        scaleEnabled: 1,
                        child: paymentMethodWidget())
                    : Divider(),
                Container(
                  width: Get.width,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(UIColors.primaryColor2),
                      padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      )),
                    ),
                    child: Text(
                      'Bank Account',
                      style: TextStyle(
                          fontSize: ResponsiveFlutter.of(context).fontSize(2.3),
                          color: Colors.white),
                    ),
                    onPressed: () {
                      pageChange(4);
                    },
                  ),
                ),
                bankAccount
                    ? ScaleAnimatedWidget.tween(
                        enabled: true,
                        duration: Duration(milliseconds: 300),
                        scaleDisabled: 0.3,
                        scaleEnabled: 1,
                        child: bankAccountWidget())
                    : Divider(),
                Container(
                  width: Get.width,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(UIColors.primaryColor2),
                      padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      )),
                    ),
                    child: Text(
                      'Other Account',
                      style: TextStyle(
                          fontSize: ResponsiveFlutter.of(context).fontSize(2.3),
                          color: Colors.white),
                    ),
                    onPressed: () {
                      pageChange(5);
                    },
                  ),
                ),
                if (otherAccount)
                  ScaleAnimatedWidget.tween(
                      enabled: true,
                      duration: Duration(milliseconds: 300),
                      scaleDisabled: 0.3,
                      scaleEnabled: 1,
                      child: otherAccountWidget()),
                SizedBox(
                  height: 70,
                ),
              ])),
    );
  }

  void pageChange(int index) {
    switch (index) {
      case 0:
        setState(() {
          companyInformation = true;
          ownerInformation = false;
          pickupMethod = false;
          paymentMethod = false;
          bankAccount = false;
          otherAccount = false;
        });
        break;
      case 1:
        setState(() {
          companyInformation = false;
          ownerInformation = true;
          pickupMethod = false;
          paymentMethod = false;
          bankAccount = false;
          otherAccount = false;
        });
        break;
      case 2:
        setState(() {
          companyInformation = false;
          ownerInformation = false;
          pickupMethod = true;
          paymentMethod = false;
          bankAccount = false;
          otherAccount = false;
        });
        break;
      case 3:
        setState(() {
          companyInformation = false;
          ownerInformation = false;
          pickupMethod = false;
          paymentMethod = true;
          bankAccount = false;
          otherAccount = false;
        });
        break;
      case 4:
        setState(() {
          companyInformation = false;
          ownerInformation = false;
          pickupMethod = false;
          paymentMethod = false;
          bankAccount = true;
          otherAccount = false;
        });
        break;
      case 5:
        setState(() {
          companyInformation = false;
          ownerInformation = false;
          pickupMethod = false;
          paymentMethod = false;
          bankAccount = false;
          otherAccount = true;
        });
        break;
    }
  }

  companyInformationWidget() {
    return Container(
      width: Get.width,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'Business Information',
            style: TextStyle(
              fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Company Name',
            style: TextStyle(
              fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            userData.companyName == null ? "" : userData.companyName,
            style: TextStyle(
                fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  ownerInformationWidget() {
    return Container(
      width: Get.width,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width,
            child: Text(
              'Owner Information',
              style: TextStyle(
                fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Name',
            style: TextStyle(
              fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            userData.firstName == null ? "" : userData.firstName,
            style: TextStyle(
                fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                color: UIColors.blackColor),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: Get.width,
            child: Text(
              'Mobile',
              style: TextStyle(
                color: UIColors.blackColor,
                fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: phoneController,
            validator: (phone) {
              if (phone.length == 0) {
                return 'Please enter Mobile Number';
              } else if (phone.length != 11)
                return 'Mobile Number must be of 11 digit';
              else
                return null;
            },
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIColors.primaryColor, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIColors.primaryColor, width: 2.0),
              ),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIColors.primaryColor, width: 1.0),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Email',
            style: TextStyle(
              fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            userData.emailAddress == null ? "" : userData.emailAddress,
            style: TextStyle(
                fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                color: UIColors.blackColor),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: Get.width,
            decoration: CustomDecoration().buttonDecoration(),
            child: TextButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(8.0))),
              onPressed: () {
                updateData();
              },
              child: Text(
                "Update",
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  pickupMethodWidget() {
    return Container(
      width: Get.width,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width,
            child: Text(
              'Pickup Method',
              style: TextStyle(
                fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Pickup Address',
            style: TextStyle(
              fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: pickupAddressController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIColors.primaryColor, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIColors.primaryColor, width: 2.0),
              ),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIColors.primaryColor, width: 1.0),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: Get.width,
            child: Text(
              'Nearest Zone',
              style: TextStyle(
                color: UIColors.blackColor,
                fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          // Container(
          //   width: Get.width,
          //   padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          //   decoration: BoxDecoration(
          //     border: Border.all(color: UIColors.primaryColor),
          //     borderRadius: BorderRadius.circular(4),
          //   ),
          //   child: DropdownButtonFormField(
          //     hint: Text(
          //       'Please Select',
          //       style: TextStyle(
          //           fontSize: ResponsiveFlutter.of(context).fontSize(2),
          //           color: UIColors.blackColor.withOpacity(.8)),
          //     ), // Not necessary for Option 1
          //     decoration: InputDecoration(
          //       enabledBorder: InputBorder.none,
          //     ),
          //     validator: (value) => value == null ? 'Please Select' : null,
          //     isExpanded: true,
          //     value: _selectedNearestZone,
          //     onChanged: (newValue) {
          //       setState(() {
          //         _selectedNearestZone = newValue;
          //       });
          //     },
          //     items: nearestZone.map((NearestZoneModel value) {
          //       return DropdownMenuItem(
          //         child: new Text(value.zonename),
          //         value: value.id,
          //       );
          //     }).toList(),
          //   ),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          Container(
            width: Get.width,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            decoration: BoxDecoration(
              border: Border.all(color: UIColors.primaryColor),
              borderRadius: BorderRadius.circular(4),
            ),
            child: DropdownSearch<dynamic>(
              dropdownSearchDecoration: InputDecoration(
                enabledBorder: InputBorder.none,
              ),
              items: nearestZone.map((NearestZoneModel value) {
                return value.zonename;
              }).toList(),

              onChanged: (value) {
                setState(() {
                  _selectedNearestZone = 0;
                });
              },

              // selectedItem: _selectedDeliveryArea,
              showSearchBox: true,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Pickup Preference',
            style: TextStyle(
              fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: Get.width,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            decoration: BoxDecoration(
              border: Border.all(color: UIColors.primaryColor),
              borderRadius: BorderRadius.circular(4),
            ),
            child: DropdownButtonFormField(
              hint: Text(
                'Please Select',
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    color: UIColors.blackColor.withOpacity(.8)),
              ), // Not necessary for Option 1
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
              ),
              validator: (value) => value == null ? 'Please Select' : null,
              isExpanded: true,
              value: _selectedPickupPreference,
              onChanged: (newValue) {
                setState(() {
                  _selectedPickupPreference = newValue;
                });
              },
              items: pickupPreference.map((value) {
                return DropdownMenuItem(
                  child: new Text(value),
                  value: pickupPreference.indexOf(value),
                );
              }).toList(),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: Get.width,
            decoration: CustomDecoration().buttonDecoration(),
            child: TextButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(8.0))),
              onPressed: () {
                updateData();
              },
              child: Text(
                'Update',
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  paymentMethodWidget() {
    return Container(
      width: Get.width,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width,
            child: Text(
              'Payment Method',
              style: TextStyle(
                fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: Get.width,
            child: Text(
              'Default Payment',
              style: TextStyle(
                color: UIColors.blackColor,
                fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: Get.width,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            decoration: BoxDecoration(
              border: Border.all(color: UIColors.primaryColor),
              borderRadius: BorderRadius.circular(4),
            ),
            child: DropdownButtonFormField(
              hint: Text(
                'Please Select',
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    color: UIColors.blackColor.withOpacity(.8)),
              ), // Not necessary for Option 1
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
              ),
              validator: (value) => value == null ? 'Please Select' : null,
              isExpanded: true,
              value: _selectedDefaultPayment,
              onChanged: (newValue) {
                setState(() {
                  _selectedDefaultPayment = newValue;
                });
              },
              items: defaultPayment.map((value) {
                return DropdownMenuItem(
                  child: new Text(value),
                  value: defaultPayment.indexOf(value),
                );
              }).toList(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Withdrawal',
            style: TextStyle(
              fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: Get.width,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            decoration: BoxDecoration(
              border: Border.all(color: UIColors.primaryColor),
              borderRadius: BorderRadius.circular(4),
            ),
            child: DropdownButtonFormField(
              hint: Text(
                'Please Select',
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    color: UIColors.blackColor.withOpacity(.8)),
              ), // Not necessary for Option 1
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
              ),
              validator: (value) => value == null ? 'Please Select' : null,
              isExpanded: true,
              value: _selectedWithdrawal,
              onChanged: (newValue) {
                setState(() {
                  _selectedWithdrawal = newValue;
                });
              },
              items: withdrawal.map((value) {
                return DropdownMenuItem(
                  child: new Text(value),
                  value: withdrawal.indexOf(value),
                );
              }).toList(),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: Get.width,
            decoration: CustomDecoration().buttonDecoration(),
            child: TextButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(8.0))),
              onPressed: () {
                updateData();
              },
              child: Text(
                'Update',
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bankAccountWidget() {
    return Container(
      width: Get.width,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width,
            child: Text(
              'Bank Account',
              style: TextStyle(
                fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Name of Bank',
            style: TextStyle(
              fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: bankNameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIColors.primaryColor, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIColors.primaryColor, width: 2.0),
              ),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIColors.primaryColor, width: 1.0),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: Get.width,
            child: Text(
              'Branch',
              style: TextStyle(
                color: UIColors.blackColor,
                fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: branchController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIColors.primaryColor, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIColors.primaryColor, width: 2.0),
              ),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIColors.primaryColor, width: 1.0),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'A/C Holder Name',
            style: TextStyle(
              fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: holderNameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIColors.primaryColor, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIColors.primaryColor, width: 2.0),
              ),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIColors.primaryColor, width: 1.0),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Bank A/C No',
            style: TextStyle(
              fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: bankAcNoController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIColors.primaryColor, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIColors.primaryColor, width: 2.0),
              ),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIColors.primaryColor, width: 1.0),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: Get.width,
            decoration: CustomDecoration().buttonDecoration(),
            child: TextButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(8.0))),
              onPressed: () {
                updateData();
              },
              child: Text(
                'Update',
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  otherAccountWidget() {
    return Container(
      width: Get.width,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width,
            child: Text(
              'Other Account',
              style: TextStyle(
                fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Bkash',
            style: TextStyle(
              fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: bkashController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIColors.primaryColor, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIColors.primaryColor, width: 2.0),
              ),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIColors.primaryColor, width: 1.0),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: Get.width,
            child: Text(
              'Rocket',
              style: TextStyle(
                color: UIColors.blackColor,
                fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: rocketController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIColors.primaryColor, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIColors.primaryColor, width: 2.0),
              ),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIColors.primaryColor, width: 1.0),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Nogod',
            style: TextStyle(
              fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: nogodController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIColors.primaryColor, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIColors.primaryColor, width: 2.0),
              ),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: UIColors.primaryColor, width: 1.0),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: Get.width,
            decoration: CustomDecoration().buttonDecoration(),
            child: TextButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(8.0))),
              onPressed: () {
                updateData();
              },
              child: Text(
                'Update',
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  updateData() {
    FocusScope.of(context).requestFocus(new FocusNode());
    MerchantNetwork()
        .updateUserData(
            phoneController.text,
            pickupAddressController.text,
            _selectedNearestZone != null
                ? _selectedNearestZone.toString()
                : null,
            _selectedPickupPreference != null
                ? (_selectedPickupPreference + 1).toString()
                : null,
            _selectedDefaultPayment != null
                ? (_selectedDefaultPayment + 1).toString()
                : null,
            _selectedWithdrawal != null
                ? (_selectedWithdrawal + 1).toString()
                : null,
            bankNameController.text,
            branchController.text,
            holderNameController.text,
            bankAcNoController.text,
            bkashController.text,
            rocketController.text,
            nogodController.text)
        .then((value) {
      if (value != null) {
        getData();
        // setState(() {
        //   userData = value;
        //
        //   phoneController.text = "0${userData.phoneNumber}";
        //   pickupAddressController.text = userData.pickLocation;
        //   bankNameController.text = userData.nameOfBank;
        //   branchController.text = userData.bankBranch;
        //   holderNameController.text = userData.bankAcHolder;
        //   bankAcNoController.text = userData.bankAcNo.toString();
        //   bkashController.text = "0${userData.bkashNumber}";
        //   rocketController.text = "0${userData.roketNumber}";
        //   nogodController.text = "0${userData.nogodNumber}";
        //   _selectedDefaultPayment = userData.paymentMethod - 1;
        //   _selectedPickupPreference = userData.pickupPreference - 1;
        //   _selectedWithdrawal = userData.withdrawal - 1;
        //   _selectedNearestZone = userData.nearestZone;
        // });
      }
    });
  }
}
