// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CategoryUiProps.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemCategoryAdapter extends TypeAdapter<ItemCategory> {
  @override
  final typeId = 1;

  @override
  ItemCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ItemCategory.all;
      case 1:
        return ItemCategory.vegetables;
      case 2:
        return ItemCategory.fruits;
      case 3:
        return ItemCategory.dairy;
      case 4:
        return ItemCategory.bakery;
      case 5:
        return ItemCategory.meatAndSeafood;
      case 6:
        return ItemCategory.staplesAndGrains;
      case 7:
        return ItemCategory.snacksAndSweets;
      case 8:
        return ItemCategory.beverages;
      case 9:
        return ItemCategory.householdAndClean;
      case 10:
        return ItemCategory.healthAndCare;
      case 11:
        return ItemCategory.others;
      default:
        return ItemCategory.all;
    }
  }

  @override
  void write(BinaryWriter writer, ItemCategory obj) {
    switch (obj) {
      case ItemCategory.all:
        writer.writeByte(0);
      case ItemCategory.vegetables:
        writer.writeByte(1);
      case ItemCategory.fruits:
        writer.writeByte(2);
      case ItemCategory.dairy:
        writer.writeByte(3);
      case ItemCategory.bakery:
        writer.writeByte(4);
      case ItemCategory.meatAndSeafood:
        writer.writeByte(5);
      case ItemCategory.staplesAndGrains:
        writer.writeByte(6);
      case ItemCategory.snacksAndSweets:
        writer.writeByte(7);
      case ItemCategory.beverages:
        writer.writeByte(8);
      case ItemCategory.householdAndClean:
        writer.writeByte(9);
      case ItemCategory.healthAndCare:
        writer.writeByte(10);
      case ItemCategory.others:
        writer.writeByte(11);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
