import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shopnest/DataModel/ItemModel.dart';

class Masteritemlist extends StateNotifier<List<Itemmodel>> {
  Masteritemlist() : super([]);

  void addItem(Itemmodel item) {
    state = [...state, item];
  }

  void deleteItem(Itemmodel item) {
    state = state.where((element) => element != item).toList();
  }

  void updateItem(Itemmodel item, int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) item else state[i],
    ];
  }
}

final masteritemlistProvider = StateNotifierProvider<Masteritemlist, List<Itemmodel>>((ref) {
  return Masteritemlist();
});