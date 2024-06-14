import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TypeOfRoom extends StatefulWidget {
  const TypeOfRoom({super.key});

  @override
  State<TypeOfRoom> createState() => _TypeOfRoomState();
}

class _TypeOfRoomState extends State<TypeOfRoom> {
  final List<Map<String, String>> locList = [
    {
      'title': 'Deluxe Room',
      'subtitle': 'Secondary Text 1',
      'image': 'assets/bryce-canyon-502026_1920.jpg',
      'perN': '180 ',
      'pen': "test"
    },
    {
      'title': 'Premium Room',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
                flex: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back),
                )),
            const Expanded(
              flex: 2,
              child: Text(
                'Title of Room',
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
                flex: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                )),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: List.generate(locList.length, (index) {
                  final item = locList[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset(
                              item['image'].toString(),
                              height: 200,
                              width: 500,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['title'].toString(),
                                      style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'DMSerifDisplay',
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "\$ ${item['perN'].toString()} / per night",
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
                              Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 115,
                                      height: 50,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shadowColor: Colors.blue,
                                              elevation: 5.0,
                                              backgroundColor:
                                                  Colors.lightBlueAccent),
                                          onPressed: () {},
                                          child: const Text(
                                            'Book Now',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                    ),
                                    const SizedBox(height: 17),
                                    InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          'Room Detail',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 13.0,
                                          ),
                                        ))
                                  ],
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
