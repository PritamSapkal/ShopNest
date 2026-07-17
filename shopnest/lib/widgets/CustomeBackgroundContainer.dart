import 'package:flutter/material.dart';

class Customebackgroundcontainer  extends StatelessWidget{
  Customebackgroundcontainer({required this.childwidget,super.key});
  Widget childwidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: childwidget,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:Theme.of(context).secondaryHeaderColor,
        boxShadow: [BoxShadow(
          color: Colors.black12,
          blurRadius: 5,
          spreadRadius: 1,
        )]
      ),
    );
  }
}