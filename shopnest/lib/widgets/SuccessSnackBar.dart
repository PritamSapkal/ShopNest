import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessSnackBar {
  static SnackBar show(String message) {
    return SnackBar(
      content: Row(
        children: [
          Container(
            height: 30.h,
            width: 30.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.green.withOpacity(0.2),
            ),
            child: Center(
              child: Icon(Icons.check_circle_outline_sharp,color: Colors.green,size: 15.sp,),
            ),
          ),
          SizedBox(width: 10.w,),
          Expanded(child: Text(message,style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12.sp),)),
        ],
      ),
      backgroundColor: Color(0xff1F2937),
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
     // action: SnackBarAction(label: "Close", onPressed: (){},textColor: Colors.green,),
     //animation: ,
    );
  }
}