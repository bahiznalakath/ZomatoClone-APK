import 'package:Zomato/SignUpForm/SignUp.dart';
import 'package:Zomato/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Itempage.dart';
import 'Location/Location.dart';
import 'SignUpForm/LogIn.dart';
import 'cartpage.dart';
import 'drawer.dart';
import 'firebase_options.dart';
import 'homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

const SAVE_KEY_NAME = 'UserLoggedIn';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zomato',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/drw': (context) => DrawerWidget(),
        '/cart': (context) => CartPage(),
        '/ithempage': (context) => ItemPage(),
        '/location': (context) => GetLocation(),
        '/signin': (context) => SignUpPage(),

      },
      debugShowCheckedModeBanner: false,
    );
  }
}
