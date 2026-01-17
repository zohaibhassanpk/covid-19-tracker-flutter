import 'package:covid_19_tracker/view/practice_flash.dart';
import 'package:covid_19_tracker/view/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark,
          primarySwatch: Colors.blue),
      home: SplashScreen(),
    );
  }
}
