import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/landing_bg_3.jpg'),
          fit: BoxFit.fitHeight,
        )),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 150.0,
            ),
            Center(
              child: Image.asset(
                'assets/room-icn.png',
                width: 150.0,
                height: 175.0,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5.0, right: 5.0, left: 5.0),
              child: Text(
                'Room',
                style: TextStyle(
                    fontSize: 50.0,
                    fontFamily: 'PoestenOne',
                    color: Colors.black),
              ),
            ),
            const Text(
              'best hotel deals for your holiday ',
              style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: 'DancingScript',
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            //button
            const SizedBox(
              height: 260.0,
            ),
            SizedBox(
                height: 50.0,
                width: 375.0,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlueAccent),
                    onPressed: () {
                      Get.offNamed('/started');
                    },
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ))),
            const Padding(
              padding: EdgeInsets.only(top: 30.0, left: 5.0, right: 5.0),
              child: InkWell(
                child: Text(
                  'Already have account? Log In',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
