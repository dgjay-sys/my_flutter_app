import 'package:flutter/material.dart';
import 'package:hotel_project/controllers/hotel_controller.dart';
import 'package:hotel_project/services/stored_data.dart';
//import 'package:hotel_project/models/hotel_model.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:get/get.dart';

class BookHotel extends StatefulWidget {
  const BookHotel({super.key});

  @override
  State<BookHotel> createState() => _BookHotelState();
}

class _BookHotelState extends State<BookHotel> {
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
    {
      'image': 'https://random.dog/e82e125b-94c4-4313-852d-6be6ae41da41.jpg',
      'name': 'Alex Jose',
      'comment':
          'This is located in a great spot close to shops and bars, very quiet location.',
      'date': '31 May, 2024',
      'rating': '8.0',
    },
  ];

  //for date
  DateTime selectedDate = DateTime.now();
  DateTime selectedDateEnd = DateTime.now();

  //for filtering
  var adultCounter = 0;
  var roomCounter = 0;
  var childrenCounter = 0;

  //for total days in book
  late int days;

  //total payment
  late int totalPayment;

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  int getTotalBook(int pPerNight, int stayDay) {
    return pPerNight * stayDay;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        // print(selectedDate.toLocal().toString().split(' ')[0]);
      });
    }
  }

  Future<void> _selectDateEnd(BuildContext context) async {
    final DateTime? pickedEnd = await showDatePicker(
      context: context,
      initialDate: selectedDateEnd,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedEnd != null && pickedEnd != selectedDateEnd) {
      setState(() {
        selectedDateEnd = pickedEnd;
        //print(selectedDateEnd.toLocal().toString().split(' ')[0]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    HotelController hotelController = Get.put(HotelController());
    final data = Get.arguments;
    if (data == null) {
      return const Scaffold(
        body: Center(
          child: Text('No data available'),
        ),
      );
    }
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: hotelController.hotelInfo.length,
            itemBuilder: (context, index) {
              final hotelinfo = hotelController.hotelInfo[index];
              // return Column(
              //   children: [Text(item.hotelId.toString())],
              // );
              return Container(
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hotelinfo.hotelName.toString(),
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.green),
                        const SizedBox(width: 4.0),
                        Text(
                          hotelinfo.hotelDesc.toString(),
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          '3 km to city',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Text(
                          '\$ ${data['price'].toString()} / per night',
                          style: const TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () => _selectDate(context),
                          child: Text(
                            "Depart: ${selectedDate.toLocal().toString().split(' ')[0]}",
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        TextButton(
                          onPressed: () => _selectDateEnd(context),
                          child: Text(
                            "Return: ${selectedDateEnd.toLocal().toString().split(' ')[0]}",
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        IconButton(
                          icon: const Icon(Icons.tune_outlined),
                          onPressed: () async {
                            await showDialog(
                                context: context,
                                builder: (context) {
                                  return StatefulBuilder(
                                      builder: (context, setState) {
                                    return AlertDialog(
                                      title: const Text('Travel Date'),
                                      content: SizedBox(
                                          height: 150,
                                          width: 300,
                                          child: Column(
                                            children: [
                                              Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    const Text(
                                                        'Number of Rooms: '),
                                                    IconButton(
                                                      icon: const Icon(Icons
                                                          .arrow_back_ios_new),
                                                      onPressed: () =>
                                                          setState(() {
                                                        roomCounter -= 1;
                                                        if (roomCounter <= 0) {
                                                          roomCounter = 0;
                                                        }
                                                      }),
                                                    ),
                                                    Text(data['no_room']
                                                        .toString()),
                                                    IconButton(
                                                      icon: const Icon(Icons
                                                          .arrow_forward_ios),
                                                      onPressed: () =>
                                                          setState(() {
                                                        roomCounter += 1;
                                                      }),
                                                    ),
                                                  ]),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const Text('Adult'),
                                                  const SizedBox(
                                                    width: 90,
                                                  ),
                                                  IconButton(
                                                    icon: const Icon(Icons
                                                        .arrow_back_ios_new),
                                                    onPressed: () =>
                                                        setState(() {
                                                      adultCounter -= 1;
                                                      if (adultCounter <= 0) {
                                                        adultCounter = 0;
                                                      }
                                                    }),
                                                  ),
                                                  Text(adultCounter.toString()),
                                                  IconButton(
                                                    icon: const Icon(Icons
                                                        .arrow_forward_ios),
                                                    onPressed: () =>
                                                        setState(() {
                                                      adultCounter += 1;
                                                    }),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const Text('Children'),
                                                  const SizedBox(
                                                    width: 70,
                                                  ),
                                                  IconButton(
                                                    icon: const Icon(Icons
                                                        .arrow_back_ios_new),
                                                    onPressed: () =>
                                                        setState(() {
                                                      childrenCounter -= 1;
                                                      if (childrenCounter <=
                                                          0) {
                                                        childrenCounter = 0;
                                                      }
                                                    }),
                                                  ),
                                                  Text(childrenCounter
                                                      .toString()),
                                                  IconButton(
                                                    icon: const Icon(Icons
                                                        .arrow_forward_ios),
                                                    onPressed: () =>
                                                        setState(() {
                                                      childrenCounter += 1;
                                                    }),
                                                  )
                                                ],
                                              )
                                            ],
                                          )),
                                      actions: [
                                        SizedBox(
                                          width: 300,
                                          height: 50,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.teal,
                                              ),
                                              onPressed: () {},
                                              child: const Text(
                                                'Continue',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                        )
                                      ],
                                    );
                                  });
                                });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            //padding: const EdgeInsets.symmetric(vertical: 3.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 400,
                      width: 500,
                      child: TableCalendar(
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: DateTime.parse(selectedDate.toString()),
                        rangeStartDay: DateTime.parse(selectedDate.toString()),
                        rangeEndDay: DateTime.parse(selectedDateEnd.toString()),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () async {
                        days = daysBetween(selectedDate, selectedDateEnd);
                        totalPayment = getTotalBook(
                            int.parse(data['price'].toString()), days);
                        await showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                  builder: (context, setState) {
                                return AlertDialog(
                                  title: const Text(
                                    'Travel Information',
                                    style: TextStyle(
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 3.0),
                                    textAlign: TextAlign.center,
                                  ),
                                  content: SizedBox(
                                      height: 310,
                                      width: 300,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Room type: ${data['roomtype']}',
                                            style: const TextStyle(
                                              fontFamily: 'OpenSans',
                                              fontSize: 18.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 80.0,
                                                height: 100.0,
                                                margin:
                                                    const EdgeInsets.all(3.0),
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[50],
                                                    border: Border.all(
                                                        color: Colors.teal),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Colors.teal,
                                                        blurRadius: 2,
                                                        offset: Offset(1,
                                                            2), // Shadow position
                                                      ),
                                                    ]),
                                                child: Column(
                                                  children: [
                                                    const Icon(
                                                      Icons.king_bed_outlined,
                                                      size: 40.0,
                                                    ),
                                                    const Text(
                                                      'Room',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'OpenSans',
                                                          fontSize: 18.0,
                                                          letterSpacing: 2.0),
                                                    ),
                                                    Text(
                                                      data['no_room']
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontFamily:
                                                              'OpenSans',
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 100.0,
                                                margin:
                                                    const EdgeInsets.all(3.0),
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[50],
                                                    border: Border.all(
                                                        color: Colors.teal),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Colors.teal,
                                                        blurRadius: 2,
                                                        offset: Offset(1,
                                                            2), // Shadow position
                                                      ),
                                                    ]),
                                                child: Column(
                                                  children: [
                                                    const Icon(
                                                      Icons.face,
                                                      size: 40,
                                                    ),
                                                    const Text('Adult',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'OpenSans',
                                                            fontSize: 18.0,
                                                            letterSpacing:
                                                                2.0)),
                                                    Text(
                                                        data['adult']
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                'OpenSans',
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 100.0,
                                                height: 100.0,
                                                margin:
                                                    const EdgeInsets.all(3.0),
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[50],
                                                    border: Border.all(
                                                        color: Colors.teal),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Colors.teal,
                                                        blurRadius: 2,
                                                        offset: Offset(1,
                                                            2), // Shadow position
                                                      ),
                                                    ]),
                                                child: Column(
                                                  children: [
                                                    const Icon(
                                                      Icons.child_care,
                                                      size: 40.0,
                                                    ),
                                                    const Text('Children',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'OpenSans',
                                                            fontSize: 18.0,
                                                            letterSpacing:
                                                                2.0)),
                                                    Text(
                                                        data['child']
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                'OpenSans',
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20.0,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 100.0,
                                                height: 100.0,
                                                margin:
                                                    const EdgeInsets.all(3.0),
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[50],
                                                    border: Border.all(
                                                        color: Colors.teal),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Colors.teal,
                                                        blurRadius: 2,
                                                        offset: Offset(1,
                                                            2), // Shadow position
                                                      ),
                                                    ]),
                                                child: Column(
                                                  children: [
                                                    const Icon(
                                                      Icons.departure_board,
                                                      size: 40.0,
                                                    ),
                                                    const Text(
                                                      'Depart',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'OpenSans',
                                                          fontSize: 18.0,
                                                          letterSpacing: 2.0),
                                                    ),
                                                    Text(
                                                        selectedDate
                                                            .toLocal()
                                                            .toString()
                                                            .split(' ')[0],
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                'OpenSans',
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 100.0,
                                                height: 100.0,
                                                margin:
                                                    const EdgeInsets.all(3.0),
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[50],
                                                    border: Border.all(
                                                        color: Colors.teal),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Colors.teal,
                                                        blurRadius: 2,
                                                        offset: Offset(1,
                                                            2), // Shadow position
                                                      ),
                                                    ]),
                                                child: Column(
                                                  children: [
                                                    const Icon(
                                                      Icons.arrow_back_ios_new,
                                                      size: 40.0,
                                                    ),
                                                    const Text(
                                                      'Return',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'OpenSans',
                                                          fontSize: 18.0,
                                                          letterSpacing: 2.0),
                                                    ),
                                                    Text(
                                                        selectedDateEnd
                                                            .toLocal()
                                                            .toString()
                                                            .split(' ')[0],
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                'OpenSans',
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 60.0,
                                                height: 100.0,
                                                margin:
                                                    const EdgeInsets.all(3.0),
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[50],
                                                    border: Border.all(
                                                        color: Colors.teal),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Colors.teal,
                                                        blurRadius: 2,
                                                        offset: Offset(1,
                                                            2), // Shadow position
                                                      ),
                                                    ]),
                                                child: Column(
                                                  children: [
                                                    const Icon(
                                                        Icons.calendar_today,
                                                        size: 40.0),
                                                    const Text('Days',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'OpenSans',
                                                            fontSize: 18.0,
                                                            letterSpacing:
                                                                2.0)),
                                                    Text(days.toString(),
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                'OpenSans',
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15.0,
                                          ),
                                          Center(
                                            child: Text(
                                                'Total = \$$totalPayment',
                                                style: const TextStyle(
                                                    fontFamily: 'OpenSans',
                                                    fontSize: 18.0,
                                                    letterSpacing: 2.0)),
                                          )
                                        ],
                                      )),
                                  actions: [
                                    SizedBox(
                                      width: 300,
                                      height: 50,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.teal,
                                          ),
                                          onPressed: () => {
                                                hotelController.addHotelReserv(
                                                    int.parse(hotelinfo.hotelId
                                                        .toString()),
                                                    int.parse(dataStored
                                                        .read('userid')
                                                        .toString()),
                                                    hotelinfo.hotelName
                                                        .toString(),
                                                    data["roomtype"].toString(),
                                                    selectedDate
                                                        .toLocal()
                                                        .toString()
                                                        .split(' ')[0],
                                                    selectedDateEnd
                                                        .toLocal()
                                                        .toString()
                                                        .split(' ')[0],
                                                    totalPayment),
                                                Get.offAllNamed('/home')
                                              },
                                          child: const Text(
                                            'Continue',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    )
                                  ],
                                );
                              });
                            });
                        // Navigator.pushNamed(context, '/booknow', arguments: data);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Apply',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
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
              );
            },
          ),
        ],
      ),
    ));
  }
}
