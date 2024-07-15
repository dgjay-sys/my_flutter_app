import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hotel_project/services/app_services.dart';
import 'package:hotel_project/services/data_storage.dart';

class AuthController extends GetxController {
  late TextEditingController userNameController;
  late TextEditingController passWordController;
  @override
  void onInit() {
    super.onInit();
    userNameController = TextEditingController();
    passWordController = TextEditingController();
  }

  Future<void> login() async {
    var response = await ApiServices()
        .login(userNameController.text, passWordController.text);
    DataStorage().setDataStorage(response);
    Get.offAllNamed('/home');
  }
}
