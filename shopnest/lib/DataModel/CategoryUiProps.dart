import 'dart:ui';
import 'package:flutter/material.dart';

enum ItemCategory {
  all,
  vegetables,
  fruits,
  dairyAndEggs,       // Combined Milk, Butter, Cheese, Eggs
  bakery,             // Bread, Buns, Roti
  meatAndSeafood,     // Combined Chicken, Fish, etc.
  staplesAndGrains,   // Rice, Atta, Dal, Oil, Spices
  snacksAndSweets,    // Chips, Biscuits, Chocolates
  beverages,          // Water, Soft drinks, Tea, Coffee
  householdAndClean,  // Detergents, Cleaners, Garbage bags
  healthAndCare,      // Medicines, Baby care, Shampoos, Personal hygiene
  others              // Catch-all fallback
}
class CategoryUiProps {
  CategoryUiProps({required this.name,required this.icon,required this.baseColor,required this.backgroundColor});
  final String name;
  final IconData icon;
  final Color baseColor;
  final Color backgroundColor;
}