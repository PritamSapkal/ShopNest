import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Textfieldlabel extends StatelessWidget{
  const Textfieldlabel({required this.label,super.key});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Text(label,style:Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize:13.sp,fontWeight: FontWeight.bold),);
  }
}