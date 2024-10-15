// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemsModelAdapter extends TypeAdapter<ItemsModel> {
  @override
  final int typeId = 1;

  @override
  ItemsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemsModel(
      image: (fields[0] as List).cast<String>(),
      name: fields[1] as String?,
      title: fields[2] as String?,
      price: fields[3] as double?,
      type: fields[4] as String?,
      id: fields[5] as int,
      dec: fields[6] as String?,
      numberOfItem: fields[7] as int?,
      rating: fields[8] as int?,
      quantity: fields[9] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ItemsModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(6)
      ..write(obj.dec)
      ..writeByte(7)
      ..write(obj.numberOfItem)
      ..writeByte(8)
      ..write(obj.rating)
      ..writeByte(9)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
