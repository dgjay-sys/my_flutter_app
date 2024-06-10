import 'package:flutter/material.dart';

class ViewHotel extends StatefulWidget {
  const ViewHotel({super.key});

  @override
  State<ViewHotel> createState() => _ViewHotelState();
}

class _ViewHotelState extends State<ViewHotel> {
  bool clickAction = false;

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

  @override
  Widget build(BuildContext context) {
    final Map<String, String>? data =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>?;

    if (data == null) {
      return const Scaffold(
        body: Center(
          child: Text('No data available'),
        ),
      );
    }
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              data['image']!,
              fit: BoxFit.cover,
            ),
          ),
          // Content
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20), bottom: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, -2),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['title']!,
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
                        data['subtitle']!,
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
                        '\$ ${data['perN']!}',
                        style: const TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/booknow', arguments: data);
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
                        'Book now',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Center(
                    child: TextButton.icon(
                      icon: const Icon(
                        Icons.arrow_downward,
                        size: 15.0,
                        color: Colors.blueAccent,
                      ),
                      label: const Text(
                        'More details',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.teal,
                        ),
                      ),
                      onPressed: () =>
                          setState(() => clickAction = !clickAction),
                    ),
                  ),
                  if (clickAction)
                    const Center(
                      child: Text(
                          'Summary:Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dapibus rhoncus massa. Maecenas pharetra facilisis sagittis. Sed non ex interdum, vulputate magna tempor, lacinia nibh. In pulvinar vehicula lorem non facilisis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse vitae quam volutpat sapien sodales.'),
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
                  if (clickAction)
                    SizedBox(
                      height: 300, // Define the height
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
            ),
          ),
          // Heart Icon
          const Positioned(
            top: 40.0,
            right: 16.0,
            child: Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 30.0,
            ),
          ),
          // Back Arrow Icon
          Positioned(
            top: 35.0,
            left: 16.0,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 30.0,
              ),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
