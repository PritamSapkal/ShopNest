import 'package:flutter_riverpod/legacy.dart';
import 'package:shopnest/DataModel/ItemModel.dart';

class Masteritemlist extends StateNotifier<List<Itemmodel>> {
  Masteritemlist() : super([]);

  void addItem(Itemmodel item) {
    state = [...state, item];
  }

  // Deleting using index or unique ID avoids reference equality bugs
  void deleteItem(int index) {
    if (index >= 0 && index < state.length) {
      final updatedList = List<Itemmodel>.from(state)..removeAt(index);
      state = updatedList;
    }
  }

  void updateItem(Itemmodel item, int index) {
    if (index >= 0 && index < state.length) {
      state = [
        for (int i = 0; i < state.length; i++)
          if (i == index) item else state[i],
      ];
    }
  }

void toggleStatus(int index) {
         if (index >= 0 && index < state.length) {
           final currentItem = state[index];
         updateItem( Itemmodel( name: currentItem.name,  category: currentItem.category, quantity: currentItem.quantity,  notes: currentItem.notes,  status: !currentItem.status, addedTime: currentItem.addedTime,),
         index,);
}}}

final masteritemlistProvider =
StateNotifierProvider<Masteritemlist, List<Itemmodel>>((ref) {
  return Masteritemlist();
});