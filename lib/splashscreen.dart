import 'dart:async';
import 'package:Zomato/SignUpForm/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SignUpForm/LogIn.dart';
import 'main.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  // void initState() {
  //   super.initState();
  //   Timer  ( const Duration(seconds: 2), () {
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => const SighInScreen()));
  //   });
  // }
  void initState() {
    super.initState();
    checkUserLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: Colors.black38, // Set the background color to black
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Image.asset(
                "assets/images/zomatologo.png",
                height: 150,
                width: 350,
              ),
              const SizedBox(height: 10),
              const Text(
                "100% Green Deliveries",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.redAccent,
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Divider(
                    color: Colors.redAccent,
                  ),
                  Text(
                    "in India",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                  Divider(
                    color: Colors.redAccent,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const CircularProgressIndicator(
                value: null,
                backgroundColor: Colors.redAccent,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                strokeWidth: 6.0,
                semanticsLabel: 'Loading...',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkUserLoggedIn() async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setBool(SAVE_KEY_NAME, true);
    final userLoggedIn = sharedPref.getBool(SAVE_KEY_NAME);

    if (userLoggedIn == null || userLoggedIn == false) {
      navigatetohome();
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()),);
      // Navigator.of(context).pushNamed('/home');
    }
  }

  Future navigatetohome() async {
    Future.delayed(Duration(seconds: 6)).then((value) {
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(builder: (context) => SignUpPage()),
          Navigator.of(context).pushReplacementNamed('/home');

    });
  }
}
// Text(
//    "zomato",
//    style: TextStyle(
//      fontSize: 55,
//      fontStyle: FontStyle.italic,
//      fontWeight: FontWeight.bold,
//      color: Colors.white,
//    ),
//  ),
