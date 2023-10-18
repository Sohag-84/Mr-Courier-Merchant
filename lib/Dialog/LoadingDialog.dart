import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class Loading {
  static Future dialog;

  void show() async {
    if (dialog == null) {
      dialog = viewDialog();
      await dialog;
    }
  }

  void dismiss() {
    if (dialog != null) {
      dialog = null;
      Get.back();
    }
  }

  Future viewDialog() {
    return showCupertinoDialog(
        context: Get.context,
        builder: (BuildContext context) => AlertDialog(
              backgroundColor: Colors.white.withOpacity(.9),
              insetPadding: EdgeInsets.symmetric(horizontal: 100),
              content: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Text(
                        "Loading...",
                        style: TextStyle(
                          color: UIColors.primaryColor,
                          fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
