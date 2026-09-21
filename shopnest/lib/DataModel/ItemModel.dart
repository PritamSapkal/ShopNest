import 'package:uuid/uuid.dart';
import 'CategoryUiProps.dart';
import 'package:hive_ce/hive.dart';
part 'ItemModel.g.dart';

@HiveType(typeId: 0)
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

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final CategoryUiProps category;

  @HiveField(3)
  final String quantity;

  @HiveField(4)
  final String notes;

  @HiveField(5)
  final bool status;

  @HiveField(6)
  final DateTime  addedTime;

  Itemmodel copyWith({
    String? name,
    CategoryUiProps? category,
    String? quantity,
    String? notes,
    bool? status,
    DateTime ? addedTime,
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