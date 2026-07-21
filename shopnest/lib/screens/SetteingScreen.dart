import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopnest/screens/SignInPage.dart';
import '../Provider/Providers.dart';
import '../Provider/ThemeProvider.dart';
import '../SharedPreferencess/AppThemePref.dart';
import '../widgets/AppearanceWidget.dart';
import '../widgets/CustomeBackgroundContainer.dart';

class Setteingscreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name & Email Address Container // ShopenestIcon cart Container
              Customebackgroundcontainer(
                childwidget: Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
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
                              color: const Color(0xFF2ECC71).withOpacity(
                                0.4,
                              ), // Match your gradient color with opacity
                              blurRadius:
                                  10, // High blur gives that soft "lighting" effect
                              spreadRadius: 1, // How far the glow extends
                              offset: const Offset(
                                0,
                                2,
                              ), // Moves the glow slightly downwards
                            ),
                          ],
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF59C76E), // Brighter green on the left
                              Color(0xFF4CB493),
                            ],
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
                      SizedBox(width: 10.w),
                      // Name & email address.
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pritam Sapkal",
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(fontSize: 15.sp),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "pritam.s0752@gmail.com",
                              style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              // Appearance Text
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Text(
                  "Appearance",
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              // Theme Options
              Customebackgroundcontainer(
                childwidget: Column(
                  children: [
                    // Light Mode
                    AppearanceWidget(
                      icon: const Icon(
                        Icons.wb_sunny_outlined,
                        color: Colors.orangeAccent,
                      ),
                      settingName: "Light Theme",

                      isSelected: currentTheme == AppTheme.light,

                      onTap: () {
                        ref
                            .read(themeProvider.notifier)
                            .changeTheme(AppTheme.light);
                      },
                    ),
                    Divider(),
                    // Dark Mode
                    AppearanceWidget(
                      icon: const Icon(
                        Icons.dark_mode_outlined,
                        color: Colors.blueAccent,
                      ),
                      settingName: "Dark Theme",

                      isSelected: currentTheme == AppTheme.dark,

                      onTap: () {
                        ref
                            .read(themeProvider.notifier)
                            .changeTheme(AppTheme.dark);
                      },
                    ),
                    Divider(),
                    //System Default Mode
                    AppearanceWidget(
                      icon: const Icon(Icons.phone_android, color: Colors.grey),
                      settingName: "System Theme",
                      isSelected: currentTheme == AppTheme.system,

                      onTap: () {
                        ref
                            .read(themeProvider.notifier)
                            .changeTheme(AppTheme.system);
                      },
                    ),
                  ],
                ),
              ),
              // About Text
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Text(
                  "About",
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              // App Version Showing Container.
              Customebackgroundcontainer(
                childwidget: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(
                          Icons.info_outline,
                          color: Colors.lightGreenAccent,
                        ),
                      ),

                      Text(
                        "Vesrion",
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium!.copyWith(fontSize: 14.sp),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                        child: Text(
                          "1.0.0",
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium!.copyWith(fontSize: 13.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
               SizedBox(height: 20.h,),
              //Logout Button
              InkWell(
                onTap: (){
                  ref.read(bottomAppbarindexProvider.notifier).update((state)=>0);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignInpage()));
                },
                child: Container(
                  width: double.infinity,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.logout,color: Colors.redAccent,),
                        SizedBox(width: 10.w,),
                        Text("Log Out",style: GoogleFonts.poppins(color: Colors.redAccent,fontSize: 13.sp,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
