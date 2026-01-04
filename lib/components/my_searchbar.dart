import 'package:flutter/material.dart';

class MySearchbar extends StatelessWidget {
  const MySearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
    
      decoration: InputDecoration(
        hintText: 'Search here ...',
        suffixIcon: Icon(Icons.search, color: Colors.white),
        hintStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.red.shade400,
        border: OutlineInputBorder(
          gapPadding: 10,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
