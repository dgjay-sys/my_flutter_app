import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_project/services/app_services.dart';
//import 'package:hotel_project/services/data_storage.dart';

class UserRegister extends GetxController {
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  late TextEditingController userNameController;
  late TextEditingController passWordController;
  late TextEditingController fNameController;
  late TextEditingController lNameController;
  @override
  void onInit() {
    super.onInit();
    fNameController = TextEditingController();
    lNameController = TextEditingController();
    passWordController = TextEditingController();
    userNameController = TextEditingController();
  }

  Future<void> userRegister() async {
    await ApiServices().register(userNameController.text,
        passWordController.text, lNameController.text, fNameController.text);
    Get.offAllNamed('/login');
  }
}
