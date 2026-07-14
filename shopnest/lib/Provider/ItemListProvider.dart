import 'package:flutter_riverpod/legacy.dart';
import '../DataModel/ItemModel.dart';
import '../data/ItemList.dart';

class Itemlistprovider extends StateNotifier<List<Itemmodel>>{
  Itemlistprovider():super(dummyShoppingList);

  void getCategoryList(String category){
    List<Itemmodel> filteredList=dummyShoppingList;
    if(category.isNotEmpty){
      filteredList=dummyShoppingList.where((item)=>item.category.name.contains(category)).toList();
    }
    state=filteredList;
  }
}

var ItemList=StateNotifierProvider<Itemlistprovider,List<Itemmodel>>((ref){
return Itemlistprovider();
});