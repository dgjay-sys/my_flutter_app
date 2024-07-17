import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_project/models/hotel_model.dart';
import 'package:hotel_project/models/hotel_reserve_model.dart';
import 'package:hotel_project/models/room_model.dart';
import 'package:hotel_project/services/app_services.dart';
import 'package:hotel_project/services/stored_data.dart';
import 'package:hotel_project/views/components/view_selected_reserve.dart';

class HotelController extends GetxController {
  GlobalKey<FormState> hotelControllerFormKey = GlobalKey();

  //*adding hotel TextEditingController
  late TextEditingController imgUrlController,
      hotelNameController,
      hotelDescController,
      hotelAddController,
      hotelEmailController,
      hotelSPriceController;

  //*adding room TextEditingController
  late TextEditingController roomImgUrlController,
      hotelRoomTypeController,
      hotelRoomDescController,
      hotelRoomPrice,
      noRoomController,
      noAdController,
      noChController;
  //var room = <Rooms>[].obs;
  @override
  void onInit() {
    super.onInit();
    showHotelList();
    // showHotelRoomsList();

    //*adding hotel TextEditingController
    imgUrlController = TextEditingController();
    hotelNameController = TextEditingController();
    hotelDescController = TextEditingController();
    hotelAddController = TextEditingController();
    hotelEmailController = TextEditingController();
    hotelSPriceController = TextEditingController();

    //*adding room TextEditingController
    roomImgUrlController = TextEditingController();
    hotelRoomTypeController = TextEditingController();
    hotelRoomDescController = TextEditingController();
    hotelRoomPrice = TextEditingController();
    noRoomController = TextEditingController();
    noAdController = TextEditingController();
    noChController = TextEditingController();
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
    await refreshReserveHotel(userid);
    Get.toNamed("/toreserve");
  }

  Future<void> cancelBooked(int userid, int reserveid) async {
    await ApiServices().cancelStatus(userid, reserveid);
    await refreshReserveHotel(userid);
    var reserved = reservedHotel.where((ob) => reserveid == ob.reserveId);
    Get.back();
    Get.to(() => ViewSelectedReserve(reserveHotel: reserved.first));
  }

  Future<void> refreshReserveHotel(int userid) async {
    var response = await ApiServices().showReservedHotelRoom(userid);
    reservedHotel.value = response;
  }

  //add hotel
  Future<void> addHotels() async {
    await ApiServices().addHotel(
        imgUrlController.text,
        hotelNameController.text,
        hotelDescController.text,
        hotelAddController.text,
        int.parse(dataStored.read('userid')),
        hotelEmailController.text,
        hotelSPriceController.text);

    Get.offAllNamed('/home');
  }

  Future<void> addRooms(int hotelId) async {
    await ApiServices().addRoom(
        hotelId,
        roomImgUrlController.text,
        hotelRoomTypeController.text,
        hotelRoomDescController.text,
        int.parse(hotelRoomPrice.text),
        int.parse(noRoomController.text),
        int.parse(noAdController.text),
        int.parse(noChController.text));
    //print(hotelRoomPrice.text);
  }
}
