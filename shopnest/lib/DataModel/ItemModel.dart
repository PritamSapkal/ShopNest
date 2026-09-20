// lib/DataModel/ItemModel.dart
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
    String? id,
  }) : id = id ?? const Uuid().v4();

  final String id;
  final String name;
  final CategoryUiProps category;
  final dynamic quantity;
  final String notes;
  final bool status;
  final TimeOfDay addedTime;

  Itemmodel copyWith({
    String? name,
    CategoryUiProps? category,
    dynamic quantity,
    String? notes,
    bool? status,
    TimeOfDay? addedTime,
  }) {
    return Itemmodel(
      id: id, // Retains original ID!
      name: name ?? this.name,
      category: category ?? this.category,
      quantity: quantity ?? this.quantity,
      notes: notes ?? this.notes,
      status: status ?? this.status,
      addedTime: addedTime ?? this.addedTime,
    );
  }
}