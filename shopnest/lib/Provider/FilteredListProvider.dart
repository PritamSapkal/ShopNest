import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shopnest/DataModel/ItemModel.dart';
import '../DataModel/FilterListModel.dart';
import '../Provider/Providers.dart'; // Make sure this points to your provider file

class Filteredlistprovider extends StateNotifier<Filterlistmodel> {
  final Ref _ref;

  // Pass Ref through the constructor
  Filteredlistprovider(this._ref)
      : super(Filterlistmodel(
    FilteredList: _ref.read(AllItemListProvider),
    SelectedCategory: "All",
  ));

  // The function triggered when a category button is clicked
  void updateCategoryFilter(String categoryName) {
    // 1. Get the latest master copy of all items
    List<Itemmodel>  masterItemsList = _ref.read(AllItemListProvider);

    List<Itemmodel> updatedList;

    // 2. Perform filtering logic based on selection
    if (categoryName == "All") {
      updatedList=masterItemsList;
    } else {
      // Compares item categories (adjust item.category according to your model structure)
      updatedList = masterItemsList.where((item)=>item.category.name.toString().toLowerCase()==categoryName.toString().toLowerCase()).toList();
    }

    // 3. Update the state. Riverpod triggers automatic UI updates upon assignment!
    state = Filterlistmodel(
      FilteredList: updatedList,
      SelectedCategory: categoryName,
    );
  }
}
var FilterListProvider=StateNotifierProvider<Filteredlistprovider,Filterlistmodel>((ref){
  return Filteredlistprovider(ref);
});
