import 'package:coffeeshop/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFF212325)),
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
