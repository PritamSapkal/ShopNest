import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopnest/screens/Add_New_item_screen.dart';

import '../DataModel/ItemModel.dart';
import '../screens/ItemDetailPage.dart';

class Itemcard extends StatelessWidget {
  Itemcard({required this._currentitemm, super.key});

  final Itemmodel _currentitemm;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ItemdetailPage(currentitemm: _currentitemm,)));
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.backgroundColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2),
          ],
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Row(
            children: [
              //Category Icon Container.
              Hero(
                tag: _currentitemm.id,
                curve: Curves.linear,
                child: Container(
                  width: 45.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    color: _currentitemm.category.backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Icon(
                      _currentitemm.category.icon,
                      color: _currentitemm.category.baseColor,
                    ),
                  ),
                ),
              ),
      
              SizedBox(width: 10.w),
              //item Name Category Name, Notes & Quantity
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _currentitemm.name,
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(fontSize: 16),
                    ),
                    Text(
                      "${_currentitemm.category.name} . ${_currentitemm.quantity}",
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      _currentitemm.notes,
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              // checkBox, Edit Button ANd Delete Button.
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // checkbox to mark the status
                    Checkbox(
                      value: _currentitemm.status, // boolean value (true/false)
                      onChanged: (bool? newValue) {
                        print('status Button clicked');
                      },
                      activeColor: Colors.green, // Color when checked
                      shape: const CircleBorder(), // Forces the checkbox to be a perfect circle
                      checkColor: Colors.green,
                    ),
                    // delete And edit Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Edit Button
                        InkWell(

                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewItemScreen(appbarTitle: "Edit Item",),));
                          },
                          borderRadius: BorderRadius.circular(10.sp),
                          child: Container(
                              width: 25.w,
                              height: 25.h,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10.r)
                              ),
                              child: Center(
                                child: Icon(Icons.edit, color: Colors.grey,size: 15.sp,),
                              ),
                            ),
                        ),
      
                        SizedBox(width: 10.w),
                        // Delete Buttton
                        InkWell(
                          onTap: (){
                            print('Delete Button Clicked');
                          },
                          borderRadius: BorderRadius.circular(10.sp),
                          child: Container(
                              width: 25.w,
                              height: 25.h,
                              decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10.r)
                              ),
                              child: Center(
                                child: Icon(Icons.delete_outline_sharp, color: Colors.redAccent),
                              ),
                            ),
                        ),
      
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
