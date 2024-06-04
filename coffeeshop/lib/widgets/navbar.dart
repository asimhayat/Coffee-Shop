import 'package:coffeeshop/data/cart&fav.dart';
import 'package:coffeeshop/screens/home_screen.dart';
import 'package:coffeeshop/screens/user_screen.dart';
import 'package:coffeeshop/screens/cart_screen.dart';
import 'package:coffeeshop/screens/favorites_screen.dart';
import 'package:coffeeshop/utils/app_colors.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndexValue = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (currentIndexValue != 0) {
          setState(() {
            currentIndexValue = 0; // Switch to Shop screen if not already there
          });
          return false; // Prevent back navigation
        }
        return true; // Allow back navigation if already on Shop screen
      },
      child: Scaffold(
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor:
                Colors.black.withOpacity(0.4), // Set bg color of navbar here
          ),
          child: BottomNavigationBar(
            unselectedItemColor: Colors.white,
            selectedItemColor: AppColors.primarycolor,
            onTap: (index) {
              setState(() {
                currentIndexValue = index;
              });
            },
            currentIndex: currentIndexValue,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Shop",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: "Favorite",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: "Account",
              ),
            ],
          ),
        ),
        body: _getBody(currentIndexValue),
      ),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return CartScreen(items: cartItems);
      case 2:
        return FavScreen(items: favItems);
      case 3:
        return UserScreen();
      default:
        return HomeScreen(); // Default to HomeScreen if index is out of range
    }
  }
}
