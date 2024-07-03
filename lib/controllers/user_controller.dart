import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_project/models/user_model.dart';
import 'package:hotel_project/services/app_services.dart';

class UserController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    showUserList();
  }

  GlobalKey<FormState> userControllerFormKey = GlobalKey();
  var users = <User>[].obs;

  Future<void> showUserList() async {
    var response = await ApiServices().getUserList();
    users.value = response;
  }
}
