/*
Author: QuickTech IT
Author URI: http://quicktech-ltd.com;
Description: QuickTech IT maintain standard quality for Website and Creative Design
*/

import 'package:courier/GlobalUtils/Decoration.dart';
import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Merchant/Utils/MerchantBottomBar.dart';
import 'package:courier/Merchant/Utils/NavigationDrawer.dart';
import 'package:courier/Models/MerchantModel.dart';
import 'package:courier/Network/MerchantNetwork.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

// ignore: camel_case_types
class QuickTechIT_Profile extends StatefulWidget {
  @override
  _QuickTechIT_ProfileState createState() => _QuickTechIT_ProfileState();
}

// ignore: camel_case_types
class _QuickTechIT_ProfileState extends State<QuickTechIT_Profile> {
  MerchantModel userData;

  void initState() {
    MerchantNetwork().getUserData().then((value) {
      setState(() {
        userData = value;
      });
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
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: UIColors.pageBackground,
      endDrawer: NavigationDrawer(),
      bottomNavigationBar: MerchantBottomBar(),
      body: userData == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(200),
                                    child: userData == null
                                        ? Icon(
                                            Icons.person,
                                            size: 100,
                                          )
                                        : Container(
                                            child: Icon(
                                              Icons.person,
                                              size: 100,
                                            ),
                                            // Image.network(
                                            //   "https://previews.123rf.com/images/urfandadashov/urfandadashov1809/urfandadashov180902667/109317646-ic%C3%B4ne-de-vecteur-de-profil-pic-isol%C3%A9-sur-fond-transparent-concept-de-logo-profil-pic-pic.jpg",
                                            //   scale: 1,
                                            //   fit: BoxFit.fill,
                                            // ),
                                            height: 100,
                                            width: 100,
                                          ),
                                  )),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            if (userData.companyName != null)
                              Text(
                                "Company Name",
                                style: TextStyle(
                                  fontSize: ResponsiveFlutter.of(context)
                                      .fontSize(1.8),
                                  color: Colors.grey,
                                ),
                              ),
                            if (userData.companyName != null)
                              SizedBox(
                                height: 3,
                              ),
                            if (userData.companyName != null)
                              Text(
                                userData.companyName,
                                style: TextStyle(
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(2.2),
                                    color: UIColors.blackColor),
                              ),
                            if (userData.companyName != null)
                              SizedBox(
                                height: 15,
                              ),
                            Text(
                              'Owner Name',
                              style: TextStyle(
                                fontSize:
                                    ResponsiveFlutter.of(context).fontSize(1.8),
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              userData.firstName == null
                                  ? ""
                                  : userData.firstName,
                              style: TextStyle(
                                  fontSize: ResponsiveFlutter.of(context)
                                      .fontSize(2.2),
                                  color: UIColors.blackColor),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Phone Number',
                              style: TextStyle(
                                fontSize:
                                    ResponsiveFlutter.of(context).fontSize(1.8),
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              userData.phoneNumber == null
                                  ? ""
                                  : "0${userData.phoneNumber}",
                              style: TextStyle(
                                  fontSize: ResponsiveFlutter.of(context)
                                      .fontSize(2.2),
                                  color: UIColors.blackColor),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Email',
                              style: TextStyle(
                                fontSize:
                                    ResponsiveFlutter.of(context).fontSize(1.8),
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              userData.emailAddress == null
                                  ? ""
                                  : userData.emailAddress,
                              style: TextStyle(
                                  fontSize: ResponsiveFlutter.of(context)
                                      .fontSize(2.2),
                                  color: UIColors.blackColor),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Office Address',
                              style: TextStyle(
                                fontSize:
                                    ResponsiveFlutter.of(context).fontSize(1.8),
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              userData.pickLocation == null
                                  ? ""
                                  : userData.pickLocation,
                              style: TextStyle(
                                  fontSize: ResponsiveFlutter.of(context)
                                      .fontSize(2.2),
                                  color: UIColors.blackColor),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: CustomDecoration().buttonDecoration(),
                              child: TextButton(
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.all(8.0))),
                                onPressed: () {
                                  Get.toNamed('/merchant/settings');
                                },
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                      fontSize: ResponsiveFlutter.of(context)
                                          .fontSize(2.2),
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 70,
                            ),
                          ],
                        ),
                      )),
                ],
              )),
    );
  }
}
