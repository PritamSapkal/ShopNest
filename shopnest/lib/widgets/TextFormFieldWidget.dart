import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Textformfieldwidget extends StatelessWidget{
   Textformfieldwidget({this.errormessage,this.hinttext,this.suffixicon, this.prefixicon, required this.isObscure,super.key});
  final IconButton ? suffixicon;
  final bool isObscure;
  final Icon ? prefixicon;
  final String ? hinttext;
  final String? errormessage;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: "testing value",
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 13.sp,fontWeight: FontWeight.normal,wordSpacing: 2),
      obscureText: isObscure,
      obscuringCharacter: "*",
      //maxLines:10,
      validator: (value){
        if(value==null||value.trim().length==0) {
          return errormessage;
        }
        return null;
      },
      onSaved: (value){},
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 15.h,   // Decreasing this lowers the height
        ),
        hintText: hinttext,
        hintStyle: GoogleFonts.poppins(fontSize: 13.sp,wordSpacing:2.sp,color: Colors.grey,fontWeight: FontWeight.w500),
        prefixIcon: prefixicon,
        suffixIcon: suffixicon,
        filled: true,
        fillColor: Theme.of(context).focusColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
              color: Colors.grey,
              width: 0.2
          ),

        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Color(0xff00D100),
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Color(0xff00D100),
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
              color: Colors.grey,
              width: 0.2
          ),

        ),
      ),
    );
  }
}