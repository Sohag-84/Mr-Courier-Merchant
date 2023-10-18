/*
Author: QuickTech IT
Author URI: http://quicktech-ltd.com;
Description: QuickTech IT maintain standard quality for Website and Creative Design
*/

import 'dart:ui';

import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Network/MerchantNetwork.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

// ignore: camel_case_types
class QuickTechIT_MerchantPasswordVerify extends StatefulWidget {
  QuickTechIT_MerchantPasswordVerifyState createState() =>
      QuickTechIT_MerchantPasswordVerifyState();
}

// ignore: camel_case_types
class QuickTechIT_MerchantPasswordVerifyState
    extends State<QuickTechIT_MerchantPasswordVerify> {
  String id = Get.parameters['id'];

  TextEditingController pinController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.pageBackground,
      body: Container(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: Get.width,
                    child: Text(
                      "Verify",
                      style: TextStyle(
                          color: UIColors.blackColor,
                          fontSize: ResponsiveFlutter.of(context).fontSize(4),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: Get.width,
                          child: Text(
                            'Verify Pin',
                            style: TextStyle(
                              color: UIColors.blackColor,
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(2),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(.5),
                                blurRadius: 4,
                                offset:
                                    Offset(4, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          child: TextFormField(
                            controller: pinController,
                            validator: (value) {
                              if (value.length == 0) {
                                return "Please enter verify pin";
                              } else
                                return null;
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(.8)),
                                hintText: "Verify Pin"),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: Get.width,
                          child: Text(
                            'New Password',
                            style: TextStyle(
                              color: UIColors.blackColor,
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(2),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(.5),
                                blurRadius: 4,
                                offset:
                                    Offset(4, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          child: TextFormField(
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            controller: passwordController,
                            validator: (value) {
                              if (value.length == 0) {
                                return "Please enter your new password";
                              } else if (value.length < 8) {
                                return "Password must be 8 digit";
                              } else
                                return null;
                            },
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(.8)),
                                hintText: "New Password"),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: UIColors.primaryColor,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(.5),
                                blurRadius: 4,
                                offset:
                                    Offset(4, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          child: TextButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(8.0))),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                MerchantNetwork().passwordVerify(
                                    id,
                                    pinController.text,
                                    passwordController.text);
                              }
                            },
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  fontSize: ResponsiveFlutter.of(context)
                                      .fontSize(2.2),
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
