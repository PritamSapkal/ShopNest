// lib/Provider/MasterItemList.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shopnest/DataModel/ItemModel.dart';

class Masteritemlist extends StateNotifier<List<Itemmodel>> {
  Masteritemlist() : super([]);

  void addItem(Itemmodel item) {
    state = [...state, item];
  }

  void deleteItemById(String id) {
    state = state.where((item) => item.id != id).toList();
  }

  void updateItem(Itemmodel updatedItem) {
    state = [
      for (final item in state)
        if (item.id == updatedItem.id) updatedItem else item,
    ];
  }

  void toggleStatus(String id) {
    state = [
      for (final item in state)
        if (item.id == id)
          item.copyWith(status: !item.status)
        else
          item,
    ];
  }
}

final masteritemlistProvider =
StateNotifierProvider<Masteritemlist, List<Itemmodel>>((ref) {
  return Masteritemlist();
});