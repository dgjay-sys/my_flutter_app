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
//navigation bar
int currentPageIndex = 0;
NavigationDestinationLabelBehavior labelBehavior =
    NavigationDestinationLabelBehavior.alwaysHide;

final List<Map<String, String>> locList = [
  {
    'title': 'Paris',
    'subtitle': 'Secondary Text 1',
    'image': 'assets/bryce-canyon-502026_1920.jpg',
    'perN': '180 ',
    'pen': "test"
  },
  {
    'title': 'America',
    'subtitle': 'Secondary Text 2',
    'image': 'assets/gateway-arch-67313_1920.jpg',
    'perN': '190',
    'pen': "test"
  },
  {
    'title': 'Australia',
    'subtitle': 'Secondary Text 2',
    'image': 'assets/lake-mcdonald-1733307_1920.jpg',
    'perN': '200',
    'pen': "test"
  },
  // Add more items here
];

final List<Map<String, String>> imageUrls = [
  {
    'image': 'https://random.dog/e82e125b-94c4-4313-852d-6be6ae41da41.jpg',
    'name': 'name 1',
    'comment': "Lorem ipsum dolor sit amet."
  },
  {
    'image': 'https://random.dog/0ced6461-bfc4-4987-bf41-638f23ce21c2.jpg',
    'name': 'name 2',
    'comment':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pretium pellentesque elit, ac elementum mi.'
  },
  {
    'image': 'https://random.dog/0415ca3e-0e99-4afa-bec6-bd8a4a7ff6ff.PNG',
    'name': 'name 3',
    'comment':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pretium pellentesque elit, ac elementum mi.'
  },
  {
    'image': 'https://random.dog/f434f09a-0d75-443b-a0ed-e13d5b8703c3.jpg',
    'name': 'name 4',
    'comment':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pretium pellentesque elit, ac elementum mi.'
  },
  {
    'image': 'https://random.dog/b3b20013-8bc5-40be-bafc-43fdabc18104.jpg',
    'name': 'name 5',
    'comment':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pretium pellentesque elit, ac elementum mi.'
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
            Container(
              margin: const EdgeInsets.only(left: 210.0),
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/profile.jpg'),
                radius: 20.0,
              ),
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
            SizedBox(
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
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 10.0),
              child: const Text(
                'Best Deals',
                style: TextStyle(
                    fontFamily: 'DMSerifDisplay',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 160.0,
              child: ListView.builder(
                itemCount: locList.length,
                itemBuilder: (context, index) {
                  final locItem = locList[index];
                  return Card(
                    color: Colors.grey[200],
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    clipBehavior: Clip.antiAlias,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset(
                              locItem['image'].toString(),
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Text(
                                  locItem['title'].toString(),
                                  style: const TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'DMSerifDisplay'),
                                ),
                                Text(
                                  locItem['subtitle'].toString(),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  height: 25.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          color: Colors.green,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 5),
                                        const Text('2 km to city'),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          "\$${locItem['perN'].toString()}",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 265.0,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/viewinfo',
                                            arguments: locItem);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.lightBlueAccent,
                                        shadowColor: Colors.black,
                                        elevation: 5.0,
                                      ),
                                      child: const Text(
                                        "View",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      )),
                                ),
                              ]))
                          // Column(
                          //   children: [
                          //     const SizedBox(height: 10),
                          //     Text(
                          //       locItem['title'].toString(),
                          //       style: const TextStyle(
                          //         fontSize: 20,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //     Text(
                          //       locItem['subtitle'].toString(),
                          //       style: const TextStyle(
                          //         color: Colors.grey,
                          //       ),
                          //     ),
                          //     Row(
                          //       mainAxisAlignment:
                          //           MainAxisAlignment.spaceBetween,
                          //       children: [
                          //         Row(
                          //           children: [
                          //             const Icon(
                          //               Icons.location_on,
                          //               color: Colors.green,
                          //               size: 20,
                          //             ),
                          //             const SizedBox(width: 5),
                          //             const Text('2 km to city'),
                          //             const SizedBox(
                          //               width: 10.0,
                          //             ),
                          //             Text(
                          //               "\$${locItem['perN'].toString()}",
                          //               style: const TextStyle(
                          //                 fontSize: 16,
                          //                 fontWeight: FontWeight.bold,
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ],
                          //     ),
                          //     const SizedBox(
                          //       height: 10.0,
                          //     ),
                          //     SizedBox(
                          //       width: 80.0,
                          //       child: ElevatedButton(
                          //           onPressed: () {
                          //             Navigator.pushNamed(context, '/viewinfo',
                          //                 arguments: locItem);
                          //           },
                          //           style: ElevatedButton.styleFrom(
                          //             backgroundColor: Colors.lightBlueAccent,
                          //             shadowColor: Colors.black,
                          //             elevation: 5.0,
                          //           ),
                          //           child: const Text(
                          //             "View",
                          //             style: TextStyle(
                          //               color: Colors.black,
                          //             ),
                          //           )),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              ),
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
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      for (int i = 0; i < imgList.length; i++)
        Container(
          height: i == currentPage ? 18 : 10,
          width: i == currentPage ? 18 : 10,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color:
                  i == currentPage ? Colors.lightBlueAccent : Colors.blueAccent,
              shape: BoxShape.circle),
        ),
    ],
  );
}
