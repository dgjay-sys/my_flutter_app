import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hotel_project/models/hotel_model.dart';
import 'package:hotel_project/services/app_services.dart';

class HotelController extends GetxController {
  GlobalKey<FormState> hotelControllerFormKey = GlobalKey();
  @override
  void onInit() {
    super.onInit();
    showHotelList();
  }

  var hotels = <Hotel>[].obs;

  Future<void> showHotelList() async {
    var response = await ApiServices().getHotelList();
    hotels.value = response;
    // print(response);
  }
}
