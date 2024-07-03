import 'package:flutter/material.dart';
import 'package:hotel_project/services/data_storage.dart';
import '../services/stored_data.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({super.key});

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
                      "${dataStored.read('fname').toString()} ${dataStored.read('lname').toString()}",
                      style: const TextStyle(
                          fontFamily: 'PoestenOne', fontSize: 15.0),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
                      child: InkWell(
                        child: Text(
                          'View and edit profile',
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 12.0,
                              color: Colors.black45,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 500,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero))),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'First Name',
                    style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'PoestenOne',
                        fontSize: 18.0 // Text color
                        ),
                  ),
                  const SizedBox(width: 200.0), // Spacing between text and icon
                  Text(
                    dataStored.read('fname').toString(),
                    style: const TextStyle(
                        color: Colors.black54,
                        fontFamily: 'PoestenOne',
                        fontSize: 15.0 // Text color
                        ),
                  )
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
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Last Name',
                    style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'PoestenOne',
                        fontSize: 18.0 // Text color
                        ),
                  ),
                  const SizedBox(width: 200.0), // Spacing between text and icon
                  Text(
                    dataStored.read('lname').toString(),
                    style: const TextStyle(
                        color: Colors.black54,
                        fontFamily: 'PoestenOne',
                        fontSize: 15.0 // Text color
                        ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 500,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero))),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Username',
                    style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'PoestenOne',
                        fontSize: 18.0 // Text color
                        ),
                  ),
                  const SizedBox(width: 200.0), // Spacing between text and icon
                  Text(
                    dataStored.read('username').toString(),
                    style: const TextStyle(
                        color: Colors.black54,
                        fontFamily: 'PoestenOne',
                        fontSize: 15.0 // Text color
                        ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
