import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final List<String> imgList = [
  'assets/bryce-canyon-502026_1920.jpg',
  'assets/gateway-arch-67313_1920.jpg',
  'assets/lake-mcdonald-1733307_1920.jpg'
];
int currentPage = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/room-icn.png',
              width: 40.0,
              height: 175.0,
            ),
            const SizedBox(
              width: 10.0,
            ),
            const Text('Room',
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'PoestenOne',
                    color: Colors.black)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 250,
                  height: 50.0,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                SizedBox(
                  //height: 50.0,
                  width: 125.0,
                  height: 50.0,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.blue,
                          elevation: 5.0,
                          backgroundColor: Colors.lightBlueAccent),
                      onPressed: () {},
                      child: const Text(
                        'View Hotel',
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 25.0,
            ),
            CarouselSlider(
                items: imgList
                    .map((e) => Container(
                          //padding: const EdgeInsets.only(),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(e),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 500.0,
                              ),
                              buildCarouselIndicator(),
                            ],
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                    initialPage: 0,
                    autoPlay: true,
                    height: 550,
                    //enlargeCenterPage: true,
                    //enlargeFactor: 0.3,
                    autoPlayInterval: const Duration(seconds: 3),
                    reverse: false,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    onPageChanged: (value, _) {
                      setState(() {
                        currentPage = value;
                      });
                    })),
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
            height: i == currentPage ? 18 : 10,
            width: i == currentPage ? 18 : 10,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: i == currentPage
                    ? Colors.lightBlueAccent
                    : Colors.blueAccent,
                shape: BoxShape.circle),
          ),
      ],
    ),
  );
}
