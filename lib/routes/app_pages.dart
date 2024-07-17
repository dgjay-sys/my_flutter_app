import 'package:get/get.dart';
import 'package:hotel_project/models/hotel_model.dart';
import 'package:hotel_project/models/hotel_reserve_model.dart';
import 'package:hotel_project/routes/routes.dart';

import 'package:hotel_project/views/components/book_hotel.dart';
import 'package:hotel_project/views/components/view_hotel.dart';
import 'package:hotel_project/views/components/view_hotel_reserve.dart';
import 'package:hotel_project/views/components/view_selected_reserve.dart';
//import 'package:hotel_project/views/forgot_password.dart';
import 'package:hotel_project/views/get_started.dart';
import 'package:hotel_project/views/home_page_view.dart';
import 'package:hotel_project/views/landing_page_view.dart';
import 'package:hotel_project/views/login_page_view.dart';
import 'package:hotel_project/views/register_page_view.dart';
import 'package:hotel_project/views/setting_profile.dart';
import 'package:hotel_project/views/typeof_room.dart';
import 'package:hotel_project/views/user_info_updates.dart';

class AppPages {
  static var list = [
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterPage(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.landing,
      page: () => const LandingPage(),
    ),
    GetPage(
      name: Routes.started,
      page: () => const GetStarted(),
    ),
    GetPage(
      name: Routes.settings,
      page: () => const SettingProfile(),
    ),
    GetPage(
      name: Routes.userinfo,
      page: () => const UserInformation(),
    ),
    GetPage(
        name: Routes.viewhotel,
        page: () => ViewHotel(
              hotel: Hotel(),
            )),
    GetPage(name: Routes.bookhotel, page: () => const BookHotel()),
    GetPage(name: Routes.hotelroom, page: () => const TypeOfRoom()),
    GetPage(name: Routes.toreserve, page: () => const ViewHotelReserve()),
    GetPage(
        name: Routes.viewreserve,
        page: () => ViewSelectedReserve(
              reserveHotel: Reserve(),
            ))
  ];
}
