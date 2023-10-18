/*
Author: QuickTech IT
Author URI: http://quicktech-ltd.com;
Description: QuickTech IT maintain standard quality for Website and Creative Design
*/

import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Merchant/Utils/MerchantBottomBar.dart';
import 'package:courier/Merchant/Utils/NavigationDrawer.dart';
import 'package:courier/Models/DeliverymanModel.dart';
import 'package:courier/Models/PickupModel.dart';
import 'package:courier/Network/MerchantNetwork.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

// ignore: camel_case_types
class QuickTechIT_Pickups extends StatefulWidget {
  @override
  _QuickTechIT_PickupsState createState() => _QuickTechIT_PickupsState();
}

// ignore: camel_case_types
class _QuickTechIT_PickupsState extends State<QuickTechIT_Pickups> {
  List<PickupModel> pickups = [];
  List<DeliverymanModel> deliverymens = [];

  int startFrom = 0;

  bool isData = true;
  bool isLoading = false;

  void initState() {
    getData();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future<bool> getData() async {
    if (!isLoading) {
      if (isData) {
        setState(() {
          isLoading = true;
        });
        MerchantNetwork().getPickups(startFrom).then((value) {
          if (value.length < 20) {
            isData = false;
          }
          for (int i = 0; i < value.length; i++) {
            setState(() {
              pickups.add(value[i]);
            });
            if (value[i].deliveryman != null) {
              MerchantNetwork()
                  .getDeliveryMen(value[i].deliveryman)
                  .then((value) {
                setState(() {
                  deliverymens.add(value);
                });
              });
            }
          }
          setState(() {
            isLoading = false;
          });
        });
      }
    }
    return true;
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
              "Pickups",
              style: TextStyle(color: Colors.white),
            )),
        backgroundColor: UIColors.pageBackground,
        endDrawer: NavigationDrawer(),
        bottomNavigationBar: MerchantBottomBar(),
        body: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.maxScrollExtent ==
                scrollInfo.metrics.pixels) {
              getData();
            }
            return true;
          },
          child: pickups.length == 0 && isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : pickups.length == 0
                  ? Center(
                      child: Text("No Pickups Available"),
                    )
                  : RefreshIndicator(
                      onRefresh: () {
                        setState(() {
                          pickups.clear();
                          deliverymens.clear();
                          startFrom = 0;
                          isData = true;
                        });
                        return getData();
                      },
                      child: SingleChildScrollView(
                          padding: EdgeInsets.all(10),
                          physics: AlwaysScrollableScrollPhysics(),
                          child: Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: pickups.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return parcelItem(index);
                                },
                              ),
                              if (isLoading)
                                Center(
                                  child: CircularProgressIndicator(),
                                )
                            ],
                          )),
                    ),
        ));
  }

  Widget parcelItem(int index) {
    int deliverymenIndex;
    for (int i = 0; i < deliverymens.length; i++) {
      if (deliverymens[i].id == pickups[index].deliveryman) {
        deliverymenIndex = i;
        break;
      }
    }
    return InkWell(
      onTap: () {
        Get.defaultDialog(
            title: "Pickup Details",
            content: Container(
              child: Column(
                children: [
                  Container(
                    width: Get.width,
                    child: Text(
                      "Pickup Address",
                      style: TextStyle(
                          fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                          color: Colors.grey[600]),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    width: Get.width,
                    child: Text(
                      pickups[index].pickupAddress,
                      style: TextStyle(
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.2)),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: Get.width,
                    child: Text(
                      "Pickup Type",
                      style: TextStyle(
                          fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                          color: Colors.grey[600]),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    width: Get.width,
                    child: Text(
                      pickups[index].pickuptype == 1
                          ? "Next Day Delivery"
                          : pickups[index].pickuptype == 2
                              ? "Same Day Delivery"
                              : "Not Assign",
                      style: TextStyle(
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.2)),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (pickups[index].note != null)
                    Container(
                      width: Get.width,
                      child: Text(
                        "Note",
                        style: TextStyle(
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(1.8),
                            color: Colors.grey[600]),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  if (pickups[index].note != null)
                    SizedBox(
                      height: 2,
                    ),
                  if (pickups[index].note != null)
                    Container(
                      width: Get.width,
                      child: Text(
                        pickups[index].note,
                        style: TextStyle(
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2.2)),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  if (pickups[index].note != null)
                    SizedBox(
                      height: 10,
                    ),
                  if (pickups[index].estimedparcel != null)
                    Container(
                      width: Get.width,
                      child: Text(
                        "Estimated Parcel",
                        style: TextStyle(
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(1.8),
                            color: Colors.grey[600]),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  if (pickups[index].estimedparcel != null)
                    SizedBox(
                      height: 2,
                    ),
                  if (pickups[index].estimedparcel != null)
                    Container(
                      width: Get.width,
                      child: Text(
                        pickups[index].estimedparcel,
                        style: TextStyle(
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2.2)),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  if (pickups[index].estimedparcel != null)
                    SizedBox(
                      height: 10,
                    ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Close"))
            ]);
      },
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              blurRadius: 4,
              offset: Offset(4, 4), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            // Container(
            //   width: Get.width,
            //   child: Text(
            //       "Merchant"
            //   ),
            // ),
            // SizedBox(height: 5,),
            // Container(
            //   width: Get.width,
            //   child: Text(
            //       "Merchant Phone"
            //   ),
            // ),
            // SizedBox(height: 5,),
            Container(
              width: Get.width,
              child: Text(
                deliverymenIndex != null
                    ? deliverymens[deliverymenIndex].name
                    : "Not Assign",
                style: TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              width: Get.width,
              child: Text(
                pickups[index].pickupAddress,
                style: TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              width: Get.width,
              child: Text(
                pickups[index].status == 0
                    ? "Not Assigned"
                    : pickups[index].status == 1
                        ? "Pending"
                        : pickups[index].status == 2
                            ? "Accepted"
                            : pickups[index].status == 3
                                ? "Cancelled"
                                : "",
                style: TextStyle(fontSize: 16, color: UIColors.primaryColor),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //         "Area"
            //     ),
            //     Text(
            //         "Status"
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
