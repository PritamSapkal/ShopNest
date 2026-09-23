import 'package:flutter_riverpod/legacy.dart';
import 'package:shopnest/DataModel/ItemModel.dart';
import 'package:hive_ce/hive.dart';

class Masteritemlist extends StateNotifier<List<Itemmodel>> {

  final Box<Itemmodel> _itemsBox;// itembox
  Masteritemlist({required this._itemsBox}) : super(_itemsBox.values.toList());
// first reads teh all the avalable value in the box means  in the local storage
  void addItem(Itemmodel item) {

    state = [...state, item];

    _itemsBox.put(item.id, item);

  }

  void deleteItemById(String id) {
    state = state.where((item) => item.id != id).toList();
    _itemsBox.delete(id);
  }

  void updateItem(Itemmodel updatedItem) {
    state = [
      for (final item in state)
        if (item.id == updatedItem.id) updatedItem else item,
    ];
    _itemsBox.put(updatedItem.id, updatedItem);
  }

  void toggleStatus(String id) {
    final updatedList = [
      for (final item in state)
        if (item.id == id)
          item.copyWith(status: !item.status)
        else
          item,
    ];

    state = updatedList;

    final updatedItem = updatedList.firstWhere(
          (item) => item.id == id,
    );

    _itemsBox.put(id, updatedItem);
  }


  // used to clear all the items data
  Future<void> clearAllItems() async {
    await _itemsBox.clear();
    state = [];
  }
}

final masteritemlistProvider =
StateNotifierProvider<Masteritemlist, List<Itemmodel>>((ref) {
  final box = Hive.box<Itemmodel>('items');
  return Masteritemlist(itemsBox: box);
});