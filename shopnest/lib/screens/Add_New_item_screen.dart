import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopnest/widgets/CustomeBackgroundContainer.dart';

import '../widgets/TextButtonGreen.dart';
import '../widgets/TextFieldLabel.dart';
import '../widgets/TextFormFieldWidget.dart';

class AddNewItemScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    GlobalKey _formkey=GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        title: Text(
          "Add Shopping Item",
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontSize: 15.sp),
        ),
      ),
      body:Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 15,vertical: 15),
        child: Column(
          children: [
            Customebackgroundcontainer(childwidget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  child: Text("ITEM DETAILS",style: GoogleFonts.poppins(color: Colors.grey,fontWeight: FontWeight.w700,fontSize:13.sp),),
                ),
                //Form Container
                Padding(
                  padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                  // container
                  child: Container(
                    width: 400.w,
                    decoration: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                      ],
                    ), // Decoration
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //label
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                              child: Textfieldlabel(label: "Item Name"),
                            ),
                            //EMAIL Textfield
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                              child: Textformfieldwidget(
                                isObscure: false,
                                prefixicon: Icon(Icons.mail_outline_sharp),
                              ),
                            ),
                            //label
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                              child: Textfieldlabel(label: "Category"),
                            ),
                            //Password Textfield
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                              child: Textformfieldwidget(
                                isObscure: false,
                                prefixicon: Icon(Icons.lock_open_sharp),
                              ),
                            ),
                            // Forgot Password Text Button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Textbuttongreen(OnTap: (){},textsize: 15.sp,text: "Forgot Password?",),
                              ],
                            ),
                            SizedBox(height: 10.h,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}