import 'package:flutter/material.dart';


import 'CategoriesHorizontal.dart';
import 'SearchBar.dart';

class Homescreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Searchbar(),
            CategoriesListhorizontal(),
          ],
        ),
      ),
    );
  }
}