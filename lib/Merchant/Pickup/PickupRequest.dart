/*
Author: QuickTech IT
Author URI: http://quicktech-ltd.com;
Description: QuickTech IT maintain standard quality for Website and Creative Design
*/

import 'package:courier/GlobalUtils/Decoration.dart';
import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Merchant/Utils/MerchantBottomBar.dart';
import 'package:courier/Merchant/Utils/NavigationDrawer.dart';
import 'package:courier/Models/NearestZoneModel.dart';
import 'package:courier/Network/MerchantNetwork.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

// ignore: camel_case_types
class QuickTechIT_PickupRequest extends StatefulWidget {
  @override
  _QuickTechIT_PickupRequestState createState() =>
      _QuickTechIT_PickupRequestState();
}

// ignore: camel_case_types
class _QuickTechIT_PickupRequestState extends State<QuickTechIT_PickupRequest> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String type = Get.parameters['type'];

  TextEditingController pickupAddressController = new TextEditingController();
  TextEditingController noteController = new TextEditingController();
  TextEditingController estimatedParcelController = new TextEditingController();

  bool regularPickup = true;

  List<NearestZoneModel> area = []; // Option 2
  int _selectedArea;

  void initState() {
    MerchantNetwork().getNearestZones().then((value) {
      setState(() {
        area = value;
      });
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
          "Pickup Request",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: UIColors.pageBackground,
      endDrawer: NavigationDrawer(),
      bottomNavigationBar: MerchantBottomBar(),
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Container(
                      width: Get.width,
                      child: Text("Pickup Address",
                          style: TextStyle(
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(2),
                              color: UIColors.blackColor),
                          textAlign: TextAlign.left)),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 100,
                    decoration: CustomDecoration().textFieldDecoration(),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: pickupAddressController,
                      validator: (value) =>
                          value == "" ? 'Please enter pickup address' : null,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(color: Colors.grey.withOpacity(.8)),
                        hintText: "Pickup Address",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: Get.width,
                      child: Text("Area",
                          style: TextStyle(
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(2),
                              color: Colors.black),
                          textAlign: TextAlign.left)),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    decoration: CustomDecoration().textFieldDecoration(),
                    child: DropdownButtonFormField(
                      hint: Text(
                        "Area",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: Colors.grey.withOpacity(.8)),
                      ), // Not necessary for Option 1
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                      ),
                      validator: (value) =>
                          value == null ? "Please select area" : null,
                      isExpanded: true,
                      value: _selectedArea,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedArea = newValue;
                        });
                      },
                      items: area.map((NearestZoneModel value) {
                        return DropdownMenuItem(
                          child: new Text(value.zonename),
                          value: value.id,
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text("Note (Optional)",
                          style: TextStyle(
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(2),
                              color: Colors.black),
                          textAlign: TextAlign.left)),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 100,
                    decoration: CustomDecoration().textFieldDecoration(),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: noteController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(color: Colors.grey.withOpacity(.8)),
                        hintText: "Note",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: Get.width,
                      child: Text('Estimated Parcel (Optional)',
                          style: TextStyle(
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(2),
                              color: Colors.black),
                          textAlign: TextAlign.left)),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 100,
                    decoration: CustomDecoration().textFieldDecoration(),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: estimatedParcelController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(color: Colors.grey.withOpacity(.8)),
                        hintText: 'Estimated Parcel',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: Get.width,
                    child: CheckboxListTile(
                      title: Text(
                        'Regular Pickup',
                        style: TextStyle(
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2)),
                      ),
                      value: regularPickup,
                      onChanged: (bool value) {
                        setState(() {
                          regularPickup = value;
                        });
                      },
                      activeColor: Colors.green,
                      checkColor: Colors.white,
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: CustomDecoration().buttonDecoration(),
                    child: TextButton(
                      style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(8.0))),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          MerchantNetwork().createPickupRequest(
                              int.parse(type),
                              _selectedArea,
                              pickupAddressController.text,
                              noteController.text,
                              estimatedParcelController.text);
                        }
                      },
                      child: Text(
                        'Send Request',
                        style: TextStyle(
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2.2),
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
