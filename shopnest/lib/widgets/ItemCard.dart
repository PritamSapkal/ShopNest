import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../DataModel/ItemModel.dart';
import '../Provider/MasterItemList.dart';
import '../data/ItemCategory.dart';
import '../screens/Add_New_item_screen.dart';
import '../screens/ItemDetailPage.dart';
import '../widgets/SuccessSnackBar.dart';

class Itemcard extends ConsumerStatefulWidget {
  const Itemcard({
    required this.currentItem,
    super.key,
  });

  final Itemmodel currentItem;

  @override
  ConsumerState<Itemcard> createState() => _ItemCardState();
}

class _ItemCardState extends ConsumerState<Itemcard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutBack,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.15, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutCubic,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoryUi = categoryDetails[widget.currentItem.category]!;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(30.r),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ItemdetailPage(
                      currentitemm: widget.currentItem,
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  borderRadius: BorderRadius.circular(30.r),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(5.w),
                  child: Row(
                    children: [
                      // Category Icon
                      Hero(
                        tag: widget.currentItem.id,
                        curve: Curves.linear,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            width: 45.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                              color: categoryUi.backgroundColor,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Center(
                              child: Icon(
                                categoryUi.icon,
                                color: categoryUi.baseColor,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 10.w),

                      // Item Information
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.currentItem.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                fontSize: 15.sp,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              "${widget.currentItem.category.name} · ${widget.currentItem.quantity}",
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              widget.currentItem.notes,
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

                      SizedBox(width: 5.w),

                      // Actions (Checkbox + Edit/Delete)
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Checkbox(
                              value: widget.currentItem.status,
                              activeColor: Colors.green,
                              shape: const CircleBorder(),
                              checkColor: Colors.white,
                              onChanged: (bool? _) {
                                ref
                                    .read(masteritemlistProvider.notifier)
                                    .toggleStatus(widget.currentItem.id);
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Edit
                                IconButton(
                                  visualDensity: VisualDensity.compact,
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(
                                    minWidth: 28.w,
                                    minHeight: 28.h,
                                  ),
                                  style: IconButton.styleFrom(
                                    backgroundColor:
                                    Colors.grey.withValues(alpha: 0.2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.grey,
                                    size: 13.sp,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AddNewItemScreen(
                                          appbarTitle: "Edit Item",
                                          existingItem: widget.currentItem,
                                        ),
                                      ),
                                    );
                                  },
                                ),

                                SizedBox(width: 8.w),

                                // Delete
                                IconButton(
                                  visualDensity: VisualDensity.compact,
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(
                                    minWidth: 28.w,
                                    minHeight: 28.h,
                                  ),
                                  style: IconButton.styleFrom(
                                    backgroundColor:
                                    Colors.red.withValues(alpha: 0.2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                  icon: Icon(
                                    Icons.delete_outline_sharp,
                                    color: Colors.redAccent,
                                    size: 15.sp,
                                  ),
                                  onPressed: () {
                                    ref
                                        .read(masteritemlistProvider.notifier)
                                        .deleteItemById(widget.currentItem.id);

                                    if (!context.mounted) return;

                                    ScaffoldMessenger.of(context)
                                      ..clearSnackBars()
                                      ..showSnackBar(
                                        SuccessSnackBar.show(
                                          "Item Deleted successfully!",
                                        ),
                                      );
                                  },
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
            ),
          ),
        ),
      ),
    );
  }
}