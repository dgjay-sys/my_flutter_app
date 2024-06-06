import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class BookHotel extends StatefulWidget {
  const BookHotel({super.key});

  @override
  State<BookHotel> createState() => _BookHotelState();
}

class _BookHotelState extends State<BookHotel> {
  DateTime? _selectedDay = DateTime.now();
  DateTime? _focusedDay = DateTime.now();

  DateTime selectedDate = DateTime.now();

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
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 300.0,
          width: 500.0,
          child: Image.asset(
            'assets/bryce-canyon-502026_1920.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.vertical(
            //     top: Radius.circular(20), bottom: Radius.circular(20)),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black26,
            //     offset: Offset(0, -2),
            //     blurRadius: 6.0,
            //   ),
            // ],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'title',
                  style: TextStyle(
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
                      'subtitle',
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
                const Row(
                  children: [
                    Text(
                      '\$ perN',
                      style: TextStyle(
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
        TextButton(
          onPressed: () => _selectDate(context),
          child: Text(
            "Start: ${selectedDate.toLocal().toString().split(' ')[0]}",
            style: const TextStyle(
                fontSize: 13, // Adjusted font size for better visibility
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),

        // SizedBox(
        //   child: TableCalendar(
        //     firstDay: DateTime.utc(2010, 10, 16),
        //     lastDay: DateTime.utc(2030, 3, 14),
        //     focusedDay: DateTime.parse(_focusedDay.toString()),
        //     rangeStartDay: DateTime.parse(selectedDate.toString()),
        //     rangeEndDay: DateTime.parse(_selectedDay.toString()),
        //     selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
        //     onDaySelected: (selectedDay, focusedDay) {
        //       setState(() {
        //         _selectedDay = selectedDay;
        //         _focusedDay = focusedDay;
        //       });
        //     },
        //   ),
        // ),
      ],
    ));
  }
}
