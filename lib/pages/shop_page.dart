import 'package:flutter/material.dart';
import 'package:foodly/components/category_tile.dart';
import 'package:foodly/models/shop.dart';
import 'package:foodly/theme/my_colors.dart' as my_colors;
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryMenu = context.watch<Shop>().categoryMenu;
    

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
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  width: 60,
                  height: 60,
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    'assets/images/user.png',
                    cacheHeight: 60,
                    cacheWidth: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),

            SizedBox(height: 25),
            //Header Text
            Text(
              'What are you going \n to eat today?',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: my_colors.inversePrimaryColor,
              ),
            ),

            SizedBox(height: 15),
            //seacrch bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search here ...',
                suffixIcon: Icon(Icons.search),
                labelText: "Search",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: my_colors.tertiaryColor),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            SizedBox(height: 25),

            //Discount area
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Big Discount \n 10.10',
                      style: TextStyle(
                        color: my_colors.inversePrimaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      'Claim your voucher now!',
                      style: TextStyle(
                        color: my_colors.inversePrimaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                //Discount Image
                Image.asset(
                  'assets/images/fast-food.png',
                  width: 150,
                  height: 150,
                  cacheHeight: 150,
                  cacheWidth: 150,
                  fit: BoxFit.cover,
                ),
              ],
            ),

            //Categories and See more
            SizedBox(height: 25),
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
            SizedBox(height: 25),

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
            //items
          ],
        ),
      ),

      //bottom navbar
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
        ],
      ),
    );
  }
}
