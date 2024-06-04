// import 'package:coffeeshop/widgets/bottom_navigation_calling.dart';
import 'package:coffeeshop/utils/app_colors.dart';
import 'package:coffeeshop/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.only(top: 100, bottom: 40),
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("images/bg.png"),
            fit: BoxFit.cover,
            opacity: 0.8,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "CoffeeShop",
              style: GoogleFonts.pacifico(
                fontSize: 50,
                color: AppColors.secondarycolor,
              ),
            ),
            Column(
              children: [
                Text(
                  "Feeling Low? Take a Sip of Coffee",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 80),
                InkWell(
                  splashColor: Colors.black,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NavBar()));
                  },
                  child: Ink(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      decoration: BoxDecoration(
                        color: AppColors.primarycolor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Get Start",
                        style: TextStyle(
                            color: AppColors.secondarycolor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
