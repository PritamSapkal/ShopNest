import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopnest/screens/SignInPage.dart';
import '../Provider/MasterItemList.dart';
import '../Provider/Providers.dart';
import '../Provider/ThemeProvider.dart';
import '../Provider/userInfoProvider.dart';
import '../SharedPreferencess/AppThemePref.dart';
import '../widgets/AppearanceWidget.dart';
import '../widgets/CustomeBackgroundContainer.dart';

class Setteingscreen extends ConsumerWidget {
  const Setteingscreen({super.key});

  // Method to show theme-adaptive warning dialog
  Future<bool?> _showLogoutConfirmationDialog(BuildContext context) {
    final theme = Theme.of(context);

    return showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: theme.dialogBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          icon: Icon(
            Icons.warning_amber_rounded,
            color: Colors.redAccent,
            size: 38.sp,
          ),
          title: Text(
            "Log Out Confirmation",
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
            textAlign: TextAlign.center,
          ),
          content: Text(
            "If you log out, all of your shopping cart and saved data will be permanently deleted. Do you want to continue?",
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: 13.sp,
              color: theme.textTheme.bodyMedium?.color?.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actionsPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          actions: [
            // Cancel Button
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: Text(
                "Cancel",
                style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: theme.textTheme.bodyMedium?.color,
                ),
              ),
            ),
            // Confirm / Delete Data Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              ),
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: Text(
                "Log Out",
                style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    final username = ref.watch(userInfoProvider).name.toString();
    final email = ref.watch(userInfoProvider).email.toString();

    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name & Email Address Container
              Customebackgroundcontainer(
                childwidget: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF2ECC71).withOpacity(0.4),
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: const Offset(0, 2),
                            ),
                          ],
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF59C76E),
                              Color(0xFF4CB493),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.cartArrowDown,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              username,
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(fontSize: 15.sp),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              email,
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

              // Appearance Section
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 10.h,
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
                    const Divider(),
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
                    const Divider(),
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

              // About Section
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 10.h,
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

              // App Version
              Customebackgroundcontainer(
                childwidget: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 20.h,
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(
                          Icons.info_outline,
                          color: Colors.lightGreenAccent,
                        ),
                      ),
                      Text(
                        "Version",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 14.sp),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          "1.0.0",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 13.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              // Logout Button
              InkWell(
                onTap: () async {
                  // Show the warning dialog first
                  final shouldLogout =
                  await _showLogoutConfirmationDialog(context);

                  // If user dismissed or clicked Cancel, abort
                  if (shouldLogout != true) return;

                  // Reset bottom navigation index
                  ref
                      .read(bottomAppbarindexProvider.notifier)
                      .update((state) => 0);

                  // Clear SharedPreferences and provider state
                  await ref.read(userInfoProvider.notifier).clearUser();

                  // clear all the data of an item from the app
                  await ref.read(masteritemlistProvider.notifier).clearAllItems();

                  // Check if the widget is still mounted after async operations
                  if (!context.mounted) return;

                  // Clear navigation stack and return to login
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  SignInpage(),
                    ),
                        (route) => false,
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.logout, color: Colors.redAccent),
                        SizedBox(width: 10.w),
                        Text(
                          "Log Out",
                          style: GoogleFonts.poppins(
                            color: Colors.redAccent,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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