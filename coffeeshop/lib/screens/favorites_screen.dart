import 'package:coffeeshop/data/food_details.dart';
import 'package:coffeeshop/utils/app_colors.dart';
import 'package:flutter/material.dart';

class FavScreen extends StatefulWidget {
  final List items;
  const FavScreen({Key? key, required this.items}) : super(key: key);

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.4),
        iconTheme: IconThemeData(color: AppColors.secondarycolor),
        title: Text(
          "Favorites",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: AppColors.secondarycolor),
        ),
        centerTitle: true,
      ),
      body: widget.items.isEmpty
          ? const Center(child: Text("EmptyFavorites"))
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
                                color: Colors.black.withOpacity(0.3), width: 1),
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
                                          icon: const Icon(
                                            Icons.close,
                                            color: Colors.grey,
                                          )),
                                      const SizedBox(
                                        height: 10,
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
                              color: AppColors.secondarycolor),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
