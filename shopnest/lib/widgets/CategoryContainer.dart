import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../DataModel/CategoryUiProps.dart';
import '../data/ItemCategory.dart';

class Categorycontainer extends StatelessWidget {
  Categorycontainer({required this.currentKey});

  var currentKey;
  late CategoryUiProps Currentcategory = categoryDetails[currentKey]!;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
      child: InkWell(
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).secondaryHeaderColor,
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 1),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First Conatiner shows teh category icon
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Currentcategory.baseColor,
                      Color.alphaBlend(
                        Colors.white.withOpacity(0.45), // Mixes 35% white overlay into it
                        Currentcategory.baseColor,
                      ),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),
                child: Center(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical:30 ),
                        child: Icon(
                          Currentcategory.icon,
                          color: Colors.white,
                          size: 40.sp,
                        ),
                      ),
                    ),
                  ),
              ),
              Padding(padding:EdgeInsetsGeometry.symmetric(horizontal: 10),child: Text(Currentcategory.name,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 13.sp),)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text("6 Products",style: GoogleFonts.poppins(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 12.sp),textAlign: TextAlign.left,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
