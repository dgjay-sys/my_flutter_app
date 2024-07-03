import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/stored_data.dart';

class SettingProfile extends StatelessWidget {
  const SettingProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.only(top: 150.0),
            child: Row(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/get_started_image_2.png'),
                  radius: 55.0,
                ),
                Column(
                  children: [
                    Text(
                      dataStored.read('fname').toString(),
                      style: const TextStyle(
                          fontFamily: 'PoestenOne', fontSize: 30.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, left: 5.0, right: 5.0),
                      child: InkWell(
                        child: const Text(
                          'View and edit profile',
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 12.0,
                              color: Colors.black45,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Get.offAllNamed('/userinfo');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          SizedBox(
            width: 500,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero))),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Change Password',
                    style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'PoestenOne',
                        fontSize: 18.0 // Text color
                        ),
                  ),
                  SizedBox(width: 150.0), // Spacing between text and icon
                  Icon(
                    Icons.lock,
                    color: Colors.black45,
                    size: 30.0, // Icon color
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.grey, // Line color
            height: 3, // Space around the divider
            thickness: 1,
            endIndent: 30,
            indent: 30, // Line thickness
          ),
          SizedBox(
            width: 500,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero))),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Invite Friends',
                    style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'PoestenOne',
                        fontSize: 18.0 // Text color
                        ),
                  ),
                  SizedBox(width: 186.0), // Spacing between text and icon
                  Icon(
                    Icons.person,
                    color: Colors.black45,
                    size: 30.0, // Icon color
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.grey, // Line color
            height: 3, // Space around the divider
            thickness: 1,
            endIndent: 30.0,
            indent: 30.0, // Line thickness
          ),
          SizedBox(
            width: 500,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero))),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Credits & Coupons',
                    style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'PoestenOne',
                        fontSize: 18.0 // Text color
                        ),
                  ),
                  SizedBox(width: 145.0), // Spacing between text and icon
                  Icon(
                    Icons.card_giftcard,
                    color: Colors.black45,
                    size: 30.0, // Icon color
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.grey, // Line color
            height: 3, // Space around the divider
            thickness: 1,
            indent: 30.0,
            endIndent: 30.0, // Line thickness
          ),
          SizedBox(
            width: 500,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero))),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Help Center',
                    style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'PoestenOne',
                        fontSize: 18.0 // Text color
                        ),
                  ),
                  SizedBox(width: 200.0), // Spacing between text and icon
                  Icon(Icons.help_center,
                      color: Colors.black45, size: 30.0 // Icon color
                      ),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.grey, // Line color
            height: 3, // Space around the divider
            thickness: 1,
            indent: 30.0,
            endIndent: 30.0, // Line thickness
          ),
          SizedBox(
            width: 500,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero))),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Payment',
                    style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'PoestenOne',
                        fontSize: 18.0 // Text color
                        ),
                  ),
                  SizedBox(width: 220.0), // Spacing between text and icon
                  Icon(
                    Icons.payment,
                    color: Colors.black45,
                    size: 30.0, // Icon color
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.grey, // Line color
            height: 3, // Space around the divider
            thickness: 1,
            endIndent: 30.0,
            indent: 30.0, // Line thickness
          ),
          SizedBox(
            width: 500,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero))),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Settings',
                    style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'PoestenOne',
                        fontSize: 18.0 // Text color
                        ),
                  ),
                  SizedBox(width: 225.0), // Spacing between text and icon
                  Icon(
                    Icons.settings,
                    color: Colors.black45,
                    size: 30.0, // Icon color
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
