import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../DataModel/ItemModel.dart';
import '../widgets/formatItemTime.dart';

class ItemdetailPage extends StatelessWidget {
  ItemdetailPage({required this._currentitemm, super.key});

  final Itemmodel _currentitemm;

  @override
  Widget build(BuildContext context) {
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
          "Item Details",
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontSize: 15.sp),
        ),
      ),
      body: Column(
        children: [
          // First Container
          Padding(
            padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Category Icon Container.
                  Hero(
                    tag: _currentitemm.id,
                    curve: Curves.linear,
                    child: Padding(
                      padding: EdgeInsetsGeometry.only(top: 20),
                      child: Container(
                        width: 100.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                          color: _currentitemm.category.backgroundColor,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Icon(
                            _currentitemm.category.icon,
                            color: _currentitemm.category.baseColor,
                            size: 45.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //Category name Text
                  Padding(
                    padding: EdgeInsetsGeometry.only(top: 20),
                    child: Text(
                      _currentitemm.category.name,
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(fontSize: 23.sp),
                    ),
                  ),
                  //Category Type & Pending  or Completed Status..
                  Padding(
                    padding: EdgeInsetsGeometry.only(top: 10, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Category type
                        Container(
                          decoration: BoxDecoration(
                            color: _currentitemm.category.backgroundColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsetsGeometry.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: Text(
                                _currentitemm.category.name,
                                style: GoogleFonts.poppins(
                                  color: _currentitemm.category.baseColor,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        //Pending or completed.
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsetsGeometry.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: Text(
                                _currentitemm.status ? "Purchased" : "Pending",
                                style: GoogleFonts.poppins(
                                  color: Colors.orange,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Second Container
          Padding(
            padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Item_Information(title: "Quantity",information: _currentitemm.quantity.toString(),),
                  Divider(),
                  Item_Information(title: "Category",information: _currentitemm.category.name,),
                  Divider(),
                  Item_Information(title: "Notes",information: _currentitemm.notes,),
                  Divider(),
                  Item_Information(title: "Status",information: _currentitemm.status?"Purchased":"Pending Purchase",),
                  Divider(),
                  Item_Information(title: "Added",information: formatItemTime(_currentitemm.addedTime)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Item_Information extends StatelessWidget {
  Item_Information({required this.title,required this.information, super.key});

  final String title;
  final String information;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10,vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 10,vertical: 5),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontWeight: FontWeight.w700,
                fontSize: 12.sp,
              ),
            ),
          ),
         Padding(
             padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
             child: Text(information,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 12.sp),))
        ],
      ),
    );
  }
}

