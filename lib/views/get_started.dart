import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

int currentPage = 0;

String label = "Place your Trips";
String desc = "Book One of our unique hotel to \n escape the ordinary";

final List<String> imgList = [
  'assets/get_started_image_3.png',
  'assets/get_started_image_2.png',
];

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 100.0,
            ),
            CarouselSlider(
                items: imgList
                    .map((e) => Container(
                          child: Center(
                            child: Image.asset(e),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                    initialPage: 0,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    onPageChanged: (value, _) {
                      setState(() {
                        currentPage = value;

                        if (currentPage == 0) {
                          label = "Place your Trips";
                          desc =
                              "Book one of our unique hotel to \n escape the ordinary";
                        } else {
                          label = "Find best deals";
                          desc =
                              "Find deals for any season from cosy \n country homes to city flats";
                        }
                      });
                    })),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                label,
                style: const TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 18.0,
            ),
            Text(
              desc,
              style: const TextStyle(
                  fontSize: 23.0,
                  fontFamily: 'DancingScript',
                  fontWeight: FontWeight.bold,
                  color: Colors.black45),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 100.0,
            ),
            SizedBox(
              height: 50.0,
              width: 325.0,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.blue,
                      elevation: 5.0,
                      backgroundColor: Colors.lightBlueAccent),
                  onPressed: () {
                    Get.toNamed('/login');
                  },
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            const SizedBox(
              height: 15.0,
            ),
            SizedBox(
                height: 50.0,
                width: 325.0,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.black,
                      elevation: 5.0,
                    ),
                    onPressed: () {
                      Get.toNamed('/register');
                    },
                    child: const Text('Create Account',
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold))))
          ],
        ),
      ),
    );
  }
}

buildCarouselIndicator() {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < imgList.length; i++)
          Container(
            height: i == currentPage ? 7 : 5,
            width: i == currentPage ? 7 : 5,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: i == currentPage ? Colors.black : Colors.grey,
                shape: BoxShape.circle),
          ),
      ],
    ),
  );
}
