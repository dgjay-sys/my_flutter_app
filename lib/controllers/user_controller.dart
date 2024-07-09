import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_project/models/user_model.dart';
import 'package:hotel_project/services/app_services.dart';

class UserController extends GetxController {
  GlobalKey<FormState> userFormKey = GlobalKey<FormState>();
  late TextEditingController userNameController;
  late TextEditingController fNameController;
  late TextEditingController lNameController;
  @override
  void onInit() {
    super.onInit();
    showUserList();
    userNameController = TextEditingController();
    fNameController = TextEditingController();
    lNameController = TextEditingController();
  }

  GlobalKey<FormState> userControllerFormKey = GlobalKey();
  var users = <User>[].obs;

  Future<void> showUserList() async {
    var response = await ApiServices().getUserList();
    users.value = response;
  }

  Future<void> updateUserFname(int userid) async {
    await ApiServices().updateUserFname(userid, fNameController.text);
  }

  Future<void> updateUserLname(int userid) async {
    await ApiServices().updateUserLname(userid, lNameController.text);
  }

  Future<void> updateUsername(int userid) async {
    await ApiServices().updateUsername(userid, userNameController.text);
  }
}
