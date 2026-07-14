import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../DataModel/CategoryUiProps.dart';
import '../Provider/Providers.dart';

class CategoriesListhorizontal extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<ItemCategory, CategoryUiProps> _CategoryMap = ref.watch(CategoryListProvider,);
    List<ItemCategory> keyList = _CategoryMap.keys.toList();
    return SizedBox(
        height: 45.h,
      child: ListView.builder(
        itemBuilder: (context, index) {
          var currentkey=keyList[index];
          var mapitem=_CategoryMap[currentkey]!;
          return AnimatedContainer(duration: Duration(milliseconds: 300),
          child: Center(
            child: Row(
              children: [
                mapitem.icon,
                SizedBox(width: 2.w,),
                Text(mapitem.name),
              ],
            ),
          ),);
        },
        itemCount: keyList.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
