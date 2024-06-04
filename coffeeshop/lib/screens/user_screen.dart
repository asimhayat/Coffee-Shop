import 'package:coffeeshop/utils/app_colors.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.4),
        iconTheme: IconThemeData(
          color: AppColors.secondarycolor,
        ),
        title: Text(
          "USER",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: AppColors.secondarycolor),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "UserScreen",
          style: TextStyle(fontSize: 30, color: AppColors.secondarycolor),
        ),
      ),
    );
  }
}
