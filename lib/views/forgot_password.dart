import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100.0,
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(
                      fontFamily: 'PoestenOne',
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold),
                ),
              )),
          const SizedBox(
            height: 25.0,
          ),
          const SizedBox(
            width: 330,
            height: 90,
            child: Text(
              "Enter your email to recieve and email to reset your password",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontFamily: 'DMSerifDisplay',
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
          ),
          SizedBox(
            width: 360,
            child: TextFormField(
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                  color: Colors.black45,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                labelText: 'Your Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          SizedBox(
            height: 50.0,
            width: 360.0,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.blue,
                    elevation: 5.0,
                    backgroundColor: Colors.lightBlueAccent),
                onPressed: () {},
                child: const Text(
                  'Send',
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                )),
          ),
        ],
      ),
    );
  }
}
