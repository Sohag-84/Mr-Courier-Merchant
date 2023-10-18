/*
Author: QuickTech IT
Author URI: http://quicktech-ltd.com;
Description: QuickTech IT maintain standard quality for Website and Creative Design
*/

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Merchant/Parcel/track_parcel_notes_view.dart';
import 'package:courier/Merchant/Utils/MerchantBottomBar.dart';
import 'package:courier/Merchant/Utils/NavigationDrawer.dart';
import 'package:courier/Models/ParcelDetailModel.dart';
import 'package:courier/Network/MerchantNetwork.dart';
// import 'package:ext_storage/ext_storage.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_filex/open_filex.dart';
// import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:printing/printing.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

// ignore: camel_case_types
class QuickTechIT_ParcelDetails extends StatefulWidget {
  @override
  _QuickTechIT_ParcelDetailsState createState() =>
      _QuickTechIT_ParcelDetailsState();
}

// ignore: camel_case_types
class _QuickTechIT_ParcelDetailsState extends State<QuickTechIT_ParcelDetails> {
  String parcelId = Get.parameters['id'];

  ParcelDetailModel parcel;

  void initState() {
    getData();
    Timer.periodic(Duration(seconds: 5), (_) => getData());

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getData() {
    MerchantNetwork().getParcelDetails(parcelId).then((value) {
      if (mounted)
        setState(() {
          parcel = value;
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
              "Parcel Detail",
              style: TextStyle(color: Colors.white),
            )),
        backgroundColor: UIColors.pageBackground,
        endDrawer: NavigationDrawer(),
        bottomNavigationBar: MerchantBottomBar(),
        body: parcel == null
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (parcel.trackingCode != null)
                      Text(
                        "Tracking Id",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
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
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2.5)),
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
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
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
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2.5)),
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
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
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
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2.5)),
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
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
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
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2.5)),
                        textAlign: TextAlign.justify,
                      ),
                    if (parcel.recipientPhone != null)
                      SizedBox(
                        height: 10,
                      ),
                    // if (parcel.zonename != null)
                    //   Text(
                    //     "Area ",
                    //     style: TextStyle(
                    //         fontSize: ResponsiveFlutter.of(context).fontSize(2),
                    //         color: Colors.grey[600]),
                    //     textAlign: TextAlign.justify,
                    //   ),
                    // if (parcel.zonename != null)
                    //   SizedBox(
                    //     height: 2,
                    //   ),
                    // if (parcel.zonename != null)
                    //   Text(
                    //     parcel.zonename,
                    //     style: TextStyle(
                    //         fontSize:
                    //             ResponsiveFlutter.of(context).fontSize(2.5)),
                    //     textAlign: TextAlign.justify,
                    //   ),
                    // if (parcel.zonename != null)
                    //   SizedBox(
                    //     height: 10,
                    //   ),
                    if (parcel.productWeight != null)
                      Text(
                        "Weight ",
                        style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
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
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2.5)),
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
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
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
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2.5)),
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
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
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
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2.5)),
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
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
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
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2.5)),
                        textAlign: TextAlign.justify,
                      ),
                    if (parcel.cod != null)
                      SizedBox(
                        height: 10,
                      ),
                    if (parcel.status == 0)
                      Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: UIColors.primaryColor,
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: TextButton(
                          onPressed: () async {
                            var status = Permission.storage;
                            if (await status.isGranted) {
                              generateParcelInvoice();
                            } else {
                              if (await status.request().isGranted) {
                                generateParcelInvoice();
                              }
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                UIColors.primaryColor),
                          ),
                          child: Text(
                            "Invoice",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ResponsiveFlutter.of(context)
                                    .fontSize(2.2)),
                          ),
                        ),
                      ),
                    if (parcel.status == 0)
                      SizedBox(
                        height: 10,
                      ),
                    parcel.status == 1
                        ? Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: UIColors.primaryColor,
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Get.toNamed(
                                    '/merchant/parcel/edit/${parcel.trackingCode}');
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    UIColors.primaryColor),
                              ),
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(2.2)),
                              ),
                            ),
                          )
                        : Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: UIColors.primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextButton(
                              onPressed: () {
                                print(parcel.trackingCode);
                                // Get.toNamed(
                                //     '/merchant/parcel/track/${parcel.trackingCode}');
                                Get.to(()=>TrackParcelDetailsView(
                                  trackParcelId: parcel.trackingCode,
                                ));
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  UIColors.primaryColor,
                                ),
                              ),
                              child: Text(
                                "Track Parcel",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(2.2)),
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              ));
  }

  void generateParcelInvoice() async {
    final pw.Document pdf = pw.Document();

    const imageProvider = const AssetImage('assets/images/logo.png');

    final image = await flutterImageProvider(imageProvider);

    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Container(
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text("Parcel Invoice"),
                        pw.Text("Invoice- ${parcel.invoiceNo}"),
                      ]),
                  pw.Divider(color: PdfColors.grey),
                  pw.SizedBox(height: 20),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Image(image, width: 120),
                        pw.BarcodeWidget(
                            barcode: pw.Barcode.qrCode(),
                            data:
                                "${MerchantNetwork().rootUrl}track/parcel/${parcel.trackingCode}",
                            width: 70,
                            height: 70),
                      ]),
                  pw.SizedBox(height: 20),
                  pw.Container(
                      width: double.infinity,
                      padding: pw.EdgeInsets.all(10),
                      decoration: pw.BoxDecoration(
                          border: pw.Border.all(color: PdfColors.grey)),
                      child: pw.Text(
                          DateFormat.yMMMd()
                              .format(DateTime.parse(parcel.createdAt)),
                          style: pw.TextStyle(fontSize: 18),
                          textAlign: pw.TextAlign.center)),
                  pw.SizedBox(height: 20),
                  pw.Text("MERCHANT : ${parcel.firstName}",
                      style: pw.TextStyle(fontSize: 15)),
                  pw.Text("0" + parcel.phoneNumber.toString(),
                      style: pw.TextStyle(fontSize: 15)),
                  pw.SizedBox(height: 20),
                  pw.Text("CUSTOMER : ${parcel.recipientName}",
                      style: pw.TextStyle(fontSize: 15)),
                  pw.Text("0" + parcel.recipientPhone.toString(),
                      style: pw.TextStyle(fontSize: 15)),
                  pw.SizedBox(height: 20),
                  pw.Text("ADDRESS : ${parcel.recipientAddress}",
                      style: pw.TextStyle(fontSize: 15)),
                  pw.SizedBox(height: 20),
                  pw.Text("INSTRUCTION", style: pw.TextStyle(fontSize: 15)),
                  pw.SizedBox(height: 10),
                  pw.Container(
                    width: double.infinity,
                    padding: pw.EdgeInsets.all(10),
                    decoration: pw.BoxDecoration(
                        border: pw.Border.all(color: PdfColors.black)),
                    child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text("COD",
                                style: pw.TextStyle(fontSize: 15),
                                textAlign: pw.TextAlign.center),
                          ),
                          pw.Container(
                            width: 2,
                            height: 30,
                            color: PdfColors.black,
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Text("TK ${parcel.cod}",
                                style: pw.TextStyle(fontSize: 15),
                                textAlign: pw.TextAlign.center),
                          ),
                        ]),
                  ),
                  pw.SizedBox(height: 20),
                  pw.Row(children: [
                    pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                            child: pw.Row(children: [
                          pw.Container(
                            decoration: pw.BoxDecoration(
                                border: pw.Border.all(color: PdfColors.grey)),
                            height: 10,
                            width: 10,
                          ),
                          pw.SizedBox(width: 20),
                          pw.Text("DELIVERY"),
                        ]))),
                    pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                            child: pw.Row(children: [
                          pw.Container(
                            decoration: pw.BoxDecoration(
                                border: pw.Border.all(color: PdfColors.grey)),
                            height: 10,
                            width: 10,
                          ),
                          pw.SizedBox(width: 20),
                          pw.Text("CANCELLED"),
                        ]))),
                    pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                            child: pw.Row(children: [
                          pw.Container(
                            decoration: pw.BoxDecoration(
                                border: pw.Border.all(color: PdfColors.grey)),
                            height: 10,
                            width: 10,
                          ),
                          pw.SizedBox(width: 20),
                          pw.Text("HOLD"),
                        ])))
                  ]),
                  pw.SizedBox(height: 20),
                  pw.Divider(color: PdfColors.black),
                  pw.SizedBox(height: 20),
                  pw.Container(
                      width: double.infinity,
                      child: pw.Text(
                          "NOTE: IF LOST, PLEASE RETURN TO ADDRESS- 536, Shameem Sharani, West Shewrapara 1216 Dhaka, Dhaka Division, Bangladesh\nPHONE: 01303-355623 EMAIL: info@sparkdelivery.com.bd"
                              .toUpperCase(),
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(fontSize: 15)))
                ]))
          ]; // Center
        }));

    // String path = await ExtStorage.getExternalStoragePublicDirectory(
    //     ExtStorage.DIRECTORY_DOWNLOADS);
    String newPath = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);
    String fullPath = newPath + "/Parcel_Invoice_${parcel.id}.pdf";
    final File file = File(fullPath);

    if (file.existsSync()) {
      Get.snackbar("Already Download", "Invoice already downloaded",
          snackPosition: SnackPosition.TOP,
          backgroundColor: UIColors.primaryColor2,
          colorText: Colors.white,
          duration: Duration(seconds: 10),
          mainButton: TextButton(
            child: Text(
              "Open",
              style: TextStyle(color: UIColors.primaryColor),
            ),
            onPressed: () {
              OpenFilex.open(fullPath);
            },
          ));
    } else {
      try {
        await file.writeAsBytes(await pdf.save());

        Get.snackbar("Download Complete", "Invoice saved into downloads folder",
            snackPosition: SnackPosition.TOP,
            backgroundColor: UIColors.primaryColor2,
            colorText: Colors.white,
            duration: Duration(seconds: 10),
            mainButton: TextButton(
              child: Text(
                "Open",
                style: TextStyle(color: UIColors.primaryColor),
              ),
              onPressed: () {
                OpenFilex.open(fullPath);
              },
            ));
      } catch (e) {
        Get.snackbar("Download Failed", "Something went wrong",
            snackPosition: SnackPosition.TOP,
            backgroundColor: UIColors.primaryColor2,
            colorText: Colors.white,
            duration: Duration(seconds: 10));
      }
    }
  }
}
