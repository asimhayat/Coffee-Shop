import 'package:coffeeshop/widgets/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:coffeeshop/data/food_details.dart';
import 'package:coffeeshop/screens/detail_screen.dart';
import 'package:coffeeshop/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _DisplayItemsState();
}

class _DisplayItemsState extends State<HomeScreen> {
  List<FoodDetail> displayList = coffee;
  String searchQuery = '';

  void updateList(String value) {
    setState(() {
      searchQuery = value;
      displayList = coffee
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 50, 54, 56),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            onChanged: updateList,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 13),
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.white.withOpacity(0.5),
                              ),
                              hintText: "Find Coffee",
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.tune),
                        color: AppColors.primarycolor,
                        onPressed: () {
                          // Add filter action here
                        },
                      ),
                    ],
                  ),
                ),
              ),

              Visibility(
                visible: searchQuery.isEmpty,
                child: itemstab(),
              ),

              SizedBox(
                height: 30,
              ),
              ////////////////////
              Visibility(
                visible: searchQuery.isEmpty,
                child: Container(
                  padding: const EdgeInsets.only(left: 5, right: 5, bottom: 15),
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(
                      children: [
                        Image.asset(
                          "images/banner.jpg",
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          left: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(padding: EdgeInsets.only(top: 20)),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Promo',
                                  style: TextStyle(
                                    color: AppColors.secondarycolor,
                                  ),
                                ),
                              ),
                              Text(
                                "Buy one get \none FREE",
                                style: TextStyle(
                                  color: AppColors.secondarycolor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  shadows: const [
                                    Shadow(
                                      blurRadius: 10.0,
                                      color: Colors.black,
                                      offset: Offset(2.0, 2.0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: displayList.length,
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20, //vertical space
                  crossAxisSpacing: 25, //horizontal space
                  mainAxisExtent: 265,
                ),
                itemBuilder: (context, index) {
                  FoodDetail food = displayList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                    food: food,
                                  )));
                    },
                    child: Container(
                      height: 265,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFF212325),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 15),
                              Center(
                                child: ClipRRect(
                                  child: Image.asset(
                                    food.image,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  food.name,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    Text(
                                      food.qunty_price,
                                      style: const TextStyle(
                                        color: Colors.white60,
                                      ),
                                    ),
                                    const Spacer(),
                                    const SizedBox(width: 4),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      '\$${food.price}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  //PLUS BUTTON ADD TO CART BUTTON
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Material(
                                      color: AppColors.primarycolor,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      child: InkWell(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
