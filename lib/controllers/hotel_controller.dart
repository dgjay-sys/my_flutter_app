import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_project/models/hotel_model.dart';
import 'package:hotel_project/models/hotel_reserve_model.dart';
import 'package:hotel_project/models/room_model.dart';
import 'package:hotel_project/services/app_services.dart';

class HotelController extends GetxController {
  GlobalKey<FormState> hotelControllerFormKey = GlobalKey();
  var room = <Rooms>[].obs;
  @override
  void onInit() {
    super.onInit();
    showHotelList();
    // showHotelRoomsList();
  }

  var hotels = <Hotel>[].obs;
  var rooms = <Rooms>[].obs;
  var hotelInfo = <Hotel>[].obs;
  var reservedHotel = <Reserve>[].obs;
  Future<void> showHotelList() async {
    var response = await ApiServices().getHotelList();
    hotels.value = response;
  }

  Future<void> showHotelRoomsList(int hotelId) async {
    var response = await ApiServices().getRoomListById(hotelId);
    rooms.value = response;
  }

  Future<void> showHotelInfo(int hotelId) async {
    var response = await ApiServices().getHotelInfoById(hotelId);
    hotelInfo.value = response;
  }

  Future<void> addHotelReserv(
      int hotelId,
      int userid,
      String hotelName,
      String hotelTypeRoom,
      String dateDepart,
      String dateReturn,
      int totalPayment) async {
    await ApiServices().getHotelReserve(hotelId, userid, hotelName,
        hotelTypeRoom, dateDepart, dateReturn, totalPayment);
  }

  Future<void> showHotelReserved(int userid) async {
    var response = await ApiServices().showReservedHotelRoom(userid);
    reservedHotel.value = response;
    Get.toNamed("/toreserve");
  }
}
