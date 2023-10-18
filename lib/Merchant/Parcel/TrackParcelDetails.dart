// ignore_for_file: file_names, library_prefixes

/*
Author: QuickTech IT
Author URI: http://quicktech-ltd.com;
Description: QuickTech IT maintain standard quality for Website and Creative Design
*/

import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Merchant/Parcel/models/ParcelDetailModel_for_track.dart'
    as parcelData;
import 'package:courier/Merchant/Parcel/services/track_parcel_service.dart';
import 'package:courier/Models/ParcelTrackModel.dart' as oldParcelTrackModel;
import 'package:courier/Network/MerchantNetwork.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:courier/Merchant/Parcel/model/track_parcel_model.dart'
    as trackModel;

// ignore: camel_case_types
class QuickTechIT_TrackParcelDetails extends StatefulWidget {
  const QuickTechIT_TrackParcelDetails({Key key}) : super(key: key);

  @override
  _QuickTechIT_TrackParcelDetailsState createState() =>
      _QuickTechIT_TrackParcelDetailsState();
}

// ignore: camel_case_types
class _QuickTechIT_TrackParcelDetailsState
    extends State<QuickTechIT_TrackParcelDetails> {
  String trackId = Get.parameters['trackId'];

  oldParcelTrackModel.ParcelTrackModel trackRecords;

  parcelData.Data parcel;

  @override
  void initState() {
    String trackid = trackId;
    MerchantNetwork().getParcelNotes(trackid).then((value) {
      if (mounted) {
        setState(() {
          trackRecords = value;

          parcel = trackRecords.data as parcelData.Data;
        });

        // if (trackRecords.data != null && trackRecords.data.length > 0) {
        //   MerchantNetwork()
        //       .getParcelDetails(trackRecords.data[0].parcelId.toString())
        //       .then((value) {
        //     if (mounted)
        //       setState(() {
        //         parcel = value;
        //       });
        //   });
        // }
      }
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
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        elevation: 0,
        backgroundColor: UIColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Track Parcel",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: UIColors.pageBackground,
      //endDrawer: NavigationDrawer(),
      body: trackRecords == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : trackRecords.success == false
              ? Center(
                  child: Text(
                    trackRecords.message,
                    style: TextStyle(
                      fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    ),
                  ),
                )
              : parcel == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          trackRecords.data == null
                              ? Center(
                                  child: Text(
                                    "Tracking Record Not Found",
                                    style: TextStyle(
                                      fontSize: ResponsiveFlutter.of(context)
                                          .fontSize(2),
                                    ),
                                  ),
                                )
                              : FutureBuilder<trackModel.ParcelTrackModel>(
                                  // future: TrackParcelService().getData(trackId),
                                  builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return CircularProgressIndicator();
                                  }
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount: snapshot.data.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return trackItem(
                                          snapshot.data.data[index]);
                                    },
                                  );
                                }),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
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
                            const SizedBox(
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
                            const SizedBox(
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
                            const SizedBox(
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
                            const SizedBox(
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
                            const SizedBox(
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
                            const SizedBox(
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
                            const SizedBox(
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
                            const SizedBox(
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
                            const SizedBox(
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
                            const SizedBox(
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
                            const SizedBox(
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
                            const SizedBox(
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
                            const SizedBox(
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
                            const SizedBox(
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
                            const SizedBox(
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
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Sub Total ",
                            style: TextStyle(
                                fontSize:
                                    ResponsiveFlutter.of(context).fontSize(2),
                                color: Colors.grey[600]),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            "${(parcel.cod == null ? 0 : int.parse(parcel.cod.toString())) - (parcel.deliveryCharge == null ? 0 : int.parse(parcel.deliveryCharge.toString()))}",
                            style: TextStyle(
                                fontSize: ResponsiveFlutter.of(context)
                                    .fontSize(2.5)),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          if (parcel.updatedAt != null)
                            Text(
                              "Last Update and Time",
                              style: TextStyle(
                                  fontSize:
                                      ResponsiveFlutter.of(context).fontSize(2),
                                  color: Colors.grey[600]),
                              textAlign: TextAlign.justify,
                            ),
                          if (parcel.updatedAt != null)
                            const SizedBox(
                              height: 2,
                            ),
                          if (parcel.updatedAt != null)
                            Text(
                              DateFormat.yMMMd()
                                  .add_Hms()
                                  .format(DateTime.parse(parcel.updatedAt)),
                              style: TextStyle(
                                  fontSize: ResponsiveFlutter.of(context)
                                      .fontSize(2.5)),
                              textAlign: TextAlign.justify,
                            ),
                          if (parcel.updatedAt != null)
                            const SizedBox(
                              height: 10,
                            ),
                          Text(
                            "Note",
                            style: TextStyle(
                                fontSize:
                                    ResponsiveFlutter.of(context).fontSize(2),
                                color: Colors.grey[600]),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            parcel.note,
                            style: TextStyle(
                                fontSize: ResponsiveFlutter.of(context)
                                    .fontSize(2.5)),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      )),
    );
  }

  Widget trackItem(trackModel.Datum item) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormat.jm().format(DateTime.parse(item.createdAt.toString())),
              style: TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(2.3)),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              DateFormat.yMMMd()
                  .format(DateTime.parse(item.createdAt.toString())),
              style: TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(2)),
            ),
          ],
        ),
        const SizedBox(
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
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: UIColors.primaryColor),
              child: const Icon(
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
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: SizedBox(
            width: Get.width,
            child: Text(
              item.note ?? "",
              style: TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(2.2)),
            ),
          ),
        ),
      ],
    );
  }
}
