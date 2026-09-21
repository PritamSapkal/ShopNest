import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';

part 'CategoryUiProps.g.dart';
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

@HiveType(typeId: 1)
class CategoryUiProps {
  CategoryUiProps({required this.name,required this.icon,required this.baseColor,required this.backgroundColor});

  @HiveField(0)
  final String name;

  @HiveField(1)
  final IconData icon;

  @HiveField(2)
  final Color baseColor;

  @HiveField(3)
  final Color backgroundColor;
}