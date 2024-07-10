import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_project/controllers/user_controller.dart';
//import 'package:hotel_project/services/data_storage.dart';
import '../services/stored_data.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.only(top: 150.0),
              child: Row(
                //mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/get_started_image_2.png'),
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
            const SizedBox(
              height: 50.0,
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
                      'User Id',
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: 'PoestenOne',
                          fontSize: 18.0 // Text color
                          ),
                    ),
                    const SizedBox(
                        width: 265.0), // Spacing between text and icon
                    Text(
                      dataStored.read('userid').toString(),
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
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => Dialog(
                    insetPadding: const EdgeInsets.all(0.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(height: 15),
                          const Text('Update your First Name?'),
                          const SizedBox(height: 15),
                          SizedBox(
                            width: 370.0,
                            height: 60.0,
                            child: TextFormField(
                              // controller: ,
                              enabled: false,
                              initialValue: dataStored.read('fname').toString(),
                              decoration: InputDecoration(
                                labelStyle: const TextStyle(
                                  color: Colors.black45,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                labelText: 'Old First Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            width: 370.0,
                            height: 60.0,
                            child: TextFormField(
                              controller: userController.fNameController,
                              decoration: InputDecoration(
                                labelStyle: const TextStyle(
                                  color: Colors.black45,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                labelText: 'New First Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Close'),
                              ),
                              const SizedBox(height: 15),
                              TextButton(
                                onPressed: () => userController.updateUserFname(
                                    int.parse(
                                        dataStored.read('userid').toString())),
                                child: const Text('Update'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
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
                    const SizedBox(
                        width: 207.0), // Spacing between text and icon
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
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => Dialog(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(height: 15),
                          const Text('Update your Last Name?'),
                          const SizedBox(height: 15),
                          SizedBox(
                            width: 370.0,
                            height: 60.0,
                            child: TextFormField(
                              // controller: ,
                              enabled: false,
                              initialValue: dataStored.read('lname').toString(),
                              decoration: InputDecoration(
                                labelStyle: const TextStyle(
                                  color: Colors.black45,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                labelText: 'Old Last Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            width: 370.0,
                            height: 60.0,
                            child: TextFormField(
                              controller: userController.lNameController,
                              decoration: InputDecoration(
                                labelStyle: const TextStyle(
                                  color: Colors.black45,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                labelText: 'New Last Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: () => {
                                  userController.updateUserLname(int.parse(
                                      dataStored.read('userid').toString())),
                                  Navigator.pop(context)
                                },
                                child: const Text('Close'),
                              ),
                              const SizedBox(height: 15),
                              TextButton(
                                onPressed: () => {
                                  userController.updateUserLname(int.parse(
                                      dataStored.read('userid').toString())),
                                  Navigator.pop(context)
                                },
                                child: const Text('Update'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
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
                    const SizedBox(
                        width: 237.0), // Spacing between text and icon
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
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => Dialog(
                    insetPadding: const EdgeInsets.all(0.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(height: 15),
                          const Text('Update your First Name?'),
                          const SizedBox(height: 15),
                          SizedBox(
                            width: 370.0,
                            height: 60.0,
                            child: TextFormField(
                              // controller: ,
                              enabled: false,
                              initialValue:
                                  dataStored.read('username').toString(),
                              decoration: InputDecoration(
                                labelStyle: const TextStyle(
                                  color: Colors.black45,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                labelText: 'Old Username',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            width: 370.0,
                            height: 60.0,
                            child: TextFormField(
                              controller: userController.userNameController,
                              decoration: InputDecoration(
                                labelStyle: const TextStyle(
                                  color: Colors.black45,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                labelText: 'New Username',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Close'),
                              ),
                              const SizedBox(height: 15),
                              TextButton(
                                onPressed: () => {
                                  userController.updateUsername(int.parse(
                                      dataStored.read('userid').toString())),
                                  Navigator.pop(context)
                                },
                                child: const Text('Update'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
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
                    const SizedBox(
                        width: 200.0), // Spacing between text and icon
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
            const Divider(
              color: Colors.grey, // Line color
              height: 3, // Space around the divider
              thickness: 1,
              endIndent: 30,
              indent: 30, // Line thickness
            ),
          ],
        ),
      ),
    );
  }
}
