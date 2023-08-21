// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class APIUserAdapter extends TypeAdapter<APIUser> {
  @override
  final int typeId = 1;

  @override
  APIUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return APIUser(
      token: fields[0] as String?,
      type: fields[1] as String?,
      email: fields[2] as String?,
      role: fields[3] as String?,
      idUser: fields[4] as int?,
      message: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, APIUser obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.role)
      ..writeByte(4)
      ..write(obj.idUser)
      ..writeByte(5)
      ..write(obj.message);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is APIUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
