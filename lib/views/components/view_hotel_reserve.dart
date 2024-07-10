import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hotel_project/controllers/hotel_controller.dart';

class ViewHotelReserve extends StatefulWidget {
  const ViewHotelReserve({super.key});

  @override
  State<ViewHotelReserve> createState() => _ViewHotelReserveState();
}

class _ViewHotelReserveState extends State<ViewHotelReserve> {
  @override
  Widget build(BuildContext context) {
    HotelController hotelController = Get.put(HotelController());

    var reserveHotelInfo = hotelController.reservedHotel;

    //print(reserveHotelInfo);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: List.generate(reserveHotelInfo.length, (index) {
              final reserveHotel = reserveHotelInfo[index];
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    reserveHotel.hotelName.toString(),
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'DMSerifDisplay',
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Room type : ${reserveHotel.hotelTypeRoom}",
                                    style: const TextStyle(
                                      //color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    " \$ ${reserveHotel.hotelPrice.toString()} / per night",
                                    style: const TextStyle(
                                      //color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Sleeps, ${addingPerson(int.parse(reserveHotel.noAdult.toString()), int.parse(reserveHotel.noChild.toString()))} people",
                                    style: const TextStyle(
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
                              margin: const EdgeInsets.only(top: 60.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 112,
                                    height: 40,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shadowColor: Colors.blue,
                                            elevation: 5.0,
                                            backgroundColor:
                                                Colors.lightBlueAccent),
                                        onPressed: () {
                                          // hotelController.showHotelInfo(
                                          //     reserveHotel.hotelId!);

                                          // Navigator.pushNamed(
                                          //   context,
                                          //   '/bookhotel',
                                          //   arguments: {
                                          //     'hotelId': reserveHotel.hotelId!,
                                          //     'roomtype': reserveHotel
                                          //         .hotelRoomType
                                          //         .toString(),
                                          //     'price': reserveHotel.hotelPrice
                                          //         .toString(),
                                          //     'no_room': reserveHotel.noRoom,
                                          //     'adult': reserveHotel.noAdult,
                                          //     'child': reserveHotel.noChild
                                          //   },
                                          // );
                                        },
                                        child: const Text(
                                          'Other Info',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.0),
                                        )),
                                  ),
                                  // const SizedBox(height: 17),
                                  // Container(
                                  //   padding: const EdgeInsets.all(5.0),
                                  //   child: InkWell(
                                  //       onTap: () {},
                                  //       child: const Text(
                                  //         'Room Detail',
                                  //         style: TextStyle(
                                  //           color: Colors.grey,
                                  //           fontSize: 13.0,
                                  //         ),
                                  //       )),
                                  // )
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
      ),
    );
  }
}

// functions
int addingPerson(int ad, int ch) {
  return ad + ch;
}
