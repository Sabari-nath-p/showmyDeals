// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hiveDataModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartDataModelAdapter extends TypeAdapter<CartDataModel> {
  @override
  final int typeId = 0;

  @override
  CartDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartDataModel(
      ImageUrl: fields[4] as String?,
      itemID: fields[1] as String?,
      from: fields[5] as String?,
      itemName: fields[0] as String?,
      offerID: fields[2] as String?,
      offerName: fields[3] as String?,
      to: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CartDataModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.itemName)
      ..writeByte(1)
      ..write(obj.itemID)
      ..writeByte(2)
      ..write(obj.offerID)
      ..writeByte(3)
      ..write(obj.offerName)
      ..writeByte(4)
      ..write(obj.ImageUrl)
      ..writeByte(5)
      ..write(obj.from)
      ..writeByte(6)
      ..write(obj.to);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
