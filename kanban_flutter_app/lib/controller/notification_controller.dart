// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class NotificationController extends GetxController {
  void loadingShow(dynamic text) {
    EasyLoading.instance
      ..animationStyle = EasyLoadingAnimationStyle.opacity
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = Colors.white
      ..indicatorColor = Colors.black
      ..textColor = Colors.black
      ..textPadding = EdgeInsets.all(10)
      ..indicatorType = EasyLoadingIndicatorType.doubleBounce
      ..textStyle = TextStyle(fontSize: 14);
    EasyLoading.show(
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
      status: text,
    );
  }

  void loadingDismiss() {
    EasyLoading.dismiss(
      animation: true,
    );
  }

  void showToast(String text, String type) {
    EasyLoading.instance
      ..animationStyle = EasyLoadingAnimationStyle.opacity
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = Colors.white
      ..indicatorColor = Colors.black
      ..textColor = Colors.black
      ..textPadding = EdgeInsets.all(10)
      ..indicatorType = EasyLoadingIndicatorType.cubeGrid
      ..displayDuration = Duration(seconds: 3)
      ..textStyle = TextStyle(fontSize: 14);

    if (type == 'success') {
      EasyLoading.showSuccess(text);
    } else if (type == 'error') {
      EasyLoading.showError(text);
    } else {
      EasyLoading.showInfo(text);
    }
  }
}
