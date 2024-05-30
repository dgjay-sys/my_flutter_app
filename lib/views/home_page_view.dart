import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';

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
//navigation bar
int currentPageIndex = 0;
NavigationDestinationLabelBehavior labelBehavior =
    NavigationDestinationLabelBehavior.alwaysHide;

final List<Map<String, String>> locList = [
  {
    'title': 'Paris',
    'subtitle': 'Secondary Text 1',
    'image': 'assets/bryce-canyon-502026_1920.jpg'
  },
  {
    'title': 'America',
    'subtitle': 'Secondary Text 2',
    'image': 'assets/gateway-arch-67313_1920.jpg'
  },
  {
    'title': 'Australia',
    'subtitle': 'Secondary Text 2',
    'image': 'assets/lake-mcdonald-1733307_1920.jpg'
  },
  // Add more items here
];

final List<Map<String, String>> imageUrls = [
  {
    'image': 'https://random.dog/e82e125b-94c4-4313-852d-6be6ae41da41.jpg',
    'name': 'name 1',
  },
  {
    'image': 'https://random.dog/0ced6461-bfc4-4987-bf41-638f23ce21c2.jpg',
    'name': 'name 2',
  },
  {
    'image': 'https://random.dog/0415ca3e-0e99-4afa-bec6-bd8a4a7ff6ff.PNG',
    'name': 'name 3',
  },
  {
    'image': 'https://random.dog/f434f09a-0d75-443b-a0ed-e13d5b8703c3.jpg',
    'name': 'name 4',
  },
  {
    'image': 'https://random.dog/b3b20013-8bc5-40be-bafc-43fdabc18104.jpg',
    'name': 'name 5',
  },
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
              width: 15.0,
            ),
            const Text('Room',
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'PoestenOne',
                    color: Colors.black)),
            const SizedBox(
              width: 210.0,
            ),
            const CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'),
              radius: 30.0,
            ),
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
                  width: 325,
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
                  width: 5.0,
                ),
                SizedBox(
                  //height: 50.0,
                  width: 55.0,
                  height: 50.0,
                  child: IconButton(
                    icon: const Icon(Icons.search),
                    color: Colors.white,
                    onPressed: () {},
                    style: IconButton.styleFrom(
                        backgroundColor: Colors.blueAccent),
                  ),
                ),
              ],
            ),
            Container(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  final personInfo = imageUrls[index];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: CircleAvatar(
                          radius: 40, // Adjust the radius as needed
                          backgroundImage:
                              NetworkImage(personInfo['image'].toString()),
                        ),
                      ),
                      Text(personInfo['name'].toString())
                    ],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 2.0,
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
                                height: 375.0,
                              ),
                              buildCarouselIndicator(),
                            ],
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                    initialPage: 0,
                    autoPlay: true,
                    height: 425,
                    autoPlayInterval: const Duration(seconds: 5),
                    reverse: false,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    onPageChanged: (value, _) {
                      setState(() {
                        currentPage = value;
                      });
                    })),
            const SizedBox(
              height: 15.0,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 10.0),
              child: const Text(
                'Popular Destination',
                style: TextStyle(
                    fontFamily: 'DMSerifDisplay',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 236,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: locList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final locitem = locList[index];
                    return SizedBox(
                      width: 350,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage(locitem['image'].toString()))),
                          child: ListTile(
                            //leading: const Icon(Icons.arrow_drop_down_circle),
                            title: Text(
                              locitem['title']!,
                              style: const TextStyle(
                                  fontFamily: 'DMSerifDisplay',
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            onTap: () {},
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
          labelBehavior: labelBehavior,
          selectedIndex: currentPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
              if (currentPageIndex == 1) {
                Navigator.pushNamed(context, '/getstarted');
                print(currentPageIndex);
              } else if (currentPageIndex == 2) {
                Navigator.pushNamed(context, '/profile');
              } else {
                Navigator.pushNamed(context, '/home');
              }
            });
          },
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.explore),
              icon: Icon(Icons.explore_outlined),
              label: 'Explore',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.favorite),
              icon: Icon(Icons.favorite_border_outlined),
              label: 'Favorites',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.manage_accounts),
              icon: Icon(Icons.manage_accounts_outlined),
              label: 'Accounts',
            ),
          ]),
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
