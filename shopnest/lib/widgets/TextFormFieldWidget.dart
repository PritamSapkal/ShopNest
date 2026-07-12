import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Textformfieldwidget extends StatelessWidget{
  const Textformfieldwidget({required this.prefixicon, required this.isObscure,super.key});

  final bool isObscure;
  final Icon prefixicon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 15.sp,fontWeight: FontWeight.normal,),
      obscureText: isObscure,
      obscuringCharacter: "*",
      validator: (value){},
      onSaved: (value){},
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 15.h,   // Decreasing this lowers the height
        ),
        prefixIcon: prefixicon,
        filled: true,
        fillColor: Theme.of(context).focusColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Color(0xff00D100),
            width: 3
          ),
        ),
      ),
    );
  }
}