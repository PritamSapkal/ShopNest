import 'package:flutter_riverpod/legacy.dart';

var IntroIndexProvider=StateProvider<int>((ref){
  return 0;
});
var ObscureProvider= StateProvider<bool>((ref){
  return true;
});
var SignUpPageObscureProvider=StateProvider<bool>((ref){
  return true;
});