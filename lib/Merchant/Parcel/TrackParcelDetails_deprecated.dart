/*
Author: QuickTech IT
Author URI: http://quicktech-ltd.com;
Description: QuickTech IT maintain standard quality for Website and Creative Design
*/

import 'dart:developer';

import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Models/ParcelDetailModel.dart';
import 'package:courier/Models/ParcelTrackModel.dart';
import 'package:courier/Network/MerchantNetwork.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

// ignore: camel_case_types
class QuickTechIT_TrackParcelDetails extends StatefulWidget {
  @override
  _QuickTechIT_TrackParcelDetailsState createState() =>
      _QuickTechIT_TrackParcelDetailsState();
}

// ignore: camel_case_types
class _QuickTechIT_TrackParcelDetailsState
    extends State<QuickTechIT_TrackParcelDetails> {
  var trackId = Get.parameters['trackId'];

  ParcelTrackModel trackRecords;

  ParcelDetailModel parcel;

  void initState() {
    MerchantNetwork().getParcelNotes(trackId).then((value) {
      print(value);
      // if (mounted) {
      setState(() {
        trackRecords = value;
      });
      if (trackRecords.data != null) {
        MerchantNetwork()
            .getParcelDetails(trackRecords.data.trackingCode.toString())
            .then((value) {
          if (mounted)
            setState(() {
              parcel = value;
            });
        });
      }
      // MerchantNetwork()
      //     .getParcelDetails(trackRecords.data.id.toString())
      //     .then((value) {
      //   if (mounted)
      //     setState(() {
      //       parcel = value;
      //     });
      // });

      // }
    });
    // if (trackRecords.data != null) {
    //   log(trackRecords.data.id);
    //   log('!=null data');
    // } else {
    //   log('null data');
    // }
    // setState(() {});
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Track Parcel",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: UIColors.pageBackground,
      //endDrawer: NavigationDrawer(),
      body: trackRecords == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : trackRecords.success == false
              ? Center(
                  child: Text(trackRecords.message),
                )
              : parcel == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (parcel.trackingCode != null)
                            Text(
                              "Tracking Id",
                              style: TextStyle(
                                  fontSize:
                                      ResponsiveFlutter.of(context).fontSize(2),
                                  color: Colors.grey[600]),
                              textAlign: TextAlign.justify,
                            ),
                          if (parcel.trackingCode != null)
                            SizedBox(
                              height: 2,
                            ),
                          if (parcel.trackingCode != null)
                            Text(
                              parcel.trackingCode,
                              style: TextStyle(
                                  fontSize: ResponsiveFlutter.of(context)
                                      .fontSize(2.5)),
                              textAlign: TextAlign.justify,
                            ),
                          if (parcel.trackingCode != null)
                            SizedBox(
                              height: 10,
                            ),
                          if (parcel.recipientName != null)
                            Text(
                              "Customer Name",
                              style: TextStyle(
                                  fontSize:
                                      ResponsiveFlutter.of(context).fontSize(2),
                                  color: Colors.grey[600]),
                              textAlign: TextAlign.justify,
                            ),
                          if (parcel.recipientName != null)
                            SizedBox(
                              height: 2,
                            ),
                          if (parcel.recipientName != null)
                            Text(
                              parcel.recipientName,
                              style: TextStyle(
                                  fontSize: ResponsiveFlutter.of(context)
                                      .fontSize(2.5)),
                              textAlign: TextAlign.justify,
                            ),
                          if (parcel.recipientName != null)
                            SizedBox(
                              height: 10,
                            ),
                          if (parcel.recipientAddress != null)
                            Text(
                              "Customer Address",
                              style: TextStyle(
                                  fontSize:
                                      ResponsiveFlutter.of(context).fontSize(2),
                                  color: Colors.grey[600]),
                              textAlign: TextAlign.justify,
                            ),
                          if (parcel.recipientAddress != null)
                            SizedBox(
                              height: 2,
                            ),
                          if (parcel.recipientAddress != null)
                            Text(
                              parcel.recipientAddress,
                              style: TextStyle(
                                  fontSize: ResponsiveFlutter.of(context)
                                      .fontSize(2.5)),
                              textAlign: TextAlign.justify,
                            ),
                          if (parcel.recipientAddress != null)
                            SizedBox(
                              height: 10,
                            ),
                          if (parcel.recipientPhone != null)
                            Text(
                              "Customer Phone",
                              style: TextStyle(
                                  fontSize:
                                      ResponsiveFlutter.of(context).fontSize(2),
                                  color: Colors.grey[600]),
                              textAlign: TextAlign.justify,
                            ),
                          if (parcel.recipientPhone != null)
                            SizedBox(
                              height: 2,
                            ),
                          if (parcel.recipientPhone != null)
                            Text(
                              parcel.recipientPhone.toString(),
                              style: TextStyle(
                                  fontSize: ResponsiveFlutter.of(context)
                                      .fontSize(2.5)),
                              textAlign: TextAlign.justify,
                            ),
                          if (parcel.recipientPhone != null)
                            SizedBox(
                              height: 10,
                            ),
                          if (parcel.productWeight != null)
                            Text(
                              "Weight ",
                              style: TextStyle(
                                  fontSize:
                                      ResponsiveFlutter.of(context).fontSize(2),
                                  color: Colors.grey[600]),
                              textAlign: TextAlign.justify,
                            ),
                          if (parcel.productWeight != null)
                            SizedBox(
                              height: 2,
                            ),
                          if (parcel.productWeight != null)
                            Text(
                              parcel.productWeight.toString(),
                              style: TextStyle(
                                  fontSize: ResponsiveFlutter.of(context)
                                      .fontSize(2.5)),
                              textAlign: TextAlign.justify,
                            ),
                          if (parcel.productWeight != null)
                            SizedBox(
                              height: 10,
                            ),
                          if (parcel.productPrice != null)
                            Text(
                              "Price ",
                              style: TextStyle(
                                  fontSize:
                                      ResponsiveFlutter.of(context).fontSize(2),
                                  color: Colors.grey[600]),
                              textAlign: TextAlign.justify,
                            ),
                          if (parcel.productPrice != null)
                            SizedBox(
                              height: 2,
                            ),
                          if (parcel.productPrice != null)
                            Text(
                              parcel.productPrice.toString(),
                              style: TextStyle(
                                  fontSize: ResponsiveFlutter.of(context)
                                      .fontSize(2.5)),
                              textAlign: TextAlign.justify,
                            ),
                          if (parcel.productPrice != null)
                            SizedBox(
                              height: 10,
                            ),
                          if (parcel.deliveryCharge != null)
                            Text(
                              "Delivery Charge",
                              style: TextStyle(
                                  fontSize:
                                      ResponsiveFlutter.of(context).fontSize(2),
                                  color: Colors.grey[600]),
                              textAlign: TextAlign.justify,
                            ),
                          if (parcel.deliveryCharge != null)
                            SizedBox(
                              height: 2,
                            ),
                          if (parcel.deliveryCharge != null)
                            Text(
                              parcel.deliveryCharge.toString(),
                              style: TextStyle(
                                  fontSize: ResponsiveFlutter.of(context)
                                      .fontSize(2.5)),
                              textAlign: TextAlign.justify,
                            ),
                          if (parcel.deliveryCharge != null)
                            SizedBox(
                              height: 10,
                            ),
                          if (parcel.cod != null)
                            Text(
                              "COD",
                              style: TextStyle(
                                  fontSize:
                                      ResponsiveFlutter.of(context).fontSize(2),
                                  color: Colors.grey[600]),
                              textAlign: TextAlign.justify,
                            ),
                          if (parcel.cod != null)
                            SizedBox(
                              height: 2,
                            ),
                          if (parcel.cod != null)
                            Text(
                              parcel.cod.toString(),
                              style: TextStyle(
                                  fontSize: ResponsiveFlutter.of(context)
                                      .fontSize(2.5)),
                              textAlign: TextAlign.justify,
                            ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            thickness: 2,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          trackItem(trackRecords.data),
                          // ListView.builder(
                          //   shrinkWrap: true,
                          //   physics: NeverScrollableScrollPhysics(),
                          //   itemCount: trackRecords.data.length,
                          //   itemBuilder: (BuildContext context, int index) {
                          //     return trackItem(trackRecords.data[index]);
                          //   },
                          // ),
                        ],
                      )),
    );
  }

  Widget trackItem(Data item) {
    return Container(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat.jm().format(DateTime.parse(item.createdAt)),
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(2.3)),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                DateFormat.yMMMd().format(DateTime.parse(item.createdAt)),
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(2)),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Container(
                width: 3,
                height: 25,
                color: Colors.grey.withOpacity(.5),
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: UIColors.primaryColor),
                child: Icon(
                  Icons.check_circle_outline_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              Container(
                width: 3,
                height: 25,
                color: Colors.grey.withOpacity(.5),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: Get.width,
              child: Text(
                item.note,
                style: TextStyle(
                    fontSize: ResponsiveFlutter.of(context).fontSize(2.2)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
