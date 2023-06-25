// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UrlEntityAdapter extends TypeAdapter<UrlEntity> {
  @override
  final int typeId = 0;

  @override
  UrlEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UrlEntity(
      urlString: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UrlEntity obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.urlString);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UrlEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
