import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_project/controllers/hotel_controller.dart';

class TypeOfRoom extends StatefulWidget {
  //final int hotelId;
  const TypeOfRoom({super.key});

  @override
  State<TypeOfRoom> createState() => _TypeOfRoomState();
}

class _TypeOfRoomState extends State<TypeOfRoom> {
  HotelController hotelController = Get.put(HotelController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
