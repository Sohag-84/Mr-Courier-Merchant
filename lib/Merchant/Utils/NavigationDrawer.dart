import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Network/MerchantNetwork.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationDrawer extends StatefulWidget {
  NavigationDrawerState createState() => NavigationDrawerState();
}

class NavigationDrawerState extends State<NavigationDrawer> {
  final pref = GetStorage();

  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  _launchURL() async {
    const url = 'https://quicktech-ltd.com/';
    if (await canLaunch(url)) {
      await launch(
        url,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: Container(
        color: UIColors.pageBackground,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: UIColors.primaryColor,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(20),
                        ),
                      ),
                      width: Get.width,
                      padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
                      child: Column(
                        children: [
                          Text(
                            pref.read('userName'),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: ResponsiveFlutter.of(context)
                                    .fontSize(3.2)),
                          ),
                          Text(
                            "${pref.read('userPhone').toString()}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ResponsiveFlutter.of(context)
                                    .fontSize(2.5)),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Dashboard',
                        style: TextStyle(
                            color: UIColors.blackColor,
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2)),
                      ),
                      leading: Icon(
                        Icons.home,
                        color: UIColors.blackColor,
                      ),
                      onTap: () {
                        Get.offAndToNamed('/merchant/home');
                      },
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Parcel',
                        style: TextStyle(
                            color: UIColors.blackColor,
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2)),
                      ),
                      leading: Icon(
                        Icons.shopping_bag,
                        color: UIColors.blackColor,
                      ),
                      onTap: () {
                        Get.offAndToNamed('/merchant/parcel/list');
                      },
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Pickup',
                        style: TextStyle(
                            color: UIColors.blackColor,
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2)),
                      ),
                      leading: Icon(
                        Icons.directions_bike,
                        color: UIColors.blackColor,
                      ),
                      onTap: () {
                        Get.offAndToNamed('/merchant/pickup/list');
                      },
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Pickup Request',
                        style: TextStyle(
                            color: UIColors.blackColor,
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2)),
                      ),
                      leading: Icon(
                        Icons.pedal_bike_outlined,
                        color: UIColors.blackColor,
                      ),
                      onTap: () {
                        Get.back();
                        Get.defaultDialog(
                            title: "Pickup Request Type",
                            content: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Get.offAndToNamed(
                                            '/merchant/pickup/request/1');
                                      },
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Stack(
                                            alignment: Alignment.topCenter,
                                            children: <Widget>[
                                              Container(
                                                width: Get.width,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(10.0),
                                                    color:
                                                        UIColors.primaryColor2),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    SizedBox(
                                                      height: 50,
                                                    ),
                                                    Text(
                                                      "Next Day",
                                                      style: TextStyle(
                                                          fontSize:
                                                              ResponsiveFlutter
                                                                      .of(
                                                                          context)
                                                                  .fontSize(3),
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "Delivery",
                                                      style: TextStyle(
                                                          fontSize:
                                                              ResponsiveFlutter
                                                                      .of(
                                                                          context)
                                                                  .fontSize(
                                                                      2.5),
                                                          color: Colors.white),
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              FractionalTranslation(
                                                translation: Offset(0.0, -0.5),
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200),
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            color: UIColors
                                                                .primaryColor,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .white,
                                                                  offset:
                                                                      Offset(
                                                                          15.0,
                                                                          15.0))
                                                            ]),
                                                        height: 80,
                                                        width: 80,
                                                        child: Center(
                                                            child: Text(
                                                          "24h",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  ResponsiveFlutter.of(
                                                                          context)
                                                                      .fontSize(
                                                                          2),
                                                              color:
                                                                  Colors.white),
                                                        )))),
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Get.offAndToNamed(
                                            '/merchant/pickup/request/2');
                                      },
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Stack(
                                            alignment: Alignment.topCenter,
                                            children: <Widget>[
                                              Container(
                                                width: Get.width,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(10.0),
                                                    color:
                                                        UIColors.primaryColor2),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    SizedBox(
                                                      height: 50,
                                                    ),
                                                    Text(
                                                      "Same Day",
                                                      style: TextStyle(
                                                          fontSize:
                                                              ResponsiveFlutter
                                                                      .of(
                                                                          context)
                                                                  .fontSize(3),
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "Delivery",
                                                      style: TextStyle(
                                                          fontSize:
                                                              ResponsiveFlutter
                                                                      .of(
                                                                          context)
                                                                  .fontSize(
                                                                      2.5),
                                                          color: Colors.white),
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              FractionalTranslation(
                                                translation: Offset(0.0, -0.5),
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200),
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            color: UIColors
                                                                .primaryColor,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .white,
                                                                  offset:
                                                                      Offset(
                                                                          15.0,
                                                                          15.0))
                                                            ]),
                                                        height: 80,
                                                        width: 80,
                                                        child: Center(
                                                            child: Text(
                                                          "12h",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  ResponsiveFlutter.of(
                                                                          context)
                                                                      .fontSize(
                                                                          2),
                                                              color:
                                                                  Colors.white),
                                                        )))),
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ));
                      },
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Payments',
                        style: TextStyle(
                            color: UIColors.blackColor,
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2)),
                      ),
                      leading: Icon(
                        Icons.payment,
                        color: UIColors.blackColor,
                      ),
                      onTap: () {
                        Get.offAndToNamed('/merchant/payments');
                      },
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Profile',
                        style: TextStyle(
                            color: UIColors.blackColor,
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2)),
                      ),
                      leading: Icon(
                        Icons.person,
                        color: UIColors.blackColor,
                      ),
                      onTap: () {
                        Get.offAndToNamed('/merchant/profile');
                      },
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Setting',
                        style: TextStyle(
                            color: UIColors.blackColor,
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2)),
                      ),
                      leading: Icon(
                        Icons.settings,
                        color: UIColors.blackColor,
                      ),
                      onTap: () {
                        Get.offAndToNamed('/merchant/settings');
                      },
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Support',
                        style: TextStyle(
                            color: UIColors.blackColor,
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2)),
                      ),
                      leading: Icon(
                        Icons.contact_support,
                        color: UIColors.blackColor,
                      ),
                      onTap: () {
                        Get.offAndToNamed('/merchant/support');
                      },
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Track Parcel',
                        style: TextStyle(
                            color: UIColors.blackColor,
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2)),
                      ),
                      leading: Icon(
                        Icons.location_on,
                        color: UIColors.blackColor,
                      ),
                      onTap: () {
                        Get.offAndToNamed('/merchant/parcel/track');
                      },
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Logout',
                        style: TextStyle(
                            color: UIColors.blackColor,
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2)),
                      ),
                      leading: Icon(
                        Icons.logout,
                        color: UIColors.blackColor,
                      ),
                      onTap: () {
                        MerchantNetwork().logout();
                      },
                    ),
                    // SizedBox(height: 30,),
                    // Container(
                    //   height: 40,
                    //   padding: EdgeInsets.all(1),
                    //   decoration: new BoxDecoration(
                    //     color: UI_Colors.buttonColor,
                    //     border: new Border.all(color: Colors.white, width: 2.0),
                    //     borderRadius: new BorderRadius.circular(25.0),
                    //   ),
                    //   child: ElevatedButton(
                    //     style: ButtonStyle(
                    //       shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(25.0),
                    //           side: BorderSide(color: Colors.white, width: 2))),
                    //     ),
                    //     onPressed: () async {
                    //       if(pref == null) {
                    //         pref = await SharedPreferences.getInstance();
                    //       }
                    //
                    //       if(pref.getString('lang') == 'Bn'){
                    //         pref.setString('lang', 'En');
                    //       } else if(pref.getString('lang') == 'En'){
                    //         pref.setString('lang', 'Bn');
                    //       }
                    //
                    //       setLang();
                    //
                    //       widget.notifyLanguageChange();
                    //     },
                    //     color: UI_Colors.buttonColor,
                    //     textColor: Colors.white,
                    //     child: Text(
                    //       langText,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Container(
              width: Get.width,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Design & Developed By',
                    style: TextStyle(
                      fontSize: ResponsiveFlutter.of(context).fontSize(1.7),
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _launchURL();
                    },
                    child: Text(
                      'QuickTech IT',
                      style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(1.7),
                        color: UIColors.blackColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
