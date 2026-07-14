import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../DataModel/ItemModel.dart';

class Itemcard extends StatelessWidget{
  Itemcard({required this._currentitemm,super.key});
  Itemmodel _currentitemm;
  late String _unit= _currentitemm.category.name=="Dairy" ?" L":" pcs";
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.backgroundColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 5,spreadRadius: 2)]
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Row(
          children: [
            //Category Icon Container.
            Container(
              width: 50.w,height: 50.h,
              decoration: BoxDecoration(
                color: _currentitemm.category.backgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Icon(_currentitemm.category.icon,color: _currentitemm.category.baseColor,),
              ),
            ),

            SizedBox(width:10.w,),
            //item Name Category Name, Notes & Quantity
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_currentitemm.name,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize:17),),
                  Text("${_currentitemm.category.name} . ${_currentitemm.quantity}"+"${_unit}",style:GoogleFonts.poppins(color: Colors.grey,fontSize: 12.sp,fontWeight: FontWeight.w400),maxLines: 1,overflow: TextOverflow.ellipsis,),
                  Text(_currentitemm.notes,style:GoogleFonts.poppins(color: Colors.grey,fontSize: 11.sp,fontWeight: FontWeight.w400),maxLines: 1,overflow: TextOverflow.ellipsis,),
                ],
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(width: 20.w,height: 20.h,color: Colors.grey,),
                    Container(width: 40.w,height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(width: 20.w,height: 20.h,color: Colors.grey,),
                        SizedBox(width: 5.w,),
                        Container(width: 20.w,height: 20.h,color: Colors.grey,),
                      ],
                    )
                  ],
            )),

          ],
        ),
      ),
    );
  }
}