// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vault_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VaultItemAdapter extends TypeAdapter<VaultItem> {
  @override
  final int typeId = 0;

  @override
  VaultItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VaultItem(
      title: fields[0] as String,
      secret: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, VaultItem obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.secret);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VaultItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
