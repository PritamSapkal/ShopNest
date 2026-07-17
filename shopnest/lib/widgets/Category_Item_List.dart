import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import '../DataModel/CategoryUiProps.dart';
import '../DataModel/ItemModel.dart';
import '../Provider/FilteredListProvider.dart';
import '../Provider/Providers.dart';
import 'ItemCard.dart';
import 'TextButtonGreen.dart';

class CategoryAndItemList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Filtered List
    List<Itemmodel> itemList= ref.watch(FilterListProvider).FilteredList;
    // Selected Category name
    var _selectedCategory=ref.watch(FilterListProvider).SelectedCategory;
    Map<ItemCategory, CategoryUiProps> _CategoryMap = ref.watch(CategoryListProvider,);
    List<ItemCategory> keyList = _CategoryMap.keys.toList();
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
                   ref.read(FilterListProvider.notifier).updateCategoryFilter(mapitem.name);
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
        itemList.isEmpty?Spacer():SizedBox.shrink(),
        // Item List wrapped with Staggered Animations
        itemList.isEmpty?
            // empty text if teh list is teh empty
        Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "We couldn't find any products in this category right now.",
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(fontSize: 13.sp),
                textAlign: TextAlign.center,
              ),
            ),
          ):
        // Item List
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: AnimationLimiter(
              key: ValueKey<String>(_selectedCategory),
              child: ListView.builder(
                key: ValueKey<String>(_selectedCategory),
                physics: const BouncingScrollPhysics(), // Gives a premium, smooth scrolling feel
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  // 2. Configure the sequential item stagger timing
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50.0, // Softly floats the item upward from below
                      child: FadeInAnimation(
                        child: Padding(
                          padding: const EdgeInsets.all(10), // Fixed the typo from 'EdgeInsetsGeometry' to 'EdgeInsets'
                          child: Itemcard(currentitemm: itemList[index]),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),

        itemList.isEmpty?Spacer():SizedBox.shrink(),
      ],
    );
  }
}
