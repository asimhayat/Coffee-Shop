class FoodDetail {
  String id;
  String image;
  String name;
  double price;
  String qunty_price;
  String description;

  FoodDetail({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.qunty_price,
    required this.description,
  });
}

//COFFEE
List<FoodDetail> coffee = [
  FoodDetail(
    id: '1',
    image: 'images/coldcoffee.png',
    name: 'Cold Coffee',
    price: 15,
    qunty_price: '7Pcs,Priceg',
    description:
        "Delicious, nutritious bananas: the ultimate snack! Packed with potassium and vitamins, our fresh bananas are ready to fuel your day. Perfect for on-the-go snacking or blending into smoothies. Grab yours now!",
  ),
  FoodDetail(
    id: '2',
    image: "images/blackcoffee.png",
    name: 'Black Coffee',
    price: 20,
    qunty_price: '1kg,Priceg',
    description:
        "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healthful and varied diet.",
  ),
  FoodDetail(
    id: '3',
    image: 'images/Espresso.png',
    name: 'Espresso',
    price: 15,
    qunty_price: '7Pcs,Priceg',
    description:
        "Delicious, nutritious bananas: the ultimate snack! Packed with potassium and vitamins, our fresh bananas are ready to fuel your day. Perfect for on-the-go snacking or blending into smoothies. Grab yours now!",
  ),
  FoodDetail(
    id: '4',
    image: "images/Latte.png",
    name: 'Latte',
    price: 20,
    qunty_price: '1kg,Priceg',
    description:
        "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healthful and varied diet.",
  ),
];
