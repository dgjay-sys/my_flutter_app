import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_project/controllers/hotel_controller.dart';

import 'package:hotel_project/services/stored_data.dart';

class TypeOfRoom extends StatefulWidget {
  //final int hotelId;
  const TypeOfRoom({super.key});

  @override
  State<TypeOfRoom> createState() => _TypeOfRoomState();
}

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
                controller: hotelController.roomImgUrlController,
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
                controller: hotelController.hotelRoomTypeController,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  labelText: 'Room Type',
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
                controller: hotelController.hotelRoomDescController,
                maxLines: 20,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  labelText: 'Room Description',
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
                controller: hotelController.hotelRoomPrice,
                maxLines: 3,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  labelText: 'Room Price',
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
                controller: hotelController.noAdController,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  labelText: 'No. Adult',
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
                controller: hotelController.noChController,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  labelText: 'No. Child',
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
                controller: hotelController.noRoomController,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  labelText: 'No. Room',
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
                      hotelController.addRooms(1);
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

Widget _buildFloatingActionButton(BuildContext context, HotelController room) {
  if (dataStored.read('role') == 'admin') {
    return FloatingActionButton(
      backgroundColor: const Color.fromARGB(255, 3, 138, 242),
      tooltip: 'Add Hotel',
      onPressed: () => showAddHotelDialog(context, room),
      child: const Icon(Icons.add, color: Colors.white, size: 28),
    );
  } else {
    return const SizedBox.shrink();
  }
}

class _TypeOfRoomState extends State<TypeOfRoom> {
  HotelController hotelController = Get.put(HotelController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          _buildFloatingActionButton(context, hotelController),
      appBar: AppBar(
        title: const Row(
          children: [
            // Expanded(
            //   flex: 1,
            //   child: Text(
            //     data['title']!,
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            // Expanded(
            //     flex: 0,
            //     child: IconButton(
            //       onPressed: () {},
            //       icon: const Icon(Icons.favorite_border),
            //     )),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: List.generate(hotelController.rooms.length, (index) {
                  final hotelroom = hotelController.rooms[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ClipRRect(
                          //   borderRadius: BorderRadius.circular(15.0),
                          //   child: Image.asset(
                          //     item['image'].toString(),
                          //     height: 200,
                          //     width: 500,
                          //     fit: BoxFit.cover,
                          //   ),
                          // ),
                          const SizedBox(width: 10),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        hotelroom.hotelRoomType.toString(),
                                        style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'DMSerifDisplay',
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "\$ ${hotelroom.hotelPrice.toString()} / per night",
                                        style: const TextStyle(
                                          //color: Colors.grey,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      const Text(
                                        "Sleeps, 3 people",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: 125,
                                        height: 40,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shadowColor: Colors.blue,
                                                elevation: 5.0,
                                                backgroundColor:
                                                    Colors.lightBlueAccent),
                                            onPressed: () {
                                              hotelController.showHotelInfo(
                                                  hotelroom.hotelId!);

                                              Navigator.pushNamed(
                                                context,
                                                '/bookhotel',
                                                arguments: {
                                                  'hotelId': hotelroom.hotelId!,
                                                  'roomtype': hotelroom
                                                      .hotelRoomType
                                                      .toString(),
                                                  'price': hotelroom.hotelPrice
                                                      .toString(),
                                                  'no_room': hotelroom.noRoom,
                                                  'adult': hotelroom.noAdult,
                                                  'child': hotelroom.noChild
                                                },
                                              );
                                            },
                                            child: const Text(
                                              'Book Now',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15.0),
                                            )),
                                      ),
                                      const SizedBox(height: 17),
                                      Container(
                                        padding: const EdgeInsets.all(5.0),
                                        child: InkWell(
                                            onTap: () {},
                                            child: const Text(
                                              'Room Detail',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13.0,
                                              ),
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
