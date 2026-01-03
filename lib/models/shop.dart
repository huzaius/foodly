

import 'package:flutter/material.dart';
import 'package:foodly/models/category.dart';
import 'package:foodly/models/food.dart';

class Shop extends ChangeNotifier{
  
  // food menu
  final List<Food> _foodMenu = [
    //salmon sushi
    Food(
      foodName: "Salmon Sushi",
      price: 21.00,
      imagePath: "assets/images/sushi.png",
      description: "Fresh salmon and delicious rice",
      category: "Sushi",
    ),
    //ramen
    Food(
      foodName: "Ramen",
      price: 35.00,
      imagePath: "assets/images/ramen.png",
      description: "A delicious and healthy ramen",
      category: "Noodles",
    ),
    //donuts
    Food(
      foodName: "Donuts",
      price: 12.00,
      imagePath: "assets/images/donuts.png",
      description: "Sweet and sugary donuts",
      category: "Desserts",
    ),
    //pizza
    Food(
      foodName: "Pizza",
      price: 50.00,
      imagePath: "assets/images/pizza.png",
      description: "Pepperoni pizza with extra cheese",
      category: "Pizza",
    ),
    //burger
    Food(
      foodName: "Burger",
      price: 25.00,
      imagePath: "assets/images/fast-food.png",
      description: " LArge Burger with cheese",
      category: "Fast Food"
    ),
    //French Fries
    Food(
      foodName: "French Fries",
      price: 15.00,
      imagePath: "assets/images/french-fries.png",
      description: "Large french fries with cheese",
      category: "Fast Food",
    ),


  ];


  // Category menu
  final List<Category> _categoryMenu = [
    Category(
      categoryName: "All",
      imagePath: "assets/images/intro_image.png",
    ),
    Category(
      categoryName: "Pizza",
      imagePath: "assets/images/pizza.png",
    ),
    Category(
      categoryName: "Sushi",
      imagePath: "assets/images/sushi.png",
    ),
    Category(
      categoryName: "Noodles",
      imagePath: "assets/images/ramen.png",
    ),
    Category(
      categoryName: "Desserts",
      imagePath: "assets/images/donut.png",
    ),
    Category(
      categoryName: "Fast Food",
      imagePath: "assets/images/fast-food.png",
    ),
  ];

  // getter methods
  List<Category> get categoryMenu => _categoryMenu;


  // customer cart
  final List<Food> _cart = [];

  // getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }

  

}