import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 150.0,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 15.0),
              child: const Text(
                'Log In',
                style: TextStyle(
                  fontFamily: 'PoestenOne',
                  fontSize: 50.0,
                ),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 150.0,
                  height: 50.0,
                  child: TextButton.icon(
                      icon: const Icon(Icons.facebook),
                      label: const Text(
                        'facebook',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {}),
                ),
                SizedBox(
                    width: 150.0,
                    height: 50.0,
                    child: TextButton.icon(
                      icon: const Icon(
                        Icons.tiktok,
                        color: Colors.black,
                      ),
                      label: const Text(
                        'Tiktok',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      onPressed: () {},
                    )),
              ],
            ),
            const Center(
              child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'or Log in with email',
                    style: TextStyle(fontFamily: 'OpenSans', fontSize: 15.0),
                  )),
            ),
            SizedBox(
              width: 370.0,
              height: 60.0,
              child: TextFormField(
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            SizedBox(
              width: 370.0,
              height: 60.0,
              child: TextFormField(
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 225.0, top: 15.0),
              child: InkWell(
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/forgot');
                },
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            SizedBox(
              height: 50.0,
              width: 250.0,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.blue,
                      elevation: 5.0,
                      backgroundColor: Colors.lightBlueAccent),
                  onPressed: () {},
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(top: 80.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Dont have an account?',
                    style: TextStyle(fontFamily: 'Opensans', fontSize: 15.0),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      ' Sign Up',
                      style: TextStyle(
                          fontFamily: 'Opensans',
                          fontSize: 15.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
