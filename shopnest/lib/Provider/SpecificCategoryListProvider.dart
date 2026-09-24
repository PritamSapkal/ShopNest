import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../DataModel/ItemModel.dart';
import 'Providers.dart';

class Specificcategorylistprovider extends StateNotifier<List<Itemmodel>> {
  final Ref ref;
  final String categoryName;

  Specificcategorylistprovider(this.ref, this.categoryName)
    : super(   _getFilteredList(ref.read(AllItemListProvider), categoryName,),
      ) {

    ref.listen<List<Itemmodel>>(AllItemListProvider, (previous, next) {
      final filteredList = _getFilteredList(next, categoryName);
      state = filteredList;
    });
  }

  static List<Itemmodel> _getFilteredList(List<Itemmodel> completeList, String categoryName,) {
    return completeList.where((item) => item.category.name.toLowerCase() == categoryName.toLowerCase(),).toList();
  }

  List<Itemmodel> getFilteredList() {
    return state;
  }
}

final CategorySpecificListProvider = StateNotifierProvider.family<Specificcategorylistprovider, List<Itemmodel>, String>((ref, categoryName) {
      return Specificcategorylistprovider(ref, categoryName);
    });
