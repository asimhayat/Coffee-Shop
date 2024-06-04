import 'package:coffeeshop/data/food_details.dart';
import 'package:coffeeshop/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final List items;
  const CartScreen({super.key, required this.items});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

int quantity = 1;

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.4),
        iconTheme: IconThemeData(
          color: AppColors.secondarycolor,
        ),
        title: Text(
          "CART",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: AppColors.secondarycolor),
        ),
        centerTitle: true,
      ),
      body: widget.items.isEmpty
          ? Center(
              child: Text(
              "EmptyCart",
              style: TextStyle(color: AppColors.secondarycolor),
            ))
          : SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: widget.items.length,
                      itemBuilder: (context, index) {
                        FoodDetail food = widget.items[index];
                        return Container(
                          width: 100, // Width of each tile
                          margin: const EdgeInsets.symmetric(
                              vertical: 10), // Adjust margin as needed
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black.withOpacity(0.4), width: 1),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Image.asset(
                                    food.image,
                                    height: 100,
                                    width: 130,
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      Text(
                                        food.name,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19,
                                            color: AppColors.secondarycolor),
                                      ),
                                      Text(
                                        '\$${food.qunty_price}',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
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
                                                  color:
                                                      AppColors.secondarycolor,
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
                                  const Spacer(),
                                  Column(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            widget.items.removeAt(index);
                                            setState(() {});
                                          },
                                          icon: Icon(
                                            Icons.close,
                                            color: AppColors.secondarycolor,
                                          )),
                                      const SizedBox(
                                        height: 37,
                                      ),
                                      Text(
                                        '\$${food.price}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19,
                                          color: AppColors.secondarycolor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                            ],
                          ),
                        );
                      },
                    ),
                    Container(
                      width: double.infinity,
                      height: 55,
                      margin: const EdgeInsets.all(20),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primarycolor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {},
                          child: Text(
                            "Go To Checkout",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColors.secondarycolor,
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
