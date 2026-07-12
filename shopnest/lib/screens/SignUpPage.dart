import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/GreenButton.dart';
import '../widgets/TextButtonGreen.dart';
import '../widgets/TextFieldLabel.dart';
import '../widgets/TextFormFieldWidget.dart';
import 'SignInPage.dart';

class SignUppage extends StatelessWidget{
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
                  padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                  child: Container(
                    width: 70.w,
                    height: 70.h,
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
                        size: 30.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                // Create Account text
                Text(
                  "Create Account",
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(fontSize: 25.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4.h),
                // Join ShopNest today — it's freetext
                Text(
                  "Join ShopNest today — it's free",
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
                            //Full Name label
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                              child: Textfieldlabel(label: "Full Name"),
                            ),
                            //Full Name Textfield
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                              child: Textformfieldwidget(
                                isObscure: false,
                                prefixicon: Icon(Icons.person),
                              ),
                            ),

                            //Email Address label
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                              child: Textfieldlabel(label: "Email Address"),
                            ),
                            //Email Address Textfield
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                              child: Textformfieldwidget(
                                isObscure: false,
                                prefixicon: Icon(Icons.mail_outline_sharp),
                              ),
                            ),

                            //Password label
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                              child: Textfieldlabel(label: "Password"),
                            ),
                            //Password Textfield
                            Padding(
                                padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                              child: Textformfieldwidget(
                                isObscure: true,
                                prefixicon: Icon(Icons.security),
                              ),
                            ),

                            //Confirm Password label
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                              child: Textfieldlabel(label: "Confirm Password"),
                            ),
                            //Confirm Password Textfield
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                              child: Textformfieldwidget(
                                isObscure: true,
                                prefixicon: Icon(Icons.security),
                              ),
                            ),

                            SizedBox(height: 20.h),
                            //Sign up Button
                            Center(
                              child: Greenbutton(ButtonHeight: 50.h, ButtonWidth: 310.w, title: "Create Account", textsize: 17.sp),
                            ),
                            SizedBox(height: 20.h,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10.h,),
                //Already have an account? Sign In (TextButton)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 13.sp,fontWeight: FontWeight.w300),),
                    Textbuttongreen(text: "Sign In",textsize: 15.sp,OnTap: (){
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>SignInpage()));
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