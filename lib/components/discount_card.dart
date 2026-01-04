import 'package:flutter/material.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red.shade400,
        borderRadius: BorderRadius.circular(40),
      ),

      child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Big Discount \n 10.10',
                        style: TextStyle(
                          
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
      
                      Text(
                        'Claim your voucher now!',
                        style: TextStyle(
                          
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
    )
;
  }
}