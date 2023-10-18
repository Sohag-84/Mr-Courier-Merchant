import 'dart:developer';

import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Merchant/Parcel/model/track_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

import 'services/track_parcel_service.dart';

class TrackParcelDetailsView extends StatefulWidget {
  const TrackParcelDetailsView({Key key, this.trackParcelId}) : super(key: key);

  final String trackParcelId;

  @override
  State<TrackParcelDetailsView> createState() => _TrackParcelDetailsViewState();
}

class _TrackParcelDetailsViewState extends State<TrackParcelDetailsView> {
  @override
  void initState() {
    super.initState();
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
      //
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: FutureBuilder<TrackModel>(
            future: TrackParcelService().getData(widget.trackParcelId),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Column(
                  children: [
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                    ),
                    CircularProgressIndicator(),
                  ],
                );
              }
              if (snapshot.data.success == false) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                    ),
                    Text("Parcel notes are not available"),
                  ],
                );
              }
              if (snapshot.data.trackInfos.length == 0) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                    ),
                    Text("Parcel notes are not available"),
                  ],
                );
              }
              Parcel parcel = snapshot.data.parcel;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    //itemCount: 1,
                    itemCount: snapshot.data.trackInfos.length,
                    itemBuilder: (BuildContext context, int index) {
                      //return Text("data");
                      return trackItem(snapshot.data.trackInfos[index]);
                    },
                  ),
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
                          fontSize: ResponsiveFlutter.of(context).fontSize(2),
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
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.5)),
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
                          fontSize: ResponsiveFlutter.of(context).fontSize(2),
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
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.5)),
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
                          fontSize: ResponsiveFlutter.of(context).fontSize(2),
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
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.5)),
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
                          fontSize: ResponsiveFlutter.of(context).fontSize(2),
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
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.5)),
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
                          fontSize: ResponsiveFlutter.of(context).fontSize(2),
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
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.5)),
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
                          fontSize: ResponsiveFlutter.of(context).fontSize(2),
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
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.5)),
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
                          fontSize: ResponsiveFlutter.of(context).fontSize(2),
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
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.5)),
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
                          fontSize: ResponsiveFlutter.of(context).fontSize(2),
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
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.5)),
                      textAlign: TextAlign.justify,
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Sub Total ",
                    style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(2),
                        color: Colors.grey[600]),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "${(parcel.cod == null ? 0 : int.parse(parcel.cod.toString())) - (parcel.deliveryCharge == null ? 0 : int.parse(parcel.deliveryCharge.toString()))}",
                    style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(2.5)),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (parcel.updatedAt != null)
                    Text(
                      "Last Update and Time",
                      style: TextStyle(
                          fontSize: ResponsiveFlutter.of(context).fontSize(2),
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
                          .format(DateTime.parse(parcel.updatedAt.toString())),
                      style: TextStyle(
                          fontSize:
                              ResponsiveFlutter.of(context).fontSize(2.5)),
                      textAlign: TextAlign.justify,
                    ),
                  if (parcel.updatedAt != null)
                    const SizedBox(
                      height: 10,
                    ),
                  Text(
                    "Note",
                    style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(2),
                        color: Colors.grey[600]),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "${parcel.note}",
                    style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(2.5)),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (parcel.deliverymanName != null)
                    const SizedBox(
                      height: 10,
                    ),
                  Text(
                    "Deliveryman",
                    style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(2),
                        color: Colors.grey[600]),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  if (parcel.deliverymanName != null)
                    const SizedBox(
                      height: 10,
                    ),
                  Text(
                    parcel.deliverymanName ?? "Not assigned",
                    style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(2.5)),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Deliveryman Phone",
                    style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(2),
                        color: Colors.grey[600]),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    parcel.deliverymanPhone ?? "Not assigned",
                    style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(2.5)),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget trackItem(TrackInfo item) {
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
