import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopnest/DataModel/ItemModel.dart';

import '../DataModel/SpecificCVategoryLIstCla.dart';
import 'Providers.dart';
class Specificcategorylistprovider extends StateNotifier<Specificcvategorylistcla>{
  final Ref _ref;
  Specificcategorylistprovider(this._ref):super(
      Specificcvategorylistcla(filteredList: _ref.watch(AllItemListProvider), TotalItem:_ref.watch(AllItemListProvider).length)
  );
  void getItemListWithCount(String Categoryname){
    List<Itemmodel> completelist=  _ref.read(AllItemListProvider);
    List<Itemmodel> filteredList;
    filteredList=completelist.where((item)=>item.category.name.toLowerCase().toString()==Categoryname.toLowerCase().toString()).toList();
    state=Specificcvategorylistcla(filteredList:filteredList,TotalItem:filteredList.length);
  }
}
var CategorySpecificListProvider =StateNotifierProvider<Specificcategorylistprovider,Specificcvategorylistcla>((ref){
  return Specificcategorylistprovider(ref);
});