// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ItemModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemmodelAdapter extends TypeAdapter<Itemmodel> {
  @override
  final typeId = 0;

  @override
  Itemmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Itemmodel(
      name: fields[1] as String,
      category: fields[2] as ItemCategory,
      quantity: fields[3] as String,
      notes: fields[4] as String,
      status: fields[5] as bool,
      addedTime: fields[6] as DateTime,
      id: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Itemmodel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.quantity)
      ..writeByte(4)
      ..write(obj.notes)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.addedTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
