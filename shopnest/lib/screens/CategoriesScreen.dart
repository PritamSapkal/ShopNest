import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../DataModel/CategoryUiProps.dart';
import '../Provider/Providers.dart';
import '../widgets/CategoryContainer.dart';

class Categoriesscreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<Categoriesscreen> createState() => _CategoriesscreenState();
}

class _CategoriesscreenState extends ConsumerState<Categoriesscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds:400),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0, ).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    _animationController.reset();
    _animationController.forward(from: 0.5);
    final Map<ItemCategory, CategoryUiProps> CategoryMap= ref.watch(CategoryListProvider);
    List<ItemCategory> KeyList= CategoryMap.keys.toList();
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SizedBox(
        width: double.infinity,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // All Category Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Text("All Categories",style: GoogleFonts.poppins(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 12.sp),textAlign: TextAlign.left,),
            ),
            // Category gridView
            Expanded(
              child: SizedBox(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 0,crossAxisSpacing: 0,),
                  itemBuilder: (context, index) {
                    var currentCategory=KeyList[index+1];
                    return Categorycontainer(currentKey: currentCategory,);
                  },
                 physics: ClampingScrollPhysics(),
                  itemCount:KeyList.length-1 ,
                  
                ),
              ),
            ),
          ],
        ),


      ),
    );
  }
}
