import 'package:flutter/material.dart';

import '../DataModel/CategoryUiProps.dart';
import '../DataModel/ItemModel.dart';
import 'ItemCategory.dart';

final List<Itemmodel> dummyShoppingList = [
  Itemmodel(
    name: 'Organic Broccoli',
    category: categoryDetails[ItemCategory.vegetables]!,
    quantity: 2,
    notes: 'Fresh, organic preferred',
    status: false,
    addedTime: const TimeOfDay(hour: 9, minute: 30),
  ),
  Itemmodel(
    name: 'Whole Milk',
    category: categoryDetails[ItemCategory.dairyAndEggs]!,
    quantity: 1,
    notes: '3.5% fat content',
    status: false,
    addedTime: const TimeOfDay(hour: 9, minute: 45),
  ),
  Itemmodel(
    name: 'Sourdough Bread',
    category: categoryDetails[ItemCategory.bakery]!,
    quantity: 1,
    notes: '1 loaf, freshly baked',
    status: true,
    addedTime:  const TimeOfDay(hour: 10, minute: 15),
  ),
  Itemmodel(
    name: 'Gala Apples',
    category: categoryDetails[ItemCategory.fruits]!,
    quantity: 6,
    notes: 'Red ones preferred',
    status: false,
    addedTime: const TimeOfDay(hour: 10, minute: 15),
  ),
  Itemmodel(
    name: 'Free Range Eggs',
    category: categoryDetails[ItemCategory.dairyAndEggs]!,
    quantity: 12,
    notes: 'Size M eggs',
    status: false,
    addedTime: const TimeOfDay(hour: 10, minute: 20),
  ),
  Itemmodel(
    name: 'Sparkling Water',
    category:categoryDetails[ItemCategory.beverages]!,
    quantity: 6,
    notes: 'Lime flavor if available',
    status: false,
    addedTime: const TimeOfDay(hour: 11, minute: 0),
  ),
  Itemmodel(
    name: 'Basmati Rice',
    category:categoryDetails[ItemCategory.staplesAndGrains]!,
    quantity: 1,
    notes: '5kg pack',
    status: false,
    addedTime: const TimeOfDay(hour: 11, minute: 0),
  ),
  Itemmodel(
    name: 'Chocolate Chip Cookies',
    category: categoryDetails[ItemCategory.snacksAndSweets]!,
    quantity: 2,
    notes: 'Dark chocolate',
    status: false,
    addedTime: const TimeOfDay(hour: 11, minute: 15),
  ),
  Itemmodel(
    name: 'Dishwashing Gel',
    category:categoryDetails[ItemCategory.householdAndClean]!,
    quantity: 1,
    notes: 'Lemon fragrance, 500ml',
    status: false,
    addedTime: const TimeOfDay(hour: 11, minute: 30),
  ),
  Itemmodel(
    name: 'Paracetamol Tablets',
    category: categoryDetails[ItemCategory.healthAndCare]!,
    quantity: 1,
    notes: '650mg strip for emergency',
    status: false,
    addedTime: const TimeOfDay(hour: 11, minute: 40),
  ),
  Itemmodel(
    name: 'AA Alkaline Batteries',
    category:categoryDetails[ItemCategory.others]!,
    quantity: 4,
    notes: 'For TV remote control',
    status: true, // Marked as completed/bought
    addedTime: const TimeOfDay(hour: 11, minute: 45),
  ),
  Itemmodel(
    name: 'Greek Yogurt',
    category:categoryDetails[ItemCategory.dairyAndEggs]!,
    quantity: 3,
    notes: 'Blueberry flavor',
    status: false,
    addedTime: const TimeOfDay(hour: 12, minute: 0),
  ),
];