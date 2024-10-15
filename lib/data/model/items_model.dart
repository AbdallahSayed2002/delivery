import 'package:hive/hive.dart';

part 'items_model.g.dart';

@HiveType(typeId: 1)
class ItemsModel {
  @HiveField(0)
  final List<String> image;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? title;

  @HiveField(3)
  final double? price;

  @HiveField(4)
  final String? type;

  @HiveField(5)
  final int id;

  @HiveField(6)
  final String? dec;

  @HiveField(7)
  final int? numberOfItem;

  @HiveField(8)
  final int? rating;

  @HiveField(9)
  int? quantity;

  ItemsModel({
    required this.image,
    this.name,
    this.title,
    this.price,
    this.type,
    required this.id,
    this.dec,
    this.numberOfItem,
    this.rating,
    this.quantity = 1,
  });
}
