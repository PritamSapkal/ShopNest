import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Textfieldlabel extends StatelessWidget{
   Textfieldlabel({ this.fontsize,required this.label,super.key});
  final String label;
   double ? fontsize=13;
  @override
  Widget build(BuildContext context) {
    return Text(label,style:Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize:fontsize?.sp,fontWeight: FontWeight.bold),);
  }
}