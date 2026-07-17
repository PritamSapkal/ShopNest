import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopnest/screens/HomeScreen.dart';

import '../Provider/Providers.dart';
import '../widgets/EmptyScreen.dart';
import 'CategoriesScreen.dart';
import 'SetteingScreen.dart';

class Dashboardscreen extends ConsumerStatefulWidget {
  const Dashboardscreen({super.key});

  @override
  ConsumerState<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends ConsumerState<Dashboardscreen> {
  @override
  Widget build(BuildContext context) {

    var _selectedIndex=ref.watch(bottomAppbarindexProvider);// Bottom App Bar Index
    Widget appbarwidget= Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       Text(
         'Good Morning 👋',
         style: Theme
             .of(context)
             .textTheme
             .headlineSmall!
             .copyWith(
           fontSize: 10.sp,
           color: Colors.grey,
         ),
       ),
       Text(
         "Pritam Sapkal",
         style: Theme
             .of(
           context,
         )
             .textTheme
             .titleMedium!
             .copyWith(fontSize: 15.sp),
       ),
       SizedBox(height: 5.h),
     ],
   );// Default app bar widget
    if(_selectedIndex==1){
     appbarwidget=Text("Categories",style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize:18.sp),);
    }// for category page appbar Widget
    else if(_selectedIndex==2){
      appbarwidget=Text("Settings",style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize:18.sp),);
    }// for Settings Page App bar widget

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //AppBar
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .appBarTheme
            .backgroundColor,
        title:appbarwidget,
      ),

      body: IndexedStack(
      index: _selectedIndex,
      children: [
        Homescreen(),
        Categoriesscreen(),
        Setteingscreen(),
      ],
    ),

      // Borttom navigation App bar
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_outlined),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
          backgroundColor: Theme.of(context).bottomAppBarTheme.color,
          onTap: (index) {
           ref.read(bottomAppbarindexProvider.notifier).update((state)=>index);
          },
          currentIndex: _selectedIndex,// current index
          selectedItemColor: Colors.green,
          iconSize: 30,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 10.sp),
          unselectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 9.sp),
          selectedIconTheme: const IconThemeData(size: 30),
          unselectedIconTheme: const IconThemeData(size: 25),
          elevation: 0.1,
          showSelectedLabels: true,
        ),
    );
  }
}
