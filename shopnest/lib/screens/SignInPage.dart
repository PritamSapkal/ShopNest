import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopnest/Provider/Providers.dart';
import 'package:shopnest/screens/DashBoardScreen.dart';
import 'package:shopnest/screens/SignUpPage.dart';
import 'package:shopnest/widgets/GreenButton.dart';

import '../widgets/TextButtonGreen.dart';
import '../widgets/TextFieldLabel.dart';
import '../widgets/TextFormFieldWidget.dart';

class SignInpage extends ConsumerWidget {
  SignInpage({super.key});

  final _formstate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    bool _isObscure=ref.watch(ObscureProvider);
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
                        // 1. This adds the glowing effect behind the button
                        boxShadow: [
                    BoxShadow(
                    color: const Color(0xFF2ECC71).withOpacity(0.4), // Match your gradient color with opacity
                    blurRadius: 20, // High blur gives that soft "lighting" effect
                    spreadRadius: 4, // How far the glow extends
                    offset: const Offset(0, 5), // Moves the glow slightly downwards
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
                            //Email label
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                              child: Textfieldlabel(label: "Email Address",fontsize: 15,),
                            ),
                            //EMAIL Textfield
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
                              child: Textfieldlabel(label: "Password",fontsize: 15,),
                            ),
                            //Password Textfield
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                              child: Textformfieldwidget(
                                isObscure: _isObscure,
                                prefixicon: Icon(Icons.lock_open_sharp),
                                suffixicon: IconButton(onPressed: (){
                                  if(_isObscure){
                                    ref.read(ObscureProvider.notifier).update((state)=>false);
                                  }
                                  else{
                                    ref.read(ObscureProvider.notifier).update((state)=>true);
                                  }
                                }, icon: _isObscure?Icon(Icons.visibility_off_sharp,color: Colors.green,):Icon(Icons.visibility_sharp,color: Colors.green,),),
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
                            //Sign in Button
                            Center(
                              child: Greenbutton(onTap: (){
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => Dashboardscreen(),
                                  ),
                                );
                              },ButtonHeight: 50.h, ButtonWidth: 310.w, title: "Sign In", textsize:  18.sp),
                            ),
                            // devider with or continuew with option
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                              child: Row(
                                children: [
                                  // Left side line
                                  const Expanded(
                                    child: Divider(
                                      color: Colors.grey, // Adjust color to match your dark background tint
                                      thickness: 1.0,     // Set the thickness of the line
                                    ),
                                  ),

                                  // Middle Text
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                    child: Text(
                                      'or continue with',
                                      style: TextStyle(
                                        color: Colors.grey[400], // Faded grey color text
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),

                                  // Right side line
                                  const Expanded(
                                    child: Divider(
                                      color: Colors.grey,
                                      thickness: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5.h,),
                            // Continue as text Button..
                            Center(
                              child: InkWell(
                                onTap: (){},
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  width: 310.w,
                                  height: 50.h,
                                  decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.green,width: 2),
                                  ) ,
                                  child: Center(
                                    child: Text("Continue as Guest",style: GoogleFonts.poppins(color: Colors.green,fontWeight: FontWeight.bold,fontSize:15.sp),
                                  ),
                                ),
                              )),
                            ),
                            SizedBox(height: 10.h,),
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
