import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:hotel_project/models/auth_model.dart';
import 'package:hotel_project/models/hotel_model.dart';
import 'package:hotel_project/models/hotel_reserve_model.dart';
import 'package:hotel_project/models/room_model.dart';
import 'package:hotel_project/models/user_model.dart';
import 'package:hotel_project/services/stored_data.dart';
//import 'package:hotel_project/models/user_model.dart';

class ApiServices {
  final dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8000'));

  Future<List<User>> getUserList() async {
    final response = await dio.get('/getuser');
    if (response.statusCode == 200) {
      List<dynamic> result = response.data;
      List<User> user = result.map((json) => User.fromJson(json)).toList();
      return user;
    }
    return [];
  }

  Future<Auth> login(String username, String password) async {
    var formData = {
      'username': username,
      'password': password,
    };
    final response = await dio.post('/login',
        data: formData,
        options: Options(headers: {
          HttpHeaders.acceptHeader: "json/application/json",
          HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
        }));
    if (response.statusCode == 200) {
      Auth userTokenInfo = authFromJson(response.toString());
      return userTokenInfo;
    } else {}
    return Auth();
  }

  Future<void> register(
      String username, String password, String fname, String lname) async {
    var registerformData = {
      'fname': fname,
      'lname': lname,
      'username': username,
      'password': password,
    };

    try {
      final response = await dio.post('/register',
          data: registerformData,
          options: Options(headers: {
            HttpHeaders.acceptHeader: "json/application/json",
            HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
          }));
      if (response.statusCode == 200) {
        //print(response.data);
      }
    } catch (e) {
      // if (e is DioError) {
      //   //print("Dio error: ${e.message}");

      // } else {
      //   //print("Unexpected error: $e");
      // }
    }
  }

  Future<List<Hotel>> getHotelList() async {
    final responseList = await dio.get('/gethotels');
    if (responseList.statusCode == 200) {
      List<dynamic> hotelList = responseList.data;
      List<Hotel> hotel =
          hotelList.map((json) => Hotel.fromJson(json)).toList();
      return hotel;
    }
    return [];
  }

  Future<List<Rooms>> getRoomListById(int hotelid) async {
    final responseRoomList = await dio.post('/getrooms',
        data: jsonEncode({'hotelid': hotelid}),
        options: Options(headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.contentTypeHeader: "application/json"
        }));
    if (responseRoomList.statusCode == 200) {
      List<dynamic> roomListByID = responseRoomList.data;
      List<Rooms> room =
          roomListByID.map((json) => Rooms.fromJson(json)).toList();
      return room;
    } else {
      throw Exception('Failed to load rooms');
    }
  }

  Future<List<Hotel>> getHotelInfoById(int hotelid) async {
    final responseRoomList = await dio.post('/gethotelinfo',
        data: jsonEncode({'hotelid': hotelid}),
        options: Options(headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.contentTypeHeader: "application/json"
        }));
    if (responseRoomList.statusCode == 200) {
      List<dynamic> hotelInfoByID = responseRoomList.data;
      List<Hotel> hotel =
          hotelInfoByID.map((json) => Hotel.fromJson(json)).toList();
      return hotel;
    } else {
      throw Exception('Failed to load Hotel Info');
    }
  }

  Future<void> getHotelReserve(
      int hotelId,
      int userId,
      String hotelName,
      String hotelTypeRoom,
      String dateDepart,
      String dateReturn,
      int totalPayment) async {
    final response = await dio.post('/addreserve',
        data: jsonEncode({
          "hotelId": hotelId,
          "userId": userId,
          "hotelName": hotelName,
          "hotelTypeRoom": hotelTypeRoom,
          "dateDepart": dateDepart,
          "dateReturn": dateReturn,
          "totalPayment": totalPayment
        }),
        options: Options(headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.contentTypeHeader: "application/json"
        }));

    if (response.statusCode == 200) {
      //print(response.data);
    }
  }

  //*user info Update
  Future<void> updateUserFname(int userId, String newFname) async {
    //print();
    final response = await dio.post('/updatefname',
        data: jsonEncode({"newFname": newFname, "userId": userId}),
        options: Options(headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.contentTypeHeader: "application/json",
          //HttpHeaders.authorizationHeader:,
          "authorization": "Bearer ${dataStored.read('token').toString()}",
        }));
    if (response.statusCode == 200) {
      //print(response.data);
    }
  }

  Future<void> updateUserLname(int userId, String newLname) async {
    final response = await dio.post('/updatelname',
        data: jsonEncode({"newLname": newLname, "userId": userId}),
        options: Options(headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.contentTypeHeader: "application/json",
          "authorization": "Bearer ${dataStored.read('token').toString()}",
        }));
    if (response.statusCode == 200) {
      //print(response.data);
    }
  }

  Future<void> updateUsername(int userId, String newUsername) async {
    final response = await dio.put('/updateusername',
        data: jsonEncode({"newUsername": newUsername, "userId": userId}),
        options: Options(headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.contentTypeHeader: "application/json",
          "authorization": "Bearer ${dataStored.read('token').toString()}",
        }));
    if (response.statusCode == 200) {
      //print(response.data);
    }
  }

  //*view reserved hotel
  Future<List<Reserve>> showReservedHotelRoom(int userid) async {
    final response = await dio.post('/getreserve',
        data: jsonEncode({"userId": userid}),
        options: Options(headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.contentTypeHeader: "application/json",
        }));
    if (response.statusCode == 200) {
      List<dynamic> hotelReserveInfoByID = response.data;
      List<Reserve> hotelreserved =
          hotelReserveInfoByID.map((json) => Reserve.fromJson(json)).toList();
      return hotelreserved;
    } else {
      throw Exception('Failed to load Hotel Info');
    }
  }

  Future<void> cancelStatus(int userid, int reserveid) async {
    final response = await dio.put('/cancelbook',
        data: jsonEncode({"userId": userid, "reserveId": reserveid}),
        options: Options(headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.contentTypeHeader: "application/json",
          "authorization": "Bearer ${dataStored.read('token').toString()}"
        }));
    if (response.statusCode == 200) {
      print(response.data);
    } else {
      print(userid);
      print(reserveid);
    }
  }
}
