import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'CategoryUiProps.dart';
class Itemmodel {
  Itemmodel({
    required this.name,
    required this.category,
    required this.quantity,
    required this.notes,
    required this.status,
    required this.addedTime,
  }):id=Uuid().v4();

  final String name;
  final CategoryUiProps category;
  final dynamic quantity;
  final String notes;
  final bool status;
  final TimeOfDay addedTime;
  final String id;
}
