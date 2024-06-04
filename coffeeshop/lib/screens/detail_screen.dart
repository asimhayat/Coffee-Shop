import 'package:coffeeshop/data/cart&fav.dart';
import 'package:coffeeshop/data/food_details.dart';
import 'package:coffeeshop/screens/cart_screen.dart';
import 'package:coffeeshop/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:badges/badges.dart' as badges;

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.food});
  final FoodDetail food;

  @override
  State<DetailScreen> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailScreen> {
  int quantity = 1;
  bool _isOrange = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(213, 214, 213, 0.996),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          // detail header
          detailItemsHeader(),
          // for image
          detailImage(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // For name
                          Text(
                            widget.food.name,
                            // maxLines: 1,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.secondarycolor,
                                fontSize: 34),
                          ),
                          // For price
                          Row(
                            children: [
                              Text(
                                '\$${widget.food.price}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: AppColors.primarycolor),
                              ),
                              const Spacer(),
                              Material(
                                color: Colors.black45.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(15),
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        if (quantity > 1) {
                                          quantity -= 1;
                                          setState(() {});
                                        }
                                      },
                                      icon: Icon(
                                        Icons.remove,
                                        color: AppColors.secondarycolor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "$quantity",
                                      style: TextStyle(
                                          color: AppColors.secondarycolor,
                                          fontSize: 25),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        quantity += 1;
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: AppColors.primarycolor,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    // For items quantity
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                // For description

                Text(
                  widget.food.description,
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColors.secondarycolor.withOpacity(0.4)),
                ),
                // For add to cart button
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (!cartItems.contains(widget.food)) {
                          cartItems.add(widget.food);
                          setState(() {
                            _isOrange = true; // Change font color to orange
                          });
                          Timer(Duration(milliseconds: 150), () {
                            setState(() {
                              _isOrange =
                                  false; // Revert font color back after 500 milliseconds
                            });
                          });
                        }
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 50, 54, 56),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(
                            color: _isOrange
                                ? Colors.orange
                                : AppColors.secondarycolor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (favItems.contains(widget.food)) {
                            favItems.remove(widget.food);
                          } else {
                            favItems.add(widget.food);
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.primarycolor,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Icon(
                          favItems.contains(widget.food)
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          color: favItems.contains(widget.food)
                              ? AppColors
                                  .secondarycolor // Color when item is favorited
                              : Colors.white, // Default secondary color
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 70,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  SizedBox detailImage() {
    return SizedBox(
      height: 370,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              height: 150,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(),
              ),
            ),
          ),
          Center(
            child: Container(
              child: ClipRRect(
                // borderRadius: BorderRadius.all(Radius.circular(150)),
                child: Image.asset(
                  widget.food.image,
                  height: 300,
                  // width: 350,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding detailItemsHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          // For back button
          BackButton(
            color: AppColors.secondarycolor.withOpacity(0.5),
          ),

          const Spacer(),
          // For detail food

          const Spacer(),
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              setState(() {
                if (favItems.contains(widget.food)) {
                  favItems.remove(widget.food);
                } else {
                  favItems.add(widget.food);
                }
              });
            },
            child: Row(
              children: [
                //////////////////////////BADGE//////////////////////
                badges.Badge(
                  showBadge: cartItems.isNotEmpty,
                  position: badges.BadgePosition.topEnd(top: 0, end: 3),
                  badgeContent: Text(
                    '${cartItems.length}',
                    style: TextStyle(color: Colors.white),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen(
                            items: cartItems,
                          ),
                        ),
                      );

                      setState(() {});
                    },
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: 40,
                      color: AppColors.primarycolor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
