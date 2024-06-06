import 'dart:async';

import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(milliseconds: 1000), () {
      Get.offAllNamed('/');
    });
  }
}
