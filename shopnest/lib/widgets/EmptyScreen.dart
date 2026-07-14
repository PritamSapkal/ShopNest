import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopnest/widgets/GreenButton.dart';

class Emptyscreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 350.w,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10,0,10,0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                    color: Colors.green.withOpacity(0.1),
                    blurRadius: 20,
                    spreadRadius: 10
                  ),],
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: FaIcon(FontAwesomeIcons.basketShopping,size: 80,color:Colors.green,),
                ),
              ),
              SizedBox(height: 20.h,),
              Text("No Shopping Items Yet",style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20.sp),textAlign: TextAlign.center,),
              Text("Start building your shopping list by adding your first item.",style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 13.sp),textAlign: TextAlign.center,),
              SizedBox(height: 30.h,),
              Greenbutton(ButtonHeight: 50.h, ButtonWidth: 200.w, title: "+ Add First Item", textsize: 15.sp, onTap: (){})
            ],
          ),
        ),
      ),
    );
  }
}