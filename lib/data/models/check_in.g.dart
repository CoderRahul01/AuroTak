// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CheckInAdapter extends TypeAdapter<CheckIn> {
  @override
  final int typeId = 0;

  @override
  CheckIn read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CheckIn(
      date: fields[0] as DateTime,
      energy: fields[1] as int,
      focus: fields[2] as int,
      mood: fields[3] as int,
      note: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CheckIn obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.energy)
      ..writeByte(2)
      ..write(obj.focus)
      ..writeByte(3)
      ..write(obj.mood)
      ..writeByte(4)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckInAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
