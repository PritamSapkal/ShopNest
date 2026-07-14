import 'package:flutter_riverpod/legacy.dart';
import '../DataModel/ItemModel.dart';
import '../data/ItemList.dart';

class ItemlistproviderClass extends StateNotifier<List<Itemmodel>>{
  ItemlistproviderClass():super(dummyShoppingList);

  void getCategoryList(String category){
    List<Itemmodel> filteredList=dummyShoppingList;
    if(category.isNotEmpty){
      filteredList=dummyShoppingList.where((item)=>item.category.name.contains(category)).toList();
    }
    state=filteredList;
  }
}

var ItemListProvider=StateNotifierProvider<ItemlistproviderClass,List<Itemmodel>>((ref){
return ItemlistproviderClass();
});