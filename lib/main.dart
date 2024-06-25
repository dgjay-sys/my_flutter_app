import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hotel_project/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'hotel reservation',
      initialRoute: '/login',
      getPages: AppPages.list,
      // home: const HomePage(),
      // routes: {
      //   '/landing': (context) => const LandingPage(),
      //   '/getstarted': (context) => const GetStarted(),
      //   '/register': (context) => const RegisterPage(),
      //   '/login': (context) => const LoginPage(),
      //   '/profile': (context) => const SettingProfile(),
      //   '/home': (context) => const HomePage(),
      //   '/forgot': (context) => const ForgotPassword(),
      //   '/viewinfo': (context) => const ViewHotel(),
      //   '/booknow': (context) => const BookHotel(),
      //   '/roomtype': (context) => const TypeOfRoom(),
      // },
    );
  }
}
