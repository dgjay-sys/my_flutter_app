import 'package:flutter/material.dart';
import 'package:hotel_project/views/components/book_hotel.dart';
import 'package:hotel_project/views/components/view_hotel.dart';
import 'package:hotel_project/views/forgot_password.dart';
import 'package:hotel_project/views/get_started.dart';
import 'package:hotel_project/views/home_page_view.dart';
import 'package:hotel_project/views/landing_page_view.dart';
import 'package:hotel_project/views/login_page_view.dart';
import 'package:hotel_project/views/register_page_view.dart';
import 'package:hotel_project/views/setting_profile.dart';
import 'package:hotel_project/views/typeof_room.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hotel reservation',
      home: const TypeOfRoom(),
      routes: {
        '/landing': (context) => const LandingPage(),
        '/getstarted': (context) => const GetStarted(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
        '/profile': (context) => const SettingProfile(),
        '/home': (context) => const HomePage(),
        '/forgot': (context) => const ForgotPassword(),
        '/viewinfo': (context) => const ViewHotel(),
        '/booknow': (context) => const BookHotel(),
      },
    );
  }
}
