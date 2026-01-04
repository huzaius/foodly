import 'package:flutter/material.dart';
import 'package:foodly/models/category.dart';

class CategoryTile extends StatelessWidget {
  
 final Category category;

  const CategoryTile({super.key,required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
       color: Colors.red.shade400,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.only(right: 10),
      
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  
                ],
              ),
              
    );
  }
}