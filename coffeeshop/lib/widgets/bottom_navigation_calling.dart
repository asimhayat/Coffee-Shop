import 'package:coffeeshop/widgets/navbar.dart';

import 'package:flutter/material.dart';

class BottomNavigationCalling extends StatefulWidget {
  const BottomNavigationCalling({super.key});

  @override
  State<BottomNavigationCalling> createState() => _HomePageState();
}

class _HomePageState extends State<BottomNavigationCalling> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: NavBar(),
    );
  }
}
