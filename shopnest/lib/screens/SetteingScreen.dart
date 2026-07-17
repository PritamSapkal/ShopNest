import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/CustomeBackgroundContainer.dart';

class Setteingscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Name & Email Address Container // ShopenestIcon cart Container
              Customebackgroundcontainer(
                childwidget: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 20,vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Icon
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // 1. This adds the glowing effect behind the button
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF2ECC71).withOpacity(0.4), // Match your gradient color with opacity
                              blurRadius: 10, // High blur gives that soft "lighting" effect
                              spreadRadius: 1, // How far the glow extends
                              offset: const Offset(0, 2), // Moves the glow slightly downwards
                            ),
                          ],
                          gradient: LinearGradient(
                            colors: [ Color(0xFF59C76E), // Brighter green on the left
                              Color(0xFF4CB493)],
                            begin: AlignmentGeometry.topLeft,
                            end: AlignmentGeometry.bottomRight,
                          ),
                        ),
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.cartArrowDown,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            size: 20.sp,
                          ),
                        ),
                      ),
                      //for gap
                      SizedBox(width: 10.w,),
                      // Name & email address.
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                        child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Pritam Sapkal",style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 15.sp),textAlign: TextAlign.left,),
                            Text("pritam.s0752@gmail.com",style:GoogleFonts.poppins(fontSize: 10.sp,fontWeight: FontWeight.w600,color: Colors.grey),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
            ],
          ),
        ),
      ),
    );
  }
}
