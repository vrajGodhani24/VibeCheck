import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibecheck/views/homepage/model/user.dart';

class HomePageController extends GetxController {
  String nickname = "";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<User> allLiveUser = [];

  void setLiveUsers(List<User> users) {
    allLiveUser = users;
    update();
  }
}
