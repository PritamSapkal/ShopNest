import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Searchbar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20,8,20,8),
        child: TextField(
          cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
          cursorHeight: 20,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 15.sp,fontWeight: FontWeight.normal,),
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).appBarTheme.foregroundColor,
            prefixIcon: Icon(Icons.search_sharp,color: Colors.grey,),
            hintText: "Search shopping items...",
            hintStyle: GoogleFonts.poppins(color: Colors.grey,fontSize: 12.sp),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey,width: 0)
            ),
            focusedBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey,width: 0)
            ),
          ),
        ),
      ),
    );
  }
}