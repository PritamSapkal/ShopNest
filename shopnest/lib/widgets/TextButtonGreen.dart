import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Textbuttongreen extends StatelessWidget{
   Textbuttongreen({required this.text,required this.textsize,super.key});
    final String text;
    final double textsize;
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){}, child: Text(text,style: GoogleFonts.poppins(color: Colors.green,fontWeight: FontWeight.bold,fontSize:textsize),));
  }
}