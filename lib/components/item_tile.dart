import 'package:flutter/material.dart';
import 'package:foodly/models/food.dart';

class ItemTile extends StatefulWidget {
  const ItemTile({super.key, required this.foodItem});

  final Food foodItem;

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _scale = 0.95),
      onTapUp: (_) => setState(() => _scale = 1.0),
      onTapCancel: () => setState(() => _scale = 1.0),
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
           color: Colors.red.shade400,
          ),
          height: 230,
          width: 200,
          margin: EdgeInsets.only(right: 10),
          
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,

            children: [
              //Image
              Positioned(
                top: 0,
                left: 60,
                child: Image.asset(
                  widget.foodItem.imagePath,
                  width: 120,
                  height: 120,
                  cacheHeight: 120,
                  cacheWidth: 120,
                ),
              ),

              SizedBox(height: 20),
              //food item
              Positioned(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.foodItem.foodName,
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold ,),
                     
                    ),
                    SizedBox(height: 5),
                    //description
                    Text(widget.foodItem.description, style: TextStyle(fontSize: 15,)),
                    SizedBox(height: 5),
                    //price
                    Text(
                     '\$${widget.foodItem.price}',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
