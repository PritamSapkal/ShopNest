import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../DataModel/CategoryUiProps.dart';
import '../data/ItemCategory.dart';
// Handle the intro screen page index
var IntroIndexProvider=StateProvider<int>((ref){
  return 0;
});
// Handle the Sign in page Obscure text
var ObscureProvider= StateProvider<bool>((ref){
  return true;
});
// Handle the signup page password field Obscure
var SignUpPageObscureProvider=StateProvider<bool>((ref){
  return true;
});
// Handle the index of the BottomApp bar
var bottomAppbarindexProvider=StateProvider<int>((ref){
  return 0;
});
// only to provide the category Map
var CategoryListProvider =Provider<Map<ItemCategory, CategoryUiProps>>((ref){
  return categoryDetails;
});