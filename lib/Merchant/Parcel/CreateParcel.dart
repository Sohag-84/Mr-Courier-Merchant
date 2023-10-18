/*
Author: QuickTech IT
Author URI: http://quicktech-ltd.com;
Description: QuickTech IT maintain standard quality for Website and Creative Design
*/

import 'dart:developer';

import 'package:courier/GlobalUtils/Decoration.dart';
import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Merchant/Parcel/services/charge_of_delivery_service.dart';
import 'package:courier/Merchant/Parcel/services/districts_service.dart';
import 'package:courier/Merchant/Parcel/services/divisions_service.dart';
import 'package:courier/Merchant/Parcel/services/get_are_service.dart';
import 'package:courier/Merchant/Parcel/services/unions_service.dart';

import 'package:courier/Merchant/Utils/MerchantBottomBar.dart';
import 'package:courier/Merchant/Utils/NavigationDrawer.dart';
import 'package:courier/Models/CodChargeModel.dart';
import 'package:courier/Models/NearestZoneModel.dart';
import 'package:courier/Models/ServicesModel.dart';
import 'package:courier/Network/MerchantNetwork.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

import 'models/charge_of_delivery_model.dart';
import 'models/districts_model.dart';
import 'models/divisions_model.dart';
import 'models/get_area_model.dart';
import 'models/unions_model.dart';

// ignore: camel_case_types
class QuickTechIT_CreateParcel extends StatefulWidget {
  @override
  _QuickTechIT_CreateParcelState createState() =>
      _QuickTechIT_CreateParcelState();
}

// ignore: camel_case_types
class _QuickTechIT_CreateParcelState extends State<QuickTechIT_CreateParcel> {
  // String slug = Get.parameters['slug'];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController customerNameController = new TextEditingController();
  TextEditingController customerPhoneController = new TextEditingController();
  TextEditingController deliveryAddressController = new TextEditingController();
  TextEditingController invoiceController = new TextEditingController();
  TextEditingController weightController = new TextEditingController();
  TextEditingController cashCollectionController = new TextEditingController();
  TextEditingController productPriceController = new TextEditingController();
  TextEditingController noteController = new TextEditingController();

  List<String> parcelType = ['Regular', 'Liquid']; // Option 2
  int _selectedParcelType;

  List<NearestZoneModel> deliveryArea = []; // Option 2
  int _selectedDeliveryArea;
  String deliveryAreaString;

  List<DivisionsModel> divisions = [];
  int _selectedDivision;

  List<ServicesModel> services = [];
  ServicesModel selectedPackage;
  CodChargeModel codCharge;
  ChargeOfDeliveryModel chargeOfDeliveryModel;
  int cashCollection = 0;
  int parcelWeight = 0;

  void initState() {
    MerchantNetwork().getNearestZones().then((value) {
      setState(() {
        deliveryArea = value;
      });
    });

    DivisionsService().fetchDivision().then((value) {
      setState(() {
        divisions = value;
      });
    });

    MerchantNetwork().getServices().then((value) {
      setState(() {
        services = value;
      });
    });

    // MerchantNetwork().getCodCharge().then((value) {
    //   setState(() {
    //     codCharge = value;
    //   });
    // });

    ChargeOfDeliveryService().fetchChargeOfDelivery().then((value) => {
          setState(() {
            chargeOfDeliveryModel = value;
          })
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
      primary: true,
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
          "Add New Parcel",
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
            child: Column(
              children: <Widget>[
                Container(
                    width: Get.width,
                    child: Text("Customer Name",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: UIColors.blackColor),
                        textAlign: TextAlign.left)),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: CustomDecoration().textFieldDecoration(),
                  child: TextFormField(
                    controller: customerNameController,
                    validator: (value) =>
                        value == "" ? "Please enter customer name" : null,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                      hintText: "Customer Name",
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: Get.width,
                    child: Text("Customer Phone Number",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: UIColors.blackColor),
                        textAlign: TextAlign.left)),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: CustomDecoration().textFieldDecoration(),
                  child: TextFormField(
                    controller: customerPhoneController,
                    validator: (phone) {
                      if (phone.length == 0) {
                        return "Please enter phone number";
                      } else if (phone.length != 11)
                        return "Phone number must be 11 digit";
                      else
                        return null;
                    },
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                      hintText: "Customer Phone Number",
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: Get.width,
                    child: Text("Customer Address",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
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
                    controller: deliveryAddressController,
                    validator: (value) =>
                        value == "" ? "Please enter Customer address" : null,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                      hintText: "Customer Address",
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Container(
                //     width: Get.width,
                //     child: Text("Invoice",
                //         style: TextStyle(
                //             fontSize: ResponsiveFlutter.of(context).fontSize(2),
                //             color: UIColors.blackColor),
                //         textAlign: TextAlign.left)),
                // SizedBox(
                //   height: 5,
                // ),
                // Container(
                //   decoration: BoxDecoration(
                //     border: Border.all(color: Colors.grey),
                //     borderRadius: BorderRadius.circular(2),
                //   ),
                //   child: TextFormField(
                //     controller: invoiceController,
                //     validator: (value) =>
                //         value == "" ? "Please enter invoice number" : null,
                //     keyboardType: TextInputType.number,
                //     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                //     decoration: InputDecoration(
                //       contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                //       border: InputBorder.none,
                //       hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                //       hintText: "Invoice Number",
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                Container(
                    width: Get.width,
                    child: Text("Weight",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: UIColors.blackColor),
                        textAlign: TextAlign.left)),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: CustomDecoration().textFieldDecoration(),
                  child: TextFormField(
                    controller: weightController,
                    onChanged: (val) {
                      setState(() {
                        parcelWeight = int.parse(val);
                      });
                      generateFasterLogisticsCharge();
                    },
                    validator: (value) =>
                        value == "" ? "Please enter parcel weight" : null,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                      hintText: "Weight",
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: Get.width,
                    child: Text("Package",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: UIColors.blackColor),
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
                      "Select Package",
                      style: TextStyle(
                          fontSize: ResponsiveFlutter.of(context).fontSize(2),
                          color: Colors.grey.withOpacity(.8)),
                    ), // Not necessary for Option 1
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                    ),
                    validator: (value) => value == null
                        ? "Please select your parcel package"
                        : null,
                    isExpanded: true,
                    value: selectedPackage,
                    onChanged: (newValue) {
                      setState(() {
                        selectedPackage = newValue;
                      });
                      log(selectedPackage.deliverycharge.toString());
                      generateFasterLogisticsCharge();
                    },
                    items: services.map((ServicesModel value) {
                      return DropdownMenuItem(
                        child: new Text(value.title),
                        value: value,
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: Get.width,
                    child: Text("Parcel Type",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: UIColors.blackColor),
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
                      "Select",
                      style: TextStyle(
                          fontSize: ResponsiveFlutter.of(context).fontSize(2),
                          color: Colors.grey.withOpacity(.8)),
                    ), // Not necessary for Option 1
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                    ),
                    validator: (value) =>
                        value == null ? "Please select your parcel type" : null,
                    isExpanded: true,
                    value: _selectedParcelType,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedParcelType = newValue;
                      });
                      generateFasterLogisticsCharge();
                    },
                    items: parcelType.map((value) {
                      return DropdownMenuItem(
                        child: new Text(value),
                        value: parcelType.indexOf(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: Get.width,
                    child: Text("Cash Collection Amount",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: UIColors.blackColor),
                        textAlign: TextAlign.left)),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: CustomDecoration().textFieldDecoration(),
                  child: TextFormField(
                    controller: cashCollectionController,
                    onChanged: (val) {
                      setState(() {
                        cashCollection = int.parse(val);
                        generateFasterLogisticsCharge();
                      });
                    },
                    validator: (value) =>
                        value == "" ? "Please enter Amount" : null,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                      hintText: "Cash Collection Amount",
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Container(
                //     width: Get.width,
                //     child: Text("Product Price",
                //         style: TextStyle(
                //             fontSize: ResponsiveFlutter.of(context).fontSize(2),
                //             color: UIColors.blackColor),
                //         textAlign: TextAlign.left)),
                // SizedBox(
                //   height: 5,
                // ),
                // Container(
                //   decoration: BoxDecoration(
                //     border: Border.all(color: Colors.grey),
                //     borderRadius: BorderRadius.circular(2),
                //   ),
                //   child: TextFormField(
                //     controller: productPriceController,
                //     validator: (value) =>
                //         value == "" ? "Please enter Product price" : null,
                //     keyboardType: TextInputType.number,
                //     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                //     decoration: InputDecoration(
                //       contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                //       border: InputBorder.none,
                //       hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                //       hintText: "Product Price",
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                selectDivisionWidget(context),
                selectDistrictWidget(context),
                selectAreaWidget(context),
                // Container(
                //     width: Get.width,
                //     child: Text("Select Area",
                //         style: TextStyle(
                //             fontSize: ResponsiveFlutter.of(context).fontSize(2),
                //             color: UIColors.blackColor),
                //         textAlign: TextAlign.left)),
                // SizedBox(
                //   height: 5,
                // ),
                // Container(
                //   // width: Get.width,
                //   padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                //   decoration: CustomDecoration().textFieldDecoration(),
                //   child: DropdownSearch<dynamic>(
                //     dropdownSearchDecoration: InputDecoration(
                //       enabledBorder: InputBorder.none,
                //     ),
                //     // items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                //     items: deliveryArea.map((NearestZoneModel value) {
                //       return value.zonename;
                //     }).toList(),
                //     onChanged: (value) {
                //       for (var i = 0; i < deliveryArea.length; i++) {
                //         if (deliveryArea[i].zonename == value) {
                //           log(deliveryArea[i].toJson().toString());
                //           _selectedDeliveryArea = deliveryArea[i].id;

                //           break;
                //         }
                //       }
                //       log(_selectedDeliveryArea.toString());
                //       // setState(() {
                //       //   _selectedDeliveryArea = 0;
                //       // });
                //     },

                //     selectedItem: deliveryAreaString,
                //     showSearchBox: true,
                //   ),
                // ),
                // selectUnionWidget(context),
                // Container(
                //     width: Get.width,
                //     child: Text("Delivery Area",
                //         style: TextStyle(
                //             fontSize: ResponsiveFlutter.of(context).fontSize(2),
                //             color: UIColors.blackColor),
                //         textAlign: TextAlign.left)),
                // SizedBox(
                //   height: 5,
                // ),
                // Container(
                //   width: Get.width,
                //   padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                //   decoration: CustomDecoration().textFieldDecoration(),
                //   child: DropdownButtonFormField(
                //     hint: Text(
                //       "Delivery Area",
                //       style: TextStyle(
                //           fontSize: ResponsiveFlutter.of(context).fontSize(2),
                //           color: Colors.grey.withOpacity(.8)),
                //     ), // Not necessary for Option 1
                //     decoration: InputDecoration(
                //       enabledBorder: InputBorder.none,
                //     ),
                //     validator: (value) =>
                //         value == null ? "Please select delivery area" : null,
                //     isExpanded: true,
                //     value: _selectedDeliveryArea,
                //     onChanged: (newValue) {
                //       setState(() {
                //         _selectedDeliveryArea = newValue;
                //       });
                //     },
                //     items: deliveryArea.map((NearestZoneModel value) {
                //       return DropdownMenuItem(
                //         child: new Text(value.zonename),
                //         value: value.id,
                //       );
                //     }).toList(),
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: Get.width,
                    child: Text("Note",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
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
                    controller: noteController,
                    // validator: (value) => value == "" ? "Note" : null,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                      hintText: "Note",
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                deliveryChargeDetails(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: Get.width,
                  decoration: CustomDecoration().buttonDecoration(),
                  child: TextButton(
                    style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(EdgeInsets.all(8.0))),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        String name = customerNameController.text;
                        String phoneNumber = customerPhoneController.text;
                        String address = deliveryAddressController.text;
                        String invoiceNo = invoiceController.text;
                        String weight = weightController.text;
                        int parcelType = _selectedParcelType + 1;
                        String cod = cashCollectionController.text;
                        String productPrice = productPriceController.text;
                        int receiveZone = _selectedDeliveryArea;
                        String note = noteController.text;
                        int deliveryCharge = selectedPackage.deliverycharge;
                        int extraDeliveryCharge =
                            selectedPackage.extradeliverycharge;
                        int codCharge = 0;
                        int orderType = selectedPackage.id;
                        int codType = 0;

                        // MerchantNetwork().createParcel(
                        // name,
                        // phoneNumber,
                        // address,
                        // invoiceNo,
                        // weight,
                        // parcelType,
                        // cod ?? 0,
                        // productPrice,
                        // receiveZone,
                        // note,
                        // deliveryCharge,
                        // extraDeliveryCharge,
                        // codCharge,
                        // orderType,
                        // codType,
                        // divisionId: _selectedDivision,
                        // districtId: _selectedDistrict,
                        // );
                        MerchantNetwork().createFoxsParcel(
                          cod: cod,
                          price: productPrice,
                          parcelType: parcelType.toString(),
                          recipientName: name,
                          address: address,
                          phone: phoneNumber,
                          parcelWeight: int.parse(weight ?? 1),
                          note: note,
                          deliveryCharge: deliveryCharge,
                          extraDeliveryCharge: extraDeliveryCharge,
                          divisionId: _selectedDivision.toString(),
                          districtId: _selectedDistrict.toString(),
                          areaId: _selectedDeliveryArea.toString(),
                          package: selectedPackage.id.toString(),
                        );
                      }
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
          )),
    );
  }

  ListView selectDivisionWidget(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: false,
      padding: EdgeInsets.only(bottom: 10),
      children: [
        Container(
            width: Get.width,
            child: Text("Select Division",
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    color: UIColors.blackColor),
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
              "Select Division",
              style: TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(2),
                  color: Colors.grey.withOpacity(.8)),
            ), // Not necessary for Option 1
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
            ),
            validator: (value) =>
                value == null ? "Please select division" : null,
            isExpanded: true,
            value: _selectedDivision,
            onChanged: (newValue) async {
              setState(() {
                _selectedDivision = newValue;
              });
              log(_selectedDivision.toString());
              await setDistrictsList();
            },
            items: divisions.map((DivisionsModel value) {
              return DropdownMenuItem(
                child: new Text(value.name),
                value: value.id,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  List<DistrictList> districtsList = [];
  // DistrictsModel districtsModel;
  int _selectedDistrict;
  Future setDistrictsList() async {
    _selectedDistrict = null;
    districtsList.clear();
    DistrictsModel temp;
    List tempDistrictsList;
    temp =
        await DistrictsService().fetchDistricts(divisionId: _selectedDivision);
    tempDistrictsList = temp.districtList;
    setState(() {
      districtsList = tempDistrictsList;
      // districtsModel = temp;
    });
  }

  ListView selectDistrictWidget(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: false,
      padding: EdgeInsets.only(bottom: 10),
      children: [
        Container(
            width: Get.width,
            child: Text("Select District",
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    color: UIColors.blackColor),
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
              "Select District",
              style: TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(2),
                  color: Colors.grey.withOpacity(.8)),
            ), // Not necessary for Option 1
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
            ),
            validator: (value) =>
                value == null ? "Please select division" : null,
            isExpanded: true,
            value: _selectedDistrict,
            onChanged: (newValue) {
              setState(() {
                _selectedDistrict = newValue;
              });
              log(_selectedDistrict.toString());
              getAreaList();
            },
            items: districtsList.map((DistrictList value) {
              return DropdownMenuItem(
                child: new Text(value.name),
                value: value.id,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  int _selectedArea;
  List<AreaList> areaList = [];
  getAreaList() async {
    areaList.clear();
    var temp = await GetAreaService()
        .fetchGetArea(districtId: _selectedDistrict)
        .then((value) {
      if (value.areaList.length != 0) {
        setState(() {
          areaList.addAll(value.areaList);
        });
      }
    });
    setState(() {});
    // log(temp.toString());
    // if (temp.areaList.length != 0) {
    //   // areaList.addAll(temp.areaList);
    //   log(temp.areaList.toString());
    // }
    // setState(() {});
  }

  ListView selectAreaWidget(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: false,
      padding: EdgeInsets.only(bottom: 10),
      children: [
        Container(
            width: Get.width,
            child: Text("Select Area",
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    color: UIColors.blackColor),
                textAlign: TextAlign.left)),
        SizedBox(
          height: 5,
        ),
        Container(
          width: Get.width,
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          decoration: CustomDecoration().textFieldDecoration(),
          child: DropdownSearch<dynamic>(
            dropdownSearchDecoration: InputDecoration(
              enabledBorder: InputBorder.none,
            ),
            // items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
            items: areaList.map((AreaList value) {
              return value.name;
            }).toList(),
            onChanged: (value) {
              for (var i = 0; i < areaList.length; i++) {
                if (areaList[i].name == value) {
                  log(areaList[i].toJson().toString());
                  _selectedDeliveryArea = areaList[i].id;

                  break;
                }
              }
              log(_selectedDeliveryArea.toString());
              // setState(() {
              //   _selectedDeliveryArea = 0;
              // });
            },

            selectedItem: deliveryAreaString,
            showSearchBox: true,
          ),
          // DropdownButtonFormField(
          //   hint: Text(
          //     "Select Area",
          //     style: TextStyle(
          //         fontSize: ResponsiveFlutter.of(context).fontSize(2),
          //         color: Colors.grey.withOpacity(.8)),
          //   ), // Not necessary for Option 1
          //   decoration: InputDecoration(
          //     enabledBorder: InputBorder.none,
          //   ),
          //   validator: (value) => value == null ? "Please select Area" : null,
          //   isExpanded: true,
          //   value: _selectedArea,
          //   onChanged: (newValue) async {
          //     setState(() {
          //       _selectedArea = newValue;
          //     });
          //     await getUnionsList();
          //   },
          //   items: areaList.map((AreaList value) {
          //     return DropdownMenuItem(
          //       child: new Text(value.name),
          //       value: value.id,
          //     );
          //   }).toList(),
          // ),
        ),
      ],
    );
  }

  bool showSelectunionWidget = false;
  int _selectedUnion;
  List<UnionList> unionsList = [];
  getUnionsList() async {
    UnionsModel temp = await UnionsService().fetchUnions(areaid: _selectedArea);
    if (temp != null) {
      setState(() {
        showSelectunionWidget = true;
        unionsList = temp.unionList;
      });
    } else {
      setState(() {
        showSelectunionWidget = false;
      });
    }
  }

  Widget selectUnionWidget(BuildContext context) {
    return showSelectunionWidget == false
        ? Container()
        : ListView(
            shrinkWrap: true,
            primary: false,
            padding: EdgeInsets.only(bottom: 10),
            children: [
              Container(
                  width: Get.width,
                  child: Text("Select Union",
                      style: TextStyle(
                          fontSize: ResponsiveFlutter.of(context).fontSize(2),
                          color: UIColors.blackColor),
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
                    "Select Union",
                    style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(2),
                        color: Colors.grey.withOpacity(.8)),
                  ), // Not necessary for Option 1
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                  ),
                  validator: (value) =>
                      value == null ? "Please select Area" : null,
                  isExpanded: true,
                  value: _selectedUnion,
                  onChanged: (newValue) async {
                    setState(() {
                      _selectedUnion = newValue;
                    });
                    await setDistrictsList();
                  },
                  items: unionsList.map((value) {
                    return DropdownMenuItem(
                      child: new Text(value.zonename),
                      value: value.id,
                    );
                  }).toList(),
                ),
              ),
            ],
          );
  }

  int deliveryCharge = 0;
  int total = 0;

  // generateParcelCharge() {
  //   if (selectedService != null) {
  //     int extraCharge = 0;
  //     if (parcelWeight > 1) {
  //       extraCharge = (parcelWeight - 1) * selectedService.extradeliverycharge;
  //     } else {
  //       extraCharge = 0;
  //     }
  //     setState(() {
  //       deliveryCharge = selectedService.deliverycharge + extraCharge;
  //       total = cashCollection - (deliveryCharge + codCharge.codcharge);
  //     });
  //   }
  // }
  int codChargeForTotal = 0;
  generateFasterLogisticsCharge() {
    if (selectedPackage != null) {
      double value = (selectedPackage.cod / 100) * cashCollection;
      codChargeForTotal = value.round();
      setState(() {
        deliveryCharge = selectedPackage.deliverycharge;
        total = cashCollection - deliveryCharge - codChargeForTotal;
      });
    }
  }

  deliveryChargeDetails() {
    return Container(
      width: Get.width,
      color: Colors.grey[300],
      child: Column(
        children: [
          Container(
            width: Get.width,
            padding: EdgeInsets.fromLTRB(10, 15, 10, 5),
            child: Text(
              "Delivery Charge Details",
              style: TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(2.8)),
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            thickness: 3,
            color: UIColors.primaryColor,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cash Collection",
                      style: TextStyle(
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.2)),
                    ),
                    Text(
                      "$cashCollection Tk",
                      style: TextStyle(
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.2)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery Charge",
                      style: TextStyle(
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.2)),
                    ),
                    Text(
                      "$deliveryCharge Tk",
                      style: TextStyle(
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.2)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "COD Charge",
                      style: TextStyle(
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.2)),
                    ),
                    Text(
                      // codCharge != null ? "${codCharge.codcharge} Tk" : "0 Tk",
                      "$codChargeForTotal Tk",

                      style: TextStyle(
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.2)),
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2,
            color: UIColors.blackColor,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Payable Amount",
                  style: TextStyle(
                      fontSize: ResponsiveFlutter.of(context).fontSize(2.2)),
                ),
                Text(
                  "$total Tk",
                  style: TextStyle(
                      fontSize: ResponsiveFlutter.of(context).fontSize(2.2)),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: Get.width,
            padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
            child: Text(
              "Note : If you pick up a request after 7pm, It will be received the next day",
              style: TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(2)),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
