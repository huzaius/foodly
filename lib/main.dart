import 'package:flutter/material.dart';
import 'package:foodly/models/shop.dart';
import 'package:foodly/pages/intro_page.dart';
import 'package:foodly/pages/shop_page.dart';
import 'package:foodly/theme/my_colors.dart' as my_colors;
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers:[ChangeNotifierProvider(create: (context) => Shop()),] ,
    child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodly',
      theme: ThemeData(
        scaffoldBackgroundColor: my_colors.tertiaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
        textTheme: ThemeData(useMaterial3: true).textTheme.apply(
              bodyColor: Colors.grey.shade100,
              displayColor: Colors.grey.shade100,
            ),
      ),
      home:IntroPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/intro_page':(context)=>IntroPage(),
        '/shop_page':(context)=>ShopPage(),
        
        }
        
    );
  }
}
