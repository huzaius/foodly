import 'package:flutter/material.dart';
import 'package:foodly/components/circular_top_clipper.dart';
import 'package:foodly/theme/my_colors.dart' as my_colors;
import 'package:slide_to_act/slide_to_act.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: my_colors.tertiaryColor,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 450,
              alignment: Alignment.center,
              child: Text(
                'FOODLY',
                textAlign: TextAlign.center,
                style: TextStyle(
                  letterSpacing: 5.5,
                  fontFamily: 'Helvitica',
                  fontStyle: FontStyle.normal,
                  color: my_colors.primaryColor,
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // The clipped container
            Expanded(
              child: ClipPath(
                clipper: CircularTopClipper(radius: 900),
                child: Container(
                  width: double
                      .infinity, // Ensure width < 2 * radius (900) for a valid arc
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.all(15)),
                      Container(
                        padding: EdgeInsets.only(top: 100, ),
                        child: Text.rich(
                          TextSpan(
                            text: 'Hungry? ',
                            style: TextStyle(
                              fontSize: 35,
                              color: my_colors.tertiaryColor,
                              fontFamily: 'Helvitica',
                              fontWeight: FontWeight.bold,
                            ), // Base style
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Get It Fast',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: my_colors.inversePrimaryColor,
                                  fontSize: 35,
                                ), // Specific style
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'Fast, Fresh, and just the way you like it!',
                        style: TextStyle(color: my_colors.inversePrimaryColor),
                      ),
                      SizedBox(height: 20),
                      
                      // Order button
                      Container(
                        margin: EdgeInsets.all( 20),
                        padding: EdgeInsets.all(20),
                        child: SlideAction(
                          sliderButtonIcon: Icon(Icons.storefront) ,
                        
                          innerColor: my_colors.primaryColor,
                          outerColor: my_colors.tertiaryColor,
                          text: 'Order Now',
                          onSubmit: () {
                            Navigator.pushNamed(context, '/shop_page');
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
