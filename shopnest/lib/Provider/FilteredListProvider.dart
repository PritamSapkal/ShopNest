import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shopnest/DataModel/ItemModel.dart';
import '../DataModel/FilterListModel.dart';
import '../Provider/Providers.dart'; // Ensure AllItemListProvider points to your master list provider

class Filteredlistprovider extends StateNotifier<Filterlistmodel> {
  final Ref _ref;
  String _currentSearchQuery = '';

  Filteredlistprovider(this._ref)
    : super(
        Filterlistmodel(
          FilteredList: _ref.read(AllItemListProvider),
          SelectedCategory: "All",
        ),
      ) {
    // Listens to master list changes (adds, deletes, checkbox toggles)
    // and re-applies the active filters automatically.
    _ref.listen<List<Itemmodel>>(AllItemListProvider, (previous, next) {
      Future(() {
        _applyCurrentFilter();
      });
    });
  }

  void _applyCurrentFilter() {
    final masterItemsList = _ref.read(AllItemListProvider);

    List<Itemmodel> updatedList = masterItemsList;

    // Apply Category Filter
    if (state.SelectedCategory != "All") {
      updatedList = updatedList
          .where(
            (item) =>
                item.category.name.toString().toLowerCase() ==
                state.SelectedCategory.toLowerCase(),
          )
          .toList();
    }

    // Apply Search Query if active
    if (_currentSearchQuery.isNotEmpty) {
      updatedList = updatedList
          .where(
            (item) => item.name.toString().toLowerCase().contains(
              _currentSearchQuery,
            ),
          )
          .toList();
    }

    state = Filterlistmodel(
      FilteredList: updatedList,
      SelectedCategory: state.SelectedCategory,
    );
  }

  void updateCategoryFilter(String categoryName) {
    state = Filterlistmodel(
      FilteredList: state.FilteredList,
      SelectedCategory: categoryName,
    );
    _applyCurrentFilter();
  }

  void getSerchedItemList(String item) {
    _currentSearchQuery = item.trim().toLowerCase();
    _applyCurrentFilter();
  }

  void setItemCategortoAll() {
    _currentSearchQuery = '';
    state = Filterlistmodel(
      FilteredList: state.FilteredList,
      SelectedCategory: 'All',
    );
    _applyCurrentFilter();
  }
}

final FilterListProvider =
    StateNotifierProvider<Filteredlistprovider, Filterlistmodel>((ref) {
      return Filteredlistprovider(ref);
    });
