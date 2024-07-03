import 'package:flutter/material.dart';
import '../controllers/user_register_controller.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserRegister controller = Get.put(UserRegister());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 75.0,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 15.0),
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  fontFamily: 'PoestenOne',
                  fontSize: 50.0,
                ),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 150.0,
                  height: 50.0,
                  child: TextButton.icon(
                      icon: const Icon(Icons.facebook),
                      label: const Text(
                        'facebook',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {}),
                ),
                SizedBox(
                    width: 150.0,
                    height: 50.0,
                    child: TextButton.icon(
                      icon: const Icon(
                        Icons.tiktok,
                        color: Colors.black,
                      ),
                      label: const Text(
                        'Tiktok',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      onPressed: () {},
                    )),
              ],
            ),
            const SizedBox(
              height: 25.0,
            ),
            SizedBox(
              width: 365.0,
              height: 75.0,
              child: TextFormField(
                controller: controller.fNameController,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  labelText: 'First Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 365.0,
              height: 75.0,
              child: TextFormField(
                controller: controller.lNameController,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  labelText: 'Last Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 365.0,
              height: 75.0,
              child: TextFormField(
                controller: controller.userNameController,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 365.0,
              height: 75.0,
              child: TextFormField(
                controller: controller.passWordController,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            SizedBox(
                width: 300.0,
                height: 50.0,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.blue,
                        elevation: 5.0,
                        backgroundColor: Colors.lightBlueAccent),
                    onPressed: () => controller.userRegister(),
                    child: const Text('Sign Up',
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold)))),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.only(top: 25.0),
              child: const Text(
                'By Signing up, you agreed with our Terms of \n Services and Privacy Policy ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'DancingScript',
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 60.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Already have account? ',
                    style: TextStyle(fontFamily: 'Opensans', fontSize: 15.0),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                          fontFamily: 'Opensans',
                          fontSize: 15.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
