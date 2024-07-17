import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:hotel_project/controllers/hotel_controller.dart';
import 'package:hotel_project/controllers/user_controller.dart';
import 'package:hotel_project/services/stored_data.dart';
//import '../services/stored_data.dart';
import 'components/view_hotel.dart';

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
int currentPage = 0;

void showAddHotelDialog(BuildContext context, HotelController hotelController) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => Dialog.fullscreen(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Text('This is a fullscreen dialog.'),
            Container(
              width: 370.0,
              height: 60.0,
              margin: const EdgeInsets.all(5.0),
              child: TextFormField(
                controller: hotelController.imgUrlController,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  labelText: 'Image Url',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Container(
              width: 370.0,
              height: 60.0,
              margin: const EdgeInsets.all(5.0),
              child: TextFormField(
                controller: hotelController.hotelNameController,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  labelText: 'Hotel Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Container(
              width: 370.0,
              height: 150.0,
              margin: const EdgeInsets.all(5.0),
              child: TextFormField(
                controller: hotelController.hotelDescController,
                maxLines: 20,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  labelText: 'Hotel Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Container(
              width: 370.0,
              height: 60.0,
              margin: const EdgeInsets.all(5.0),
              child: TextFormField(
                controller: hotelController.hotelAddController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  labelText: 'Hotel Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Container(
              width: 370.0,
              height: 60.0,
              margin: const EdgeInsets.all(5.0),
              child: TextFormField(
                controller: hotelController.hotelEmailController,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  labelText: 'Hotel Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Container(
              width: 370.0,
              height: 60.0,
              margin: const EdgeInsets.all(5.0),
              child: TextFormField(
                controller: hotelController.hotelSPriceController,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  labelText: 'Starting Price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150.0,
                  child: ElevatedButton(
                    onPressed: () {
                      //Navigator.pop(context);
                      hotelController.addHotels();
                    },
                    child: const Text('Add'),
                  ),
                ),
                SizedBox(
                  width: 150.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Close'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildFloatingActionButton(
    BuildContext context, HotelController hotelController) {
  if (dataStored.read('role') == 'admin') {
    return FloatingActionButton(
      backgroundColor: const Color.fromARGB(255, 3, 138, 242),
      tooltip: 'Add Hotel',
      onPressed: () => showAddHotelDialog(context, hotelController),
      child: const Icon(Icons.add, color: Colors.white, size: 28),
    );
  } else {
    return const SizedBox.shrink();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    HotelController hotelController = Get.put(HotelController());

    return Scaffold(
      floatingActionButton:
          _buildFloatingActionButton(context, hotelController),
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
            //Text(dataStored.read('token').toString()),
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
                child: Obx(
                  () => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: userController.users.length,
                    itemBuilder: (context, index) {
                      final user = userController.users[index];
                      return Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(3.0),
                            child: CircleAvatar(
                              radius: 40, // Adjust the radius as needed
                              backgroundImage: NetworkImage(
                                  'https://random.dog/b3b20013-8bc5-40be-bafc-43fdabc18104.jpg'),
                            ),
                          ),
                          Text(
                            user.fname.toString(),
                            style: const TextStyle(
                                fontSize: 15, color: Colors.black),
                          )
                        ],
                      );
                    },
                  ),
                )),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: List.generate(hotelController.hotels.length, (index) {
                  final hotel = hotelController.hotels[index];
                  return Card(
                    child: InkWell(
                      onTap: () {
                        Get.to(() => ViewHotel(hotel: hotel));

                        //print(hotel.imageUrl);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ClipRRect(
                            //   borderRadius: BorderRadius.circular(15.0),
                            //   child: Image.network(
                            //     hotel.imageUrl.toString(),
                            //     height: 200,
                            //     width: 150,
                            //     fit: BoxFit.cover,
                            //   ),
                            //   // child: Image.asset(
                            //   //   hotel['image'].toString(),
                            //   //   height: 125,
                            //   //   width: 150,
                            //   //   fit: BoxFit.cover,
                            //   // ),
                            // ),

                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    hotel.hotelName.toString(),
                                    style: const TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'DMSerifDisplay',
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    hotel.hotelDesc.toString(),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: Colors.green,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      const Text('2 km to city'),
                                      const SizedBox(width: 10),
                                      Text(
                                        "\$${hotel.hotelStartingPrice.toString()}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
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
                //Navigator.pushNamed(context, '/getstarted');
              } else if (currentPageIndex == 2) {
                Get.toNamed('/settings');
              } else {
                //Navigator.pushNamed(context, '/home');
                Get.toNamed('/home');
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
