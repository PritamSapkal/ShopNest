import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Greenbutton extends StatelessWidget {
   Greenbutton({required this.ButtonHeight, required this.ButtonWidth,required this.title,required this.textsize,super.key});
   final double ButtonHeight;
   final double ButtonWidth;
   final String title;
   final double textsize;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {},
      child: Container(
        height:ButtonHeight,
        width: ButtonWidth,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF59C76E), // Brighter green on the left
                Color(0xFF4CB493)
              ],
              begin: AlignmentGeometry.centerLeft,
              end: AlignmentGeometry.centerRight,
            ),
            borderRadius: BorderRadius.circular(20)
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: textsize,
            ),
          ),
        ),
      ),
    );
  }
}