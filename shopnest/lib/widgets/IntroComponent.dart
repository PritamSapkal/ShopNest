import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Introcomponent  extends StatelessWidget{
  Introcomponent({required this.imagePath,required this.title,required this.subtitle,super.key});
  final String imagePath;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Image.asset(imagePath,height: 300.h,width: 150.w,),
         SizedBox(height: 10.h,),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text(title,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 30.sp),textAlign: TextAlign.center,),
         ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(subtitle,style:Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 15.sp),textAlign: TextAlign.center,),
        )
      ],
    );
  }
}