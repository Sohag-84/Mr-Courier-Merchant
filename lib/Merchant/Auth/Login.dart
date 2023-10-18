/*
Author: QuickTech IT
Author URI: http://quicktech-ltd.com;
Description: QuickTech IT maintain standard quality for Website and Creative Design
*/

import 'dart:ui';

import 'package:courier/GlobalUtils/Decoration.dart';
import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Network/MerchantNetwork.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

// ignore: camel_case_types
class QuickTechIT_MerchantLogin extends StatefulWidget {
  @override
  _QuickTechIT_MerchantLoginState createState() =>
      _QuickTechIT_MerchantLoginState();
}

// ignore: camel_case_types
class _QuickTechIT_MerchantLoginState extends State<QuickTechIT_MerchantLogin> {
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
                  // FractionallySizedBox(
                  //   widthFactor: .7,
                  //   child: Container(
                  //     width: Get.width,
                  //     child: Image(
                  //         image: AssetImage('assets/images/logo.png'),
                  //         fit: BoxFit.fill),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  Container(
                    width: Get.width,
                    child: Text(
                      "Merchant Login",
                      style: TextStyle(
                          color: UIColors.blackColor,
                          fontSize: ResponsiveFlutter.of(context).fontSize(4),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        // Container(
                        //   width: Get.width,
                        //   child: Text(
                        //     'Username',
                        //     style: TextStyle(
                        //       color: UIColors.blackColor,
                        //       fontSize: ResponsiveFlutter.of(context).fontSize(2),
                        //     ),
                        //     textAlign: TextAlign.left,
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // Container(
                        //   decoration: CustomDecoration().textFieldDecoration(),
                        //   child: TextFormField(
                        //     controller: usernameController,
                        //     validator: (value) {
                        //       if (value.length == 0) {
                        //         return "Please enter your username";
                        //       }
                        //       // } else if (!RegExp(
                        //       //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        //       //     .hasMatch(email))
                        //       //   return "Please enter an valid email";
                        //       else
                        //         return null;
                        //     },
                        //     keyboardType: TextInputType.text,
                        //     decoration: InputDecoration(
                        //         contentPadding:
                        //             const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        //         border: InputBorder.none,
                        //         prefixIcon: Icon(Icons.person, color: UIColors.primaryColor,),
                        //         hintStyle:
                        //             TextStyle(color: Colors.grey.withOpacity(.8)),
                        //         hintText: "Username"),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // Container(
                        //   width: Get.width,
                        //   child: Text(
                        //     "Password",
                        //     style: TextStyle(
                        //       color: UIColors.blackColor,
                        //       fontSize: ResponsiveFlutter.of(context).fontSize(2),
                        //     ),
                        //     textAlign: TextAlign.left,
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // Container(
                        //   decoration: CustomDecoration().textFieldDecoration(),
                        //   child: TextFormField(
                        //     obscureText: true,
                        //     keyboardType: TextInputType.visiblePassword,
                        //     controller: passwordController,
                        //     validator: (value) {
                        //       if (value.length == 0) {
                        //         return "Please enter your password";
                        //       } else
                        //         return null;
                        //     },
                        //     decoration: InputDecoration(
                        //         contentPadding:
                        //             const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        //         border: InputBorder.none,
                        //         prefixIcon: Icon(Icons.vpn_key_rounded, color: UIColors.primaryColor,),
                        //         hintStyle:
                        //             TextStyle(color: Colors.grey.withOpacity(.8)),
                        //         hintText: "Password"),
                        //   ),
                        // ),
                        // Container(
                        //   width: Get.width,
                        //   child: Text(
                        //     "Phone",
                        //     style: TextStyle(
                        //       color: UIColors.blackColor,
                        //       fontSize:
                        //           ResponsiveFlutter.of(context).fontSize(2),
                        //     ),
                        //     textAlign: TextAlign.left,
                        //   ),
                        // ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: CustomDecoration().textFieldDecoration(),
                          child: TextFormField(
                            controller: phoneController,
                            validator: (phone) {
                              if (phone.length == 0) {
                                return "Please enter your phone number";
                              } else if (phone.length != 11)
                                return "Phone Number must be 11 digit";
                              else
                                return null;
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(20, 15, 20, 15),
                              prefixIcon: Icon(
                                Icons.phone_iphone,
                                color: UIColors.primaryColor,
                              ),
                              border: InputBorder.none,
                              hintStyle:
                                  TextStyle(color: Colors.grey.withOpacity(.8)),
                              hintText: "Phone",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed('/merchant/password/reset');
                          },
                          child: Container(
                            width: Get.width,
                            child: Text(
                              "Forget Password",
                              style: TextStyle(
                                fontSize:
                                    ResponsiveFlutter.of(context).fontSize(1.8),
                                color: UIColors.primaryColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: CustomDecoration().textFieldDecoration(),
                          // decoration: BoxDecoration(
                          //   border: Border.all(
                          //     color: Color(0xff66A182),
                          //     width: 0.58,
                          //   ),
                          //   color: Colors.white.withOpacity(0.8),
                          //   borderRadius: BorderRadius.circular(8),
                          // ),
                          child: TextFormField(
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            controller: passwordController,
                            validator: (value) {
                              if (value.length == 0) {
                                return "Please enter your password";
                              } else
                                return null;
                            },
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.lock_rounded,
                                  color: UIColors.primaryColor,
                                ),
                                hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(.8)),
                                hintText: "Password"),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          width: Get.width,
                          decoration: CustomDecoration().buttonDecoration(),
                          child: TextButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(8.0))),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                // MerchantNetwork().login(usernameController.text, passwordController.text, false);
                                // Get.toNamed(
                                //     '/merchant/otp/${phoneController.text}');
                                MerchantNetwork().anotherlogin(
                                    phoneController.text,
                                    passwordController.text,
                                    false);
                              }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: ResponsiveFlutter.of(context)
                                      .fontSize(2.2),
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                "Don't have account",
                                style: TextStyle(
                                  fontSize: ResponsiveFlutter.of(context)
                                      .fontSize(2.2),
                                  color: UIColors.blackColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed('/merchant/reg');
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(2.2),
                                    color: UIColors.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        // Container(
                        //   width: Get.width,
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.circular(10),
                        //     boxShadow: [
                        //       BoxShadow(
                        //         color: Colors.grey.withOpacity(.5),
                        //         blurRadius: 4,
                        //         offset:
                        //             Offset(4, 4), // changes position of shadow
                        //       ),
                        //     ],
                        //   ),
                        //   child: TextButton(
                        //       style: ButtonStyle(
                        //           padding: MaterialStateProperty.all(
                        //               EdgeInsets.all(8.0))),
                        //       onPressed: () {
                        //         Get.toNamed('/merchant/parcel/track');
                        //       },
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Icon(
                        //             Icons.timeline,
                        //             color: UIColors.primaryColor,
                        //           ),
                        //           SizedBox(
                        //             width: 10,
                        //           ),
                        //           Text(
                        //             "TRACK YOUR PARCEL",
                        //             style: TextStyle(
                        //                 fontSize: ResponsiveFlutter.of(context)
                        //                     .fontSize(2.2),
                        //                 color: UIColors.primaryColor),
                        //           ),
                        //         ],
                        //       )),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
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
