import 'package:flutter/material.dart';
import 'package:foodly/components/category_tile.dart';
import 'package:foodly/components/discount_card.dart';
import 'package:foodly/components/item_tile.dart';
import 'package:foodly/components/my_searchbar.dart';
import 'package:foodly/models/shop.dart';
import 'package:foodly/theme/my_colors.dart' as my_colors;
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryMenu = context.watch<Shop>().categoryMenu;
    final foodItems = context.watch<Shop>().foodMenu;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            //Header
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                //LOcation icon
                Row(
                  children: [
                    Icon(Icons.location_on),
                    //Location
                    Text("Sacramento, California"),
                  ],
                ),

                //Avatar
                CircleAvatar(
                  foregroundImage: AssetImage('assets/images/user.png'),
                  
                  radius: 30,
                ),
              ],
            ),

            SizedBox(height: 20),
            //Header Text
            Text(
              'What are you going \n to eat today?',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 15),

            //seacrch bar
            MySearchbar(),

            SizedBox(height: 20),

            //Discount area
            DiscountCard(),

            //Categories and See more
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Category',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text('See More', style: TextStyle(fontSize: 15)),
              ],
            ),

            //Categories list and Icons
            SizedBox(height: 20),
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              height: 50,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categoryMenu.length,
                itemBuilder: (BuildContext context, int index) {
                  return CategoryTile(category: categoryMenu[index]);
                },
              ),
            ),

            //food items
            SizedBox(height: 20),
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              height: 250,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: foodItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemTile(foodItem: foodItems[index]);
                },
              ),
            ),
          ],
        ),
      ),

      //bottom navbar
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: "Location",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
