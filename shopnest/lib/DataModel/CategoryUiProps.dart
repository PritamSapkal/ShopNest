import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';

part 'CategoryUiProps.g.dart';

@HiveType(typeId: 1)
enum ItemCategory {
  @HiveField(0)
  all,

  @HiveField(1)
  vegetables,

  @HiveField(2)
  fruits,

  @HiveField(3)
  dairy,

  @HiveField(4)
  bakery,

  @HiveField(5)
  meat,

  @HiveField(6)
  kirana,

  @HiveField(7)
  snacksAndSweets,

  @HiveField(8)
  drinks,

  @HiveField(9)
  electronics,

  @HiveField(10)
  household,

  @HiveField(11)
  healthCare,

  @HiveField(12)
  others,
}

class CategoryUiProps {
  CategoryUiProps({
    required this.name,
    required this.icon,
    required this.baseColor,
    required this.backgroundColor,
  });

  final String name;
  final IconData icon;
  final Color baseColor;
  final Color backgroundColor;
}