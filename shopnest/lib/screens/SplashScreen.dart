import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'IntorScreen.dart';


class Splashscreen extends StatefulWidget {
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Intorscreen() ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff43E97B),
              Color(0xff38F9D7),
             ],
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            // cart
            Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 50,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.cartArrowDown,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  size: 40.sp,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            // shopnest text
            Text(
              "ShopNest",
              style: GoogleFonts.poppins(
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.bold,
                fontSize: 40.sp,
              ),
            ),
            SizedBox(height: 10),
            // plan smart.shop better. text
            Text(
              "Plan Smart. Shop Better.",
              style: GoogleFonts.poppins(
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
            ),
            SizedBox(height: 30.h),
            // spinkit
            SpinKitThreeBounce(color: Colors.white,size:20.sp,),
            Spacer(),
            Text("Version 1.0.0",style: GoogleFonts.poppins(fontSize: 13.sp,color: Colors.white),),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
