import 'package:courier/GlobalUtils/Decoration.dart';
import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:courier/Network/MerchantNetwork.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

// ignore: camel_case_types
class VerifyOtpForLogin extends StatefulWidget {
  @override
  _VerifyOtpForLoginState createState() => _VerifyOtpForLoginState();
}

// ignore: camel_case_types
class _VerifyOtpForLoginState extends State<VerifyOtpForLogin> {
  String phoneNumber = Get.parameters['phoneNumber'];

  TextEditingController pinPutController = new TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: UIColors.primaryColor),
      borderRadius: BorderRadius.circular(12),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int endTime;

  @override
  void initState() {
    // codeSent();

    super.initState();
  }

  codeSent() async {
    await MerchantNetwork().login(phoneNumber).then((value) {
      if (value) {
        setState(() {
          endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 120;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    width: Get.width,
                    child: Text(
                      "OTP Verification",
                      style: TextStyle(
                          color: UIColors.blackColor,
                          fontSize: ResponsiveFlutter.of(context).fontSize(4),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "An code has been sent to\n$phoneNumber",
                    style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                        color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  FractionallySizedBox(
                    widthFactor: .7,
                    child: PinPut(
                      fieldsCount: 6,
                      focusNode: _pinPutFocusNode,
                      controller: pinPutController,
                      validator: (code) {
                        if (code.length != 4)
                          return 'OTP must be of 4 digit';
                        else
                          return null;
                      },
                      submittedFieldDecoration: _pinPutDecoration.copyWith(
                          borderRadius: BorderRadius.circular(12)),
                      selectedFieldDecoration: _pinPutDecoration,
                      followingFieldDecoration: _pinPutDecoration.copyWith(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Text(
                      "I didn't receive code ",
                      style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(2),
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (endTime != null)
                    CountdownTimer(
                      endTime: endTime,
                      widgetBuilder: (_, CurrentRemainingTime time) {
                        if (time == null) {
                          return TextButton(
                            onPressed: () {
                              codeSent();
                            },
                            child: Container(
                              child: Text(
                                "Resend Code",
                                style: TextStyle(
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(2),
                                    fontWeight: FontWeight.bold,
                                    color: UIColors.primaryColor),
                              ),
                            ),
                          );
                        }
                        return Text(
                          '${time.min == null ? 0 : time.min}:${time.sec == null ? 0 : time.sec}',
                          style: TextStyle(
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(2.5),
                              fontWeight: FontWeight.bold,
                              color: UIColors.primaryColor),
                        );
                      },
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: Get.width,
                    decoration: CustomDecoration().buttonDecoration(),
                    child: TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          EdgeInsets.all(8.0),
                        ),
                      ),
                      onPressed: () {
                        if (pinPutController.text != null) {
                          String code = pinPutController.text.trim();

                          MerchantNetwork().verifyOTP(phoneNumber, code);
                        }
                        // MerchantNetwork()
                        //     .verifyOTP(phoneNumber, pinPutController.text);
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize:
                                ResponsiveFlutter.of(context).fontSize(2.2),
                            color: Colors.white),
                      ),
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
