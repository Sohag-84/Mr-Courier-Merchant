/*
Author: QuickTech IT
Author URI: http://quicktech-ltd.com;
Description: QuickTech IT maintain standard quality for Website and Creative Design
*/

import 'dart:async';

import 'package:courier/GlobalUtils/Decoration.dart';
import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Merchant/Utils/MerchantBottomBar.dart';
import 'package:courier/Merchant/Utils/NavigationDrawer.dart';
import 'package:courier/Models/MerchantDashboardModel.dart';
import 'package:courier/Network/MerchantNetwork.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

// ignore: camel_case_types
class QuickTechIT_Dashboard extends StatefulWidget {
  @override
  _QuickTechIT_DashboardState createState() => _QuickTechIT_DashboardState();
}

// ignore: camel_case_types
class _QuickTechIT_DashboardState extends State<QuickTechIT_Dashboard> {
  MerchantDashboardModel dashboardModel;

  void initState() {
    getData();

    Timer.periodic(Duration(seconds: 5), (_) => getData());

    super.initState();
  }

  getData() {
    MerchantNetwork().getMerchantDashboardData().then((value) {
      if (mounted) {
        setState(() {
          dashboardModel = value;
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: AppBar(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(20),
        //   ),
        // ),
        elevation: 0,
        backgroundColor: UIColors.primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false,
        title: Text(GetStorage().read('userName')),
      ),
      backgroundColor: UIColors.pageBackground,
      endDrawer: NavigationDrawer(),
      bottomNavigationBar: MerchantBottomBar(),
      body: Container(
        // decoration: BoxDecoration(image: CustomDecoration().watermark()),
        child: dashboardModel == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(5, 20, 5, 10),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        width: Get.width,
                        child: Text(
                          "Parcel Overall Status",
                          style: TextStyle(
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(2.5),
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        primary: false,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        crossAxisCount: 2,
                        childAspectRatio: 1.5,
                        children: <Widget>[
                          singleReports(
                              "Total Parcel", dashboardModel.placeParcel, 0),
                          singleReports(
                            "Total Pending",
                            dashboardModel.pendingParcel,
                            1,
                          ),
                          singleReports(
                            "Total Delivered",
                            dashboardModel.deliveredParcel,
                            2,
                          ),
                          singleReports(
                            "Total Cancelled",
                            dashboardModel.cancelParcel,
                            3,
                          ),
                          singleReports(
                            "Returned To Merchant",
                            dashboardModel.parcelReturn,
                            4,
                          ),
                          singleReports(
                            "Total Hold",
                            dashboardModel.totalHold,
                            5,
                          ),
                          singleReports(
                            "Collected Amount From DA",
                            dashboardModel.collectAmount,
                            6,
                          ),
                          singleReports(
                            "Total Paid",
                            dashboardModel.totalPaid,
                            7,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: Get.width,
                        child: Text(
                          "Payment Overall Status",
                          style: TextStyle(
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(2.5),
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        primary: false,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        crossAxisCount: 2,
                        childAspectRatio: 1.5,
                        children: <Widget>[
                          singleReports2(
                            "Total Amount",
                            dashboardModel.totalAmount,
                            6,
                          ),
                          singleReports2(
                            "Paid Amount",
                            dashboardModel.merchantPaid,
                            2,
                          ),
                          singleReports2(
                            "Unpaid Amount",
                            dashboardModel.merchantUnpaid,
                            3,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  List<Color> colors = [
    Colors.blue,
    Colors.blueGrey,
    Colors.green,
    Colors.red,
    Colors.orange,
    Colors.lightBlue,
    Colors.blueAccent,
    Colors.green,
  ];

  singleReports(String title, int value, int index) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: colors[index],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: colors[index].withOpacity(.5),
            blurRadius: 4,
            offset: Offset(4, 4), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title == null ? "" : title,
            style: TextStyle(
                color: Colors.white,
                fontSize: ResponsiveFlutter.of(context).fontSize(2.2)),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            value == null ? "" : value.toString(),
            style: TextStyle(
                color: Colors.white,
                fontSize: ResponsiveFlutter.of(context).fontSize(3.5)),
          )
        ],
      ),
    );
  }

  singleReports2(String title, int value, int index) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: colors[index],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: colors[index].withOpacity(.5),
            blurRadius: 4,
            offset: Offset(4, 4), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title == null ? "" : title,
            style: TextStyle(
                color: Colors.white,
                fontSize: ResponsiveFlutter.of(context).fontSize(2)),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            value == null ? "" : value.toString(),
            style: TextStyle(
                color: Colors.white,
                fontSize: ResponsiveFlutter.of(context).fontSize(3.5)),
          )
        ],
      ),
    );
  }
}
