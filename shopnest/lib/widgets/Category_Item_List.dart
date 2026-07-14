import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../DataModel/CategoryUiProps.dart';
import '../DataModel/ItemModel.dart';
import '../Provider/ItemListProvider.dart';
import '../Provider/Providers.dart';
import 'ItemCard.dart';
import 'TextButtonGreen.dart';

class CategoryAndItemList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Itemmodel> itemList= ref.watch(ItemListProvider);// Item List
    Map<ItemCategory, CategoryUiProps> _CategoryMap = ref.watch(CategoryListProvider,);
    List<ItemCategory> keyList = _CategoryMap.keys.toList();
    var _selectedCategory=ref.watch(CategoryButtonSelectedProvider);
    return Column(
      children: [
        // Horizontal Category List View
        SizedBox(
          height: 30.h,
          child: ListView.builder(
            itemBuilder: (context, index) {
              var currentkey=keyList[index];
              var mapitem=_CategoryMap[currentkey]!;
              bool _isSelected= _selectedCategory==mapitem.name;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: (){
                    ref.read(CategoryButtonSelectedProvider.notifier).update((state)=>mapitem.name);
                  },
                  borderRadius: BorderRadius.circular(20.r),
                  child: AnimatedContainer(duration: Duration(milliseconds:400),
                    decoration: BoxDecoration(
                      color: _isSelected?mapitem.baseColor:mapitem.backgroundColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                        child: Row(
                          children: [
                            Icon(mapitem.icon,color: _isSelected?Colors.white:mapitem.baseColor,),
                            SizedBox(width: 4.w,),
                            Text(mapitem.name,style: GoogleFonts.poppins(color: _isSelected?Colors.white:mapitem.baseColor,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),),
                ),
              );
            },
            itemCount: keyList.length,
            scrollDirection: Axis.horizontal,
          ),
        ),

        // Shopping List text with item count and See  All text Button
        Row(
          children: [
            SizedBox(width: 10.w,),
            Text("Shopping List",style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 13.sp),),
             SizedBox(width: 3.w,),
            Text("("+"${itemList.length}"+" items)",style: GoogleFonts.poppins(color: Colors.grey,fontWeight: FontWeight.w500),),
            Spacer(),
            Textbuttongreen(text:"See All",textsize:12.sp,OnTap: (){},),
          ],
        ),

        SizedBox(height: 10.h,),

        // Item List
        Expanded(
          child: Container(
            width:double.infinity,
            child: ListView.builder(itemBuilder: (context,index){
              return Padding(
                  padding: EdgeInsetsGeometry.all(10),
                  child: Itemcard(currentitemm: itemList[index]));
            },itemCount:itemList.length,),
          ),
        )
      ],
    );
  }
}
