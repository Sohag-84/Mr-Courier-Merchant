/*
Author: QuickTech IT
Author URI: http://quicktech-ltd.com;
Description: QuickTech IT maintain standard quality for Website and Creative Design
*/

import 'dart:io';
// import 'package:ext_storage/ext_storage.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Merchant/Utils/MerchantBottomBar.dart';
import 'package:courier/Merchant/Utils/NavigationDrawer.dart';
import 'package:courier/Models/PaymentModel.dart';
import 'package:courier/Network/MerchantNetwork.dart';
import 'package:intl/intl.dart';
import 'package:open_filex/open_filex.dart';
// import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:permission_handler/permission_handler.dart';

// ignore: camel_case_types
class QuickTechIT_Payments extends StatefulWidget {
  @override
  _QuickTechIT_PaymentsState createState() => _QuickTechIT_PaymentsState();
}

// ignore: camel_case_types
class _QuickTechIT_PaymentsState extends State<QuickTechIT_Payments> {
  List<PaymentModel> payments = [];
  List<String> amounts = [];
  List<List<Parcel>> allParcels = [];

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
        await MerchantNetwork().getPayments(startFrom).then((value) {
          if (value.length < 20) {
            isData = false;
          }
          for (int i = 0; i < value.length; i++) {
            MerchantNetwork().getParcelPayments(value[i].id).then((value2) {
              int amount = 0;
              List<Parcel> parcel = [];
              for (int j = 0; j < value2.length; j++) {
                int total = value2[j].cod;
                int charge = value2[j].codCharge + value2[j].deliveryCharge;
                parcel.add(Parcel(
                    value2[j].trackingCode.toString(),
                    value2[j].recipientName,
                    value2[j].recipientPhone.toString(),
                    total.toString(),
                    charge.toString(),
                    (total - charge).toString(),
                    value2[j].merchantAmount.toString()));
                amount += value2[j].merchantAmount;
              }
              setState(() {
                payments.add(value[i]);
                amounts.add(amount.toString());
                allParcels.add(parcel);
              });
            });
          }
        });
        setState(() {
          isLoading = false;
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
              "Payments",
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
          child: allParcels.length == 0 && isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : payments.length == 0
                  ? Center(
                      child: Text("No Payments Available"),
                    )
                  : RefreshIndicator(
                      onRefresh: () {
                        setState(() {
                          payments.clear();
                          amounts.clear();
                          allParcels.clear();
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
                                itemCount: amounts.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return paymentItem(index);
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

  paymentItem(int index) {
    return InkWell(
      onTap: () async {
        // var status = Permission.storage;
        // if (await status.isGranted) {
        //   reportView(Get.context, index);
        // } else {
        //   if (await status.request().isGranted) {
        //     reportView(Get.context, index);
        //   }
        // }
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
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bill Amount : ${amounts[index]} ৳",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    // Text(
                    //   "Date : ${payments[index].createdAt}",
                    //   style: TextStyle(
                    //     color: Colors.grey,
                    //   ),
                    // )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Billing id : ${payments[index].id}"),
                    Text(
                      "Date : ${payments[index].createdAt}",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  reportView(context, int index) async {
    final pw.Document pdf = pw.Document();

    final pref = GetStorage();

    const tableHeaders = [
      'Tracking ID',
      'Name',
      'Phone',
      'Total',
      'Charge',
      'Sub Total',
      'Payment'
    ];

    const imageProvider = const AssetImage('assets/images/logo.png');

    final image = await flutterImageProvider(imageProvider);

    final parcels = allParcels[index];

    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Container(
                child: pw.Column(children: [
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Image(image, width: 100),
                    pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.end,
                        children: [
                          pw.Text("Invoice #: ${payments[index].id}"),
                          pw.Text(
                              "Date: ${DateFormat.yMMMMd().format(DateTime.parse(payments[index].createdAt))}"),
                          pw.Text(
                              "Time: ${DateFormat.jms().format(DateTime.parse(payments[index].createdAt))}"),
                          pw.Text("Merchant Name: ${pref.read('userName')}"),
                          pw.Text(
                              "Merchant Phone: 0${pref.read('userPhone').toString()}")
                        ])
                  ]),
              pw.SizedBox(height: 20),
              pw.Table.fromTextArray(
                border: null,
                cellAlignment: pw.Alignment.centerLeft,
                headerDecoration: pw.BoxDecoration(
                  color: PdfColor.fromInt(0xfffce8e8),
                ),
                headerHeight: 20,
                cellAlignments: {
                  0: pw.Alignment.center,
                  1: pw.Alignment.center,
                  2: pw.Alignment.center,
                  3: pw.Alignment.center,
                  4: pw.Alignment.center,
                  5: pw.Alignment.centerRight,
                  6: pw.Alignment.centerRight,
                },
                headerStyle: pw.TextStyle(
                  color: PdfColor.fromHex("#000000"),
                  fontSize: 10,
                  // fontWeight: pw.FontWeight.bold,
                ),
                cellStyle: const pw.TextStyle(
                  fontSize: 10,
                ),
                rowDecoration: pw.BoxDecoration(
                  border: pw.Border(
                    bottom: pw.BorderSide(
                      color: PdfColor.fromHex("#899976"),
                      width: .5,
                    ),
                  ),
                ),
                headers: List<String>.generate(
                  tableHeaders.length,
                  (col) => tableHeaders[col],
                ),
                data: List<List<String>>.generate(
                  parcels.length,
                  (row) => List<String>.generate(
                    tableHeaders.length,
                    (col) => parcels[row].getIndex(col),
                  ),
                ),
              ),
              pw.SizedBox(height: 30),
              pw.Align(
                  alignment: pw.Alignment.bottomRight,
                  child: pw.Container(
                      width: 150,
                      child: pw.Column(children: [
                        pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text('Total : '),
                              pw.Text('${amounts[index]} /-',
                                  style: pw.TextStyle(fontSize: 15)),
                            ]),
                      ])))
            ]))
          ]; // Center
        }));

    // String path = await ExtStorage.getExternalStoragePublicDirectory(
    //     ExtStorage.DIRECTORY_DOWNLOADS);
    String newPath = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);
    String fullPath = newPath + "/Payment_Invoice_${payments[index].id}.pdf";
    final File file = File(fullPath);

    if (file.existsSync()) {
      await file.writeAsBytes(await pdf.save());

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

class Parcel {
  final String trackingId;
  final String name;
  final String phone;
  final String total;
  final String charge;
  final String subTotal;
  final String payment;

  const Parcel(this.trackingId, this.name, this.phone, this.total, this.charge,
      this.subTotal, this.payment);

  getIndex(int index) {
    switch (index) {
      case 0:
        return trackingId;
      case 1:
        return name;
      case 2:
        return phone;
      case 3:
        return total;
      case 4:
        return charge;
      case 5:
        return subTotal;
      case 6:
        return payment;
    }
    return '';
  }
}
