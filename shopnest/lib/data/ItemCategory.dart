import 'package:flutter/material.dart';

import '../DataModel/CategoryUiProps.dart';

final Map<ItemCategory, CategoryUiProps> categoryDetails = {
  ItemCategory.all: CategoryUiProps(
    name: 'All',
    icon: Icons.grid_view_rounded,
    baseColor: const Color(0xFF6C7A89),
    backgroundColor: const Color(0xFF6C7A89).withOpacity(0.1),
  ),
  ItemCategory.vegetables: CategoryUiProps(
    name: 'Vegetables',
    icon:Icons.energy_savings_leaf_outlined,
    baseColor: Colors.green,
    backgroundColor: Colors.green.withOpacity(0.08),
  ),
  ItemCategory.fruits: CategoryUiProps(
    name: 'Fruits',
    icon: Icons.apple_sharp,
    baseColor: Colors.redAccent,
    backgroundColor: Colors.redAccent.withOpacity(0.08),
  ),
  ItemCategory.dairyAndEggs: CategoryUiProps(
    name: 'Dairy',
    icon: Icons.water_drop_outlined,
    baseColor: Colors.blue,
    backgroundColor: Colors.blue.withOpacity(0.08),
  ),
  ItemCategory.bakery: CategoryUiProps(
    name: 'Bakery',
    icon: Icons.bakery_dining_outlined,
    baseColor: Colors.orange,
    backgroundColor: Colors.orange.withOpacity(0.08),
  ),
  ItemCategory.meatAndSeafood: CategoryUiProps(
    name: 'Meat & Seafood',
    icon: Icons.kebab_dining_outlined,
    baseColor: Colors.red,
    backgroundColor: Colors.red.withOpacity(0.08),
  ),
  ItemCategory.staplesAndGrains: CategoryUiProps(
    name: 'Staples',
    icon:Icons.grain_outlined,
    baseColor: Colors.brown,
    backgroundColor: Colors.brown.withOpacity(0.08),
  ),
  ItemCategory.snacksAndSweets: CategoryUiProps(
    name: 'Snacks & Sweets',
    icon:Icons.cookie_outlined,
    baseColor: Colors.purple,
    backgroundColor: Colors.purple.withOpacity(0.08),
  ),
  ItemCategory.beverages: CategoryUiProps(
    name: 'Beverages',
    icon:Icons.local_drink_outlined,
    baseColor: Colors.blueAccent,
    backgroundColor: Colors.blueAccent.withOpacity(0.08),
  ),
  ItemCategory.householdAndClean: CategoryUiProps(
    name: 'Household',
    icon: Icons.cleaning_services_outlined,
    baseColor: Colors.teal,
    backgroundColor: Colors.teal.withOpacity(0.08),
  ),
  ItemCategory.healthAndCare: CategoryUiProps(
    name: 'Health & Care',
    icon:Icons.vaccines_outlined,
    baseColor: Colors.pink,
    backgroundColor: Colors.pink.withOpacity(0.08),
  ),
  ItemCategory.others: CategoryUiProps(
    name: 'Others',
    icon:Icons.pending_outlined,
    baseColor: Colors.blueGrey,
    backgroundColor: Colors.blueGrey.withOpacity(0.08),
  ),
};