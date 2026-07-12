import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopnest/screens/SignUpPage.dart';
import 'package:shopnest/widgets/GreenButton.dart';

import '../widgets/TextButtonGreen.dart';
import '../widgets/TextFieldLabel.dart';
import '../widgets/TextFormFieldWidget.dart';

class SignInpage extends StatelessWidget {
  SignInpage({super.key});

  final _formstate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //cart design container
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                  child: Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
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
                        size: 35.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                // welcome back text
                Text(
                  "Welcome Back",
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(fontSize: 25.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5.h),
                // sign inm your shopnest account text
                Text(
                  "Sign in to your ShopNest account",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w200,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.h),

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
                        key: _formstate,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //label
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                              child: Textfieldlabel(label: "Email Address"),
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
                              child: Textfieldlabel(label: "Password"),
                            ),
                            //Password Textfield
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                              child: Textformfieldwidget(
                                isObscure: true,
                                prefixicon: Icon(Icons.lock_open_sharp),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Center(
                              child: Greenbutton(ButtonHeight: 50.h, ButtonWidth: 310.w, title: "Sign In", textsize:  18.sp),
                            ),
                            SizedBox(height: 20.h,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10.h,),
                //Don't have an account? Create Account (TextButton)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 13.sp,fontWeight: FontWeight.w300),),
                    Textbuttongreen(text: "Create Account",textsize: 15.sp,OnTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUppage()));
                    },),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
