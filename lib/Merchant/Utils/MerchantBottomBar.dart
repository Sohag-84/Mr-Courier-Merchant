import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class MerchantBottomBar extends StatefulWidget {
  @override
  _MerchantBottomBarState createState() => _MerchantBottomBarState();
}

class _MerchantBottomBarState extends State<MerchantBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        height: 60,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: SizedBox(
            height: 60,
            width: 60,
            child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              elevation: 10,
              onPressed: () {
                Get.toNamed('/merchant/parcel/new');
              },
              child: Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: UIColors.primaryColor),
                child: Icon(Icons.add, size: 30),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: new Container(
              color: Colors.transparent,
              height: 60.0,
              child: new BottomAppBar(
                shape: CircularNotchedRectangle(),
                color: UIColors.primaryColor,
                child: Row(
                  //mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed('/merchant/home');
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.home,
                                color: Colors.white,
                                size: 25,
                              ),
                              Text(
                                'Home',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(1.5)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed('/merchant/parcel/list');
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_bag,
                                color: Colors.white,
                                size: 25,
                              ),
                              Text(
                                'Parcel',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(1.5)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed('/merchant/parcel/new');
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.home,
                                color: Colors.transparent,
                                size: 25,
                              ),
                              Text(
                                'Create Parcel',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(1.5)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed('/merchant/pickup/list');
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.directions_bike,
                                color: Colors.white,
                                size: 25,
                              ),
                              Text(
                                'Pickup',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(1.5)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed('/merchant/payments');
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.payment,
                                color: Colors.white,
                                size: 25,
                              ),
                              Text(
                                'Payments',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(1.5)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  // newParcel() {
  //   Get.defaultDialog(
  //       title: "Choose Service Type",
  //       content: Expanded(
  //         flex: 1,
  //         child: SingleChildScrollView(
  //             physics: BouncingScrollPhysics(),
  //             child: ListView.builder(
  //               shrinkWrap: true,
  //               physics: NeverScrollableScrollPhysics(),
  //               itemCount: services.length,
  //               itemBuilder: (BuildContext context, int index) {
  //                 return TextButton(
  //                     onPressed: () {
  //                       Get.offAndToNamed(
  //                           '/merchant/parcel/new/${services[index].slug}');
  //                     },
  //                     child: Column(
  //                       children: [
  //                         SizedBox(
  //                           height: 30,
  //                         ),
  //                         Stack(
  //                           alignment: Alignment.topCenter,
  //                           children: <Widget>[
  //                             Container(
  //                               width: Get.width,
  //                               decoration: BoxDecoration(
  //                                   borderRadius: new BorderRadius.circular(10.0),
  //                                   color: UIColors.primaryColor2),
  //                               child: Column(
  //                                 mainAxisSize: MainAxisSize.min,
  //                                 children: [
  //                                   SizedBox(
  //                                     height: 50,
  //                                   ),
  //                                   Text(
  //                                     services[index].title,
  //                                     style: TextStyle(
  //                                         fontSize: ResponsiveFlutter.of(context)
  //                                             .fontSize(2.5),
  //                                         color: Colors.white,
  //                                         fontWeight: FontWeight.bold),
  //                                   ),
  //                                   SizedBox(
  //                                     height: 5,
  //                                   ),
  //                                   Text(
  //                                     "Delivery",
  //                                     style: TextStyle(
  //                                         fontSize: ResponsiveFlutter.of(context)
  //                                             .fontSize(2.2),
  //                                         color: Colors.white),
  //                                   ),
  //                                   SizedBox(
  //                                     height: 15,
  //                                   ),
  //                                 ],
  //                               ),
  //                             ),
  //                             FractionalTranslation(
  //                               translation: Offset(0.0, -0.5),
  //                               child: ClipRRect(
  //                                   borderRadius: BorderRadius.circular(200),
  //                                   child: Container(
  //                                       color: UIColors.primaryColor,
  //                                       height: 80,
  //                                       width: 80,
  //                                       child: Center(
  //                                           child: Text(
  //                                         services[index].time,
  //                                         style: TextStyle(
  //                                             fontSize:
  //                                                 ResponsiveFlutter.of(context)
  //                                                     .fontSize(2),
  //                                             color: Colors.white),
  //                                       )))),
  //                             ),
  //                           ],
  //                         )
  //                       ],
  //                     ));
  //               },
  //             )),
  //       ));
  // }
}
