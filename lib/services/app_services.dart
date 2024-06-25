import 'dart:io';

import 'package:dio/dio.dart';

import 'package:hotel_project/models/auth_model.dart';
//import 'package:hotel_project/models/user_model.dart';

class ApiServices {
  final dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8000'));

  // Future<Auth?> login(String username, String password) async {
  //   try {
  //     var formData = {
  //       'username': username,
  //       'password': password,
  //     };

  //     final response = await dio.post('/login',
  //         data: formData,
  //         options: Options(headers: {
  //           HttpHeaders.acceptHeader: "json/application/json",
  //           HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
  //         }));
  //     print('Response: ${response.toString()}');
  //     if (response.statusCode == 200) {
  //       return Auth.fromJson(response.data);
  //     } else {
  //       // Handle non-200 status codes (if needed)
  //       print('Error: ${response.statusCode}');
  //       return null;
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //     return null;
  //   }
  // }

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

  // Future<List<User>> getUserList() async {
  //   final response = await dio.get('/getuser');
  //   if (response.statusCode == 200) {
  //     List<dynamic> result = response.data;
  //     List<User> user = result.map((json) => User.fromJson(json)).toList();
  //     return user;
  //   }
  //   return [];
  // }
}
