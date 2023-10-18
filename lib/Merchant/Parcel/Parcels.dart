/*
Author: QuickTech IT
Author URI: http://quicktech-ltd.com;
Description: QuickTech IT maintain standard quality for Website and Creative Design
*/

import 'dart:developer';

import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Merchant/Utils/MerchantBottomBar.dart';
import 'package:courier/Merchant/Utils/NavigationDrawer.dart';
import 'package:courier/Models/ParcelModel.dart';
import 'package:courier/Network/MerchantNetwork.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// ignore: camel_case_types
class QuickTechIT_Parcels extends StatefulWidget {
  @override
  _QuickTechIT_ParcelsState createState() => _QuickTechIT_ParcelsState();
}

// ignore: camel_case_types
class _QuickTechIT_ParcelsState extends State<QuickTechIT_Parcels> {
  List<ParcelModel> parcels = [];

  int startFrom = 0;

  bool isData = true;
  bool isLoading = false;
  bool showSearchWidgets = false;
  List<ParcelModel> searchedParcels = [];
  var searchTextController = TextEditingController();

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
        await MerchantNetwork().getParcels(startFrom).then((value) {
          if (value.length < 20) {
            isData = false;
          }
          setState(() {
            parcels = value;
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
              "Parcels",
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
          child: parcels.length == 0 && isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : parcels.length == 0
                  ? Center(
                      child: Text("No Parcel Available"),
                    )
                  : RefreshIndicator(
                      onRefresh: () {
                        setState(() {
                          parcels.clear();
                          startFrom = 0;
                          isData = true;
                        });
                        return getData();
                      },
                      child: SingleChildScrollView(
                          padding: EdgeInsets.all(5),
                          physics: AlwaysScrollableScrollPhysics(),
                          child: Column(
                            children: [
                              showSearchWidgets == false
                                  ? Row(
                                      children: [
                                        Spacer(),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey.shade300,
                                          ),
                                          child: TextButton.icon(
                                            onPressed: () {
                                              setState(() {
                                                showSearchWidgets = true;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.search,
                                              color: UIColors.primaryColor,
                                            ),
                                            label: Text(
                                              "Search",
                                              style: TextStyle(
                                                color: UIColors.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.grey.shade300,
                                            ),
                                            child: TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  // parcels.sort((a, b) {
                                                  //   return a.createdAt
                                                  //       .compareTo(b.createdAt);
                                                  // });
                                                  searchParcelsByDate();
                                                });
                                              },
                                              child: Text(
                                                "Sorty by date",
                                                style: TextStyle(
                                                  color: Colors.grey.shade600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 15, 15, 15),
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.grey.shade300,
                                            ),
                                            child: TextField(
                                              controller: searchTextController,
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText:
                                                      "Type name/number, then tap search"),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  searchedParcels.clear();
                                                  setState(() {});
                                                  if (searchTextController
                                                              .text !=
                                                          null ||
                                                      searchTextController
                                                              .text !=
                                                          "") {
                                                    log("search");
                                                    for (var i = 0;
                                                        i < parcels.length;
                                                        i++) {
                                                      var searchText =
                                                          "${parcels[i].recipientName} ${parcels[i].phoneNumber}"
                                                              .toLowerCase();
                                                      log(searchText);
                                                      if (searchText.contains(
                                                          searchTextController
                                                              .text
                                                              .toLowerCase())) {
                                                        searchedParcels
                                                            .add(parcels[i]);
                                                      }
                                                    }
                                                  }
                                                });
                                                setState(() {});
                                              },
                                              child: Text("Search"),
                                              style: ElevatedButton.styleFrom(
                                                primary: UIColors.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                              SizedBox(
                                height: 10,
                              ),
                              searchedParcels.length == 0
                                  ? ListView.builder(
                                      // separatorBuilder: (context, index) {
                                      //   return Divider(
                                      //     height: 1,
                                      //   );
                                      // },
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: parcels.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        startFrom = parcels.length;
                                        return parcelItem(parcels[index]);
                                      },
                                    )
                                  : ListView.builder(
                                      // separatorBuilder: (context, index) {
                                      //   return Divider(
                                      //     height: 1,
                                      //   );
                                      // },
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: searchedParcels.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        // startFrom = parcels.length;
                                        return parcelItem(
                                            searchedParcels[index]);
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

  Widget parcelItem(ParcelModel item) {
    return InkWell(
        onTap: () {
          Get.toNamed('/merchant/parcel/details/${item.trackingCode}');
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
              Container(
                width: Get.width,
                child: Text(
                  item.recipientName,
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Container(
                width: Get.width,
                child: Text(
                  item.recipientPhone.toString(),
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "COD=${item.cod} Charge=${item.deliveryCharge}",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                      item.merchantpayStatus == "2"
                          ? "Paid"
                          : item.merchantpayStatus == "1"
                              ? "Processing"
                              : "Unpaid",
                      style: TextStyle(
                        fontSize: 15,
                        color: UIColors.primaryColor,
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    GetStorage().read(item.status.toString()),
                    style:
                        TextStyle(fontSize: 16, color: UIColors.primaryColor),
                  ),
                  Text(
                    item.updatedAt,
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  searchParcelsByDate() async {
    var newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    log(newDateRange.toString());
    searchedParcels.clear();
    setState(() {});
    for (var i = 0; i < parcels.length; i++) {
      if (parcels[i].createdAt != null || parcels[i].createdAt != "") {
        if (DateTime.parse(parcels[i].createdAt.toString()).isAfter(
              newDateRange.start.subtract(Duration(days: 1)),
            ) &&
            DateTime.parse(parcels[i].createdAt.toString()).isBefore(
              newDateRange.end.add(Duration(days: 1)),
            )) {
          log("parcel found");
          searchedParcels.add(parcels[i]);
        }
      }
    }

    setState(() {});
  }
}
