import 'package:get/get.dart';
import 'package:hotel_project/routes/routes.dart';

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

class AppPages {
  static var list = [
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterPage(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.landing,
      page: () => const LandingPage(),
    ),
    GetPage(
      name: Routes.started,
      page: () => const GetStarted(),
    )
  ];
}
