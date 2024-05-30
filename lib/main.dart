import 'package:flutter/material.dart';
import 'package:hotel_project/views/get_started.dart';
import 'package:hotel_project/views/home_page_view.dart';
import 'package:hotel_project/views/landing_page_view.dart';
import 'package:hotel_project/views/login_page_view.dart';
import 'package:hotel_project/views/register_page_view.dart';
import 'package:hotel_project/views/setting_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hotel reservation',
      home: const HomePage(),
      routes: {
        '/landing': (context) => const LandingPage(),
        '/getstarted': (context) => const GetStarted(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
        '/profile': (context) => const SettingProfile(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
