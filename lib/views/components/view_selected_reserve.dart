import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_project/controllers/hotel_controller.dart';
import 'package:hotel_project/models/hotel_model.dart';
import 'package:hotel_project/models/hotel_reserve_model.dart';
import 'package:hotel_project/services/stored_data.dart';
import 'package:table_calendar/table_calendar.dart';

class ViewSelectedReserve extends StatefulWidget {
  final Reserve reserveHotel;
  const ViewSelectedReserve({super.key, required this.reserveHotel});

  @override
  State<ViewSelectedReserve> createState() => _ViewSelectedReserveState();
}

class _ViewSelectedReserveState extends State<ViewSelectedReserve> {
  // Future<void> _refresh() {
  @override
  Widget build(BuildContext context) {
    HotelController hotelController = Get.put(HotelController());
    final List<Map<String, String>> reviews = [
      {
        'image': 'https://random.dog/e82e125b-94c4-4313-852d-6be6ae41da41.jpg',
        'name': 'Alexia Jane',
        'comment':
            'This is located in a great spot close to shops and bars, very quiet location.',
        'date': '21 May, 2019',
        'rating': '8.0',
      },
      {
        'image': 'https://random.dog/0ced6461-bfc4-4987-bf41-638f23ce21c2.jpg',
        'name': 'Jacky Depp',
        'comment':
            'Good staff, very comfortable bed, very quiet location. Place could do with an update.',
        'date': '21 May, 2019',
        'rating': '8.0',
      },
      {
        'image': 'https://random.dog/0415ca3e-0e99-4afa-bec6-bd8a4a7ff6ff.PNG',
        'name': 'Alex Carl',
        'comment':
            'This is located in a great spot close to shops and bars, very quiet location.',
        'date': '21 May, 2019',
        'rating': '8.0',
      },
      {
        'image': 'https://random.dog/f434f09a-0d75-443b-a0ed-e13d5b8703c3.jpg',
        'name': 'May June',
        'comment':
            'Good staff, very comfortable bed, very quiet location. Place could do with an update.',
        'date': '21 May, 2019',
        'rating': '8.0',
      },
    ];

    //var reserveHotel = Get.arguments;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blue,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        'https://generatorfun.com/code/uploads/Random-Hotel-image-1.jpg',
                        height: 275,
                        width: 450,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    const SizedBox(height: 8.0),
                    // Row(
                    //   children: [],
                    // ),
                    const SizedBox(height: 8.0),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.reserveHotel.hotelName.toString(),
                              style: const TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(widget.reserveHotel.hotelDesc.toString(),
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey[700],
                                ),
                                textAlign: TextAlign.justify),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.location_on,
                                    color: Colors.green),
                                Text(
                                  widget.reserveHotel.hotelAddress.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                const SizedBox(width: 8.0),
                              ],
                            ),
                            Text(
                              'Type of Room : ${widget.reserveHotel.hotelTypeRoom.toString()}',
                              style: const TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'Total Price : \$ ${widget.reserveHotel.totalPayment.toString()}',
                              style: const TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Status:",
                                  style: TextStyle(fontSize: 15.0),
                                ),
                                Text(
                                  widget.reserveHotel.reserveStatus.toString(),
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: widget.reserveHotel.reserveStatus ==
                                            'booked'
                                        ? Colors.green
                                        : widget.reserveHotel.reserveStatus ==
                                                'pending'
                                            ? const Color.fromARGB(
                                                255, 202, 183, 7)
                                            : Colors
                                                .red, // default or other statuses
                                  ),
                                ),
                                const SizedBox(
                                  width: 75.0,
                                ),
                                Text(
                                  '\$ ${widget.reserveHotel.hotelPrice.toString()} / per night',
                                  style: const TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Depart: ${DateTime.parse(widget.reserveHotel.dateDepart.toString()).toLocal().toString().split(' ')[0]}",
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 8.0,
                          width: 15.0,
                        ),
                        Text(
                          "Return: ${DateTime.parse(widget.reserveHotel.dateReturn.toString()).toLocal().toString().split(' ')[0]}",
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 400,
                      width: 500,
                      child: TableCalendar(
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: DateTime.now(),
                        rangeStartDay: DateTime.parse(DateTime.parse(
                                widget.reserveHotel.dateDepart.toString())
                            .toLocal()
                            .toString()
                            .split(' ')[0]),
                        rangeEndDay: DateTime.parse(DateTime.parse(
                                widget.reserveHotel.dateReturn.toString())
                            .toLocal()
                            .toString()
                            .split(' ')[0]),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                      width: 500.0,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                        ),
                        onPressed: () => hotelController.cancelBooked(
                            int.parse(dataStored.read("userid")),
                            widget.reserveHotel.reserveId!),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Reviews (${reviews.length})",
                          style: const TextStyle(
                              fontFamily: 'DMSerifDisplay', fontSize: 25.0),
                        ),
                        const SizedBox(
                          width: 125.0,
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            'Write a review',
                            style: TextStyle(
                                fontFamily: 'DMSerifDisplay',
                                fontSize: 15.5,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: reviews.length,
                        itemBuilder: (context, index) {
                          final review = reviews[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(review['image']!),
                                    radius: 24.0,
                                  ),
                                  const SizedBox(width: 16.0),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          review['name']!,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Text(
                                          'Last updated ${review['date']}',
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        const SizedBox(height: 8.0),
                                        Text(
                                          review['comment']!,
                                          style: const TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        const SizedBox(height: 8.0),
                                        Row(
                                          children: [
                                            Text(
                                              'Very good ${review['rating']}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                            const SizedBox(width: 4.0),
                                            const Icon(
                                              Icons.star,
                                              color: Colors.green,
                                              size: 16.0,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
