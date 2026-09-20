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

class CategoryAndItemList extends ConsumerStatefulWidget {
  const CategoryAndItemList({super.key});

  @override
  ConsumerState<CategoryAndItemList> createState() =>
      _CategoryAndItemListState();
}

class _CategoryAndItemListState extends ConsumerState<CategoryAndItemList> {
  final ScrollController _categoryScrollController = ScrollController();

  @override
  void dispose() {
    _categoryScrollController.dispose();
    super.dispose();
  }

  void _scrollToFirstCategory() {
    if (_categoryScrollController.hasClients) {
      _categoryScrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Automatically updates on any toggle / delete / category change
    final filterState = ref.watch(FilterListProvider);
    final itemList = filterState.FilteredList;
    final selectedCategory = filterState.SelectedCategory;
    final categoryMap = ref.watch(CategoryListProvider);
    final keyList = categoryMap.keys.toList();

    return Column(
      children: [
        // Horizontal Category List View
        SizedBox(
          height: 34.h,
          child: ListView.builder(
            controller: _categoryScrollController,
            scrollDirection: Axis.horizontal,
            itemCount: keyList.length,
            itemBuilder: (context, index) {
              final currentKey = keyList[index];
              final mapItem = categoryMap[currentKey]!;
              final isSelected = selectedCategory == mapItem.name;

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: InkWell(
                  onTap: () {
                    ref
                        .read(FilterListProvider.notifier)
                        .updateCategoryFilter(mapItem.name);

                    if (mapItem.name.toLowerCase() == 'all') {
                      _scrollToFirstCategory();
                    }
                  },
                  borderRadius: BorderRadius.circular(20.r),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? mapItem.baseColor
                          : mapItem.backgroundColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          mapItem.icon,
                          size: 16.sp,
                          color: isSelected ? Colors.white : mapItem.baseColor,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          mapItem.name,
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: isSelected
                                ? Colors.white
                                : mapItem.baseColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        SizedBox(height: 12.h),

        // Header
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            children: [
              Text(
                "Shopping List",
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(fontSize: 14.sp),
              ),
              SizedBox(width: 5.w),
              Text(
                "(${itemList.length} items)",
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Textbuttongreen(
                text: "See All",
                textsize: 12.sp,
                OnTap: () {
                  ref.read(FilterListProvider.notifier).setItemCategortoAll();
                  _scrollToFirstCategory();
                },
              ),
            ],
          ),
        ),

        SizedBox(height: 8.h),

        // List Body
        Expanded(
          child: itemList.isEmpty
              ? Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      "We couldn't find any products in this category right now.",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 13.sp,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: itemList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 6.h,
                      ),
                      child: Itemcard(
                        key: ValueKey(itemList[index].id),
                        // Key helps smooth animation on delete
                        currentitemm: itemList[index],
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
