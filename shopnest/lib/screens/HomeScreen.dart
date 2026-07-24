import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopnest/screens/Add_New_item_screen.dart';
import '../widgets/Category_Item_List.dart';
import '../widgets/SearchBar.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Floating Action Button to add new Item
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddNewItemScreen(appbarTitle: "Add Shopping Item",)));
        },
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        elevation: 2,
        focusElevation: 5,
        hoverElevation: 5,
        highlightElevation: 5,

        child: Container(
          width: 60, // Standard FAB width
          height: 60, // Standard FAB height
          decoration: BoxDecoration(
            shape: BoxShape.circle, // Keeps it round like a traditional FAB
            gradient: const LinearGradient(
              colors: [
                Color(0xFF52C47E), // Light vibrant green
                Color(0xFF3CA88B), // Darker teal green
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF3CA88B).withOpacity(0.4),
                blurRadius: 10,
                spreadRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Search bar for serching items
            Searchbar(),
            SizedBox(height: 10.h),
            // category horizontal listview
            Expanded(child: CategoryAndItemList()),
          ],
        ),
      ),
    );
  }
}
