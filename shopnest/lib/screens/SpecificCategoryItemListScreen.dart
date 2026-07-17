import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopnest/DataModel/ItemModel.dart';

import '../DataModel/CategoryUiProps.dart';
import '../Provider/SpecificCategoryListProvider.dart';
import '../data/ItemCategory.dart';
import '../widgets/ItemCard.dart';

class categoryitemScreen extends ConsumerStatefulWidget {
  categoryitemScreen({required this.MapKey, super.key});

  final ItemCategory MapKey;

  @override
  ConsumerState<categoryitemScreen> createState() => _categoryitemScreenState();
}

class _categoryitemScreenState extends ConsumerState<categoryitemScreen> {
  @override
  void initState() {
    super.initState();

    // This schedules the execution to happen immediately after the build phase completes
    Future.microtask(() {
      ref
          .read(CategorySpecificListProvider.notifier)
          .getItemListWithCount(categoryDetails[widget.MapKey]!.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    // get the Category data from th map
    final CategoryUiProps currentcategory = categoryDetails[widget.MapKey]!;
    // get the particular category list
    List<Itemmodel> currentcategorylist = ref
        .watch(CategorySpecificListProvider)
        .filteredList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        iconTheme: IconThemeData(color: Theme.of(context).iconTheme.color),

        // wrap th hero widget to the category icon and the category name
        title: Hero(
          tag: widget.MapKey,

          child: Row(
            children: [
              // category Icon
              Container(
                width: 30.w,
                height: 30.w,
                decoration: BoxDecoration(
                  color: currentcategory.backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  currentcategory.icon,
                  color: currentcategory.baseColor,
                ),
              ),

              SizedBox(width: 10.w),
              // Category Name
              Text(
                currentcategory.name,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(fontSize: 15.sp),
              ),
            ],
          ),
        ),
        // total number of the item in the selected category count
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 30.w,
              height: 30.w,
              decoration: BoxDecoration(
                color: currentcategory.backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  currentcategorylist.length.toString(),
                  style: GoogleFonts.poppins(
                    color: currentcategory.baseColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      body: currentcategorylist.length == 0
          ?// List empty text insted of the list
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
            )
          : //Category Item List
      Column(
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: AnimationLimiter(
                      key: ValueKey<String>(widget.MapKey.toString()),
                      child: ListView.builder(
                        key: ValueKey<String>(widget.MapKey.toString()),
                        physics: const BouncingScrollPhysics(),
                        // Gives a premium, smooth scrolling feel
                        itemCount: currentcategorylist.length,
                        itemBuilder: (context, index) {
                          // 2. Configure the sequential item stagger timing
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              // Softly floats the item upward from below
                              child: FadeInAnimation(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  // Fixed the typo from 'EdgeInsetsGeometry' to 'EdgeInsets'
                                  child: Itemcard(
                                    currentitemm: currentcategorylist[index],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
