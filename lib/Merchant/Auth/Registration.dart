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
class QuickTechIT_MerchantRegistration extends StatefulWidget {
  QuickTechIT_MerchantRegistrationState createState() =>
      QuickTechIT_MerchantRegistrationState();
}

// ignore: camel_case_types
class QuickTechIT_MerchantRegistrationState
    extends State<QuickTechIT_MerchantRegistration> {
  TextEditingController nameOfBusinessController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController businessUrlController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  // TextEditingController passwordController = new TextEditingController();
  // TextEditingController confirmPasswordController = new TextEditingController();

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
                    "Sign up",
                    style: TextStyle(
                      color: UIColors.blackColor,
                      fontSize: ResponsiveFlutter.of(context).fontSize(3.5),
                    ),
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
                          "Name of Business",
                          style: TextStyle(
                            color: UIColors.blackColor,
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: CustomDecoration().textFieldDecoration(),
                        child: TextFormField(
                          controller: nameOfBusinessController,
                          validator: (value) {
                            if (value.length == 0) {
                              return "Please enter your business name";
                            } else
                              return null;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            prefixIcon: Icon(
                              Icons.business_center,
                              color: UIColors.primaryColor,
                            ),
                            border: InputBorder.none,
                            hintStyle:
                                TextStyle(color: Colors.grey.withOpacity(.8)),
                            hintText: "Business Name",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: Get.width,
                        child: Text(
                          "Your Name",
                          style: TextStyle(
                            color: UIColors.blackColor,
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: CustomDecoration().textFieldDecoration(),
                        child: TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value.length == 0) {
                              return "Please enter your name";
                            } else
                              return null;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            prefixIcon: Icon(
                              Icons.person,
                              color: UIColors.primaryColor,
                            ),
                            border: InputBorder.none,
                            hintStyle:
                                TextStyle(color: Colors.grey.withOpacity(.8)),
                            hintText: "Name",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: Get.width,
                        child: Text(
                          "Phone",
                          style: TextStyle(
                            color: UIColors.blackColor,
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
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
                      Container(
                        width: Get.width,
                        child: Text(
                          "Email",
                          style: TextStyle(
                            color: UIColors.blackColor,
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: CustomDecoration().textFieldDecoration(),
                        child: TextFormField(
                          controller: emailController,
                          validator: (email) {
                            // if (email.length == 0) {
                            //   return "Please enter your email";
                            // } else
                            if (email != "") {
                              if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(email))
                                return "Please enter an valid email";
                              else
                                return null;
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            prefixIcon: Icon(
                              Icons.email,
                              color: UIColors.primaryColor,
                            ),
                            border: InputBorder.none,
                            hintStyle:
                                TextStyle(color: Colors.grey.withOpacity(.8)),
                            hintText: "Email",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: Get.width,
                        child: Text(
                          "Password",
                          style: TextStyle(
                            // color: UIColors.blackshade,
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(1.8),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: CustomDecoration().textFieldDecoration(),
                        child: TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordController,
                          validator: (value) {
                            if (value.length < 8) {
                              return "Must be 8 character";
                            } else
                              return null;
                          },
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            prefixIcon: Icon(
                              Icons.vpn_key,
                              color: UIColors.primaryColor,
                            ),
                            border: InputBorder.none,
                            hintStyle:
                                TextStyle(color: Colors.grey.withOpacity(.8)),
                            hintText: "Password",
                          ),
                        ),
                      ),

                      // SizedBox(
                      //   height: 10,
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
                      //       if (value.length < 8) {
                      //         return "Must be 8 character";
                      //       } else
                      //         return null;
                      //     },
                      //     decoration: InputDecoration(
                      //       contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      //       prefixIcon: Icon(Icons.vpn_key, color: UIColors.primaryColor,),
                      //       border: InputBorder.none,
                      //       hintStyle:
                      //           TextStyle(color: Colors.grey.withOpacity(.8)),
                      //       hintText: "Password",
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Container(
                      //   width: Get.width,
                      //   child: Text(
                      //     "Confirm Password",
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
                      //     controller: confirmPasswordController,
                      //     validator: (value) {
                      //       if (value != passwordController.text) {
                      //         return "Password doesn't match";
                      //       } else
                      //         return null;
                      //     },
                      //     decoration: InputDecoration(
                      //       contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      //       prefixIcon: Icon(Icons.done, color: UIColors.primaryColor,),
                      //       border: InputBorder.none,
                      //       hintStyle:
                      //           TextStyle(color: Colors.grey.withOpacity(.8)),
                      //       hintText: "Confirm Password",
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 30,
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
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              MerchantNetwork().anotherregister(
                                businessName: nameOfBusinessController.text,
                                name: nameController.text,
                                phoneNumber: phoneController.text,
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                fontSize:
                                    ResponsiveFlutter.of(context).fontSize(2.2),
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Text(
                          "Already have an account",
                          style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                            color: UIColors.blackColor,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed('/merchant/login');
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(2),
                              color: UIColors.primaryColor,
                              fontWeight: FontWeight.bold),
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
    );
  }
}
