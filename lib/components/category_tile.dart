import 'package:flutter/material.dart';
import 'package:foodly/models/category.dart';
import 'package:foodly/theme/my_colors.dart' as my_colors;

class CategoryTile extends StatelessWidget {
  
 final Category category;

  const CategoryTile({super.key,required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        //  color: my_colors.tertiaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.only(right: 1),
      child: Row(
                children: [ 
                  Image.asset(category.imagePath,
                    width: 40,
                    height: 40,
                    cacheHeight: 40,
                    cacheWidth: 40,),
                  SizedBox(width: 5),
                  Text(
                    category.categoryName,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
    );
  }
}