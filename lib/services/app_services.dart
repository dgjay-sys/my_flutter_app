import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:hotel_project/models/auth_model.dart';
import 'package:hotel_project/models/hotel_model.dart';
import 'package:hotel_project/models/user_model.dart';
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
        print(response.data);
      }
    } catch (e) {
      if (e is DioError) {
        print("Dio error: ${e.message}");
      } else {
        print("Unexpected error: $e");
      }
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
}
