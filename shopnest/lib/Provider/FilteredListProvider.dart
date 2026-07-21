import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shopnest/DataModel/ItemModel.dart';
import '../DataModel/FilterListModel.dart';
import '../Provider/Providers.dart'; // Make sure this points to your provider file

class Filteredlistprovider extends StateNotifier<Filterlistmodel> {
  final Ref _ref;

  Filteredlistprovider(this._ref)
      : super(Filterlistmodel(
    FilteredList: _ref.read(AllItemListProvider),
    SelectedCategory: "All",
  ));

  void updateCategoryFilter(String categoryName) {
    List<Itemmodel>  masterItemsList = _ref.read(AllItemListProvider);

    List<Itemmodel> updatedList;
    if (categoryName == "All") {
      updatedList=masterItemsList;
    } else {
      updatedList = masterItemsList.where((item)=>item.category.name.toString().toLowerCase()==categoryName.toString().toLowerCase()).toList();
    }

    state = Filterlistmodel(
      FilteredList: updatedList,
      SelectedCategory: categoryName,
    );
  }
  void getSerchedItemList(String item){
    List<Itemmodel>  masterItemsList = _ref.read(AllItemListProvider);
    List<Itemmodel> updatedList;
    if (item == ""|| item.isEmpty) {
      updatedList=masterItemsList;
    } else {
      final searchquery=item.trim().toString().toLowerCase();
      updatedList = masterItemsList.where((element)=>element.name.toString().toLowerCase().contains(searchquery)).toList();
    }

    state = Filterlistmodel(
      FilteredList: updatedList,
      SelectedCategory:"All",
    );
  }
}
var FilterListProvider=StateNotifierProvider<Filteredlistprovider,Filterlistmodel>((ref){
  return Filteredlistprovider(ref);
});
