import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Textbuttongreen extends StatelessWidget{
   Textbuttongreen({required this.text,required this.textsize,required this.OnTap,super.key});
    final String text;
    final double textsize;
    final Function() OnTap;
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: OnTap, child: Text(text,style: GoogleFonts.poppins(color: Colors.green,fontWeight: FontWeight.bold,fontSize:textsize),));
  }
}