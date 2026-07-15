import 'ItemModel.dart';

class Filterlistmodel {
  Filterlistmodel({required this.FilteredList,required this.SelectedCategory});
  final List<Itemmodel> FilteredList;
  final String SelectedCategory;
}