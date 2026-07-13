import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Greenbutton extends StatelessWidget {
   Greenbutton({required this.ButtonHeight, required this.ButtonWidth,required this.title,required this.textsize,required this.onTap,super.key});
   final double ButtonHeight;
   final double ButtonWidth;
   final String title;
   final double textsize;
   final VoidCallback  onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap:(){
        onTap();
      },
      child: Container(
        height:ButtonHeight,
        width: ButtonWidth,
        decoration: BoxDecoration(
          // 1. This adds the glowing effect behind the button
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF2ECC71).withOpacity(0.4), // Match your gradient color with opacity
                blurRadius: 20, // High blur gives that soft "lighting" effect
                spreadRadius: 2, // How far the glow extends
                offset: const Offset(0, 5), // Moves the glow slightly downwards
              ),
            ],
            gradient: LinearGradient(
              colors: [
                Color(0xFF52C47E), // Lighter green
                Color(0xFF3CA88B), // Cyan/Teal green
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