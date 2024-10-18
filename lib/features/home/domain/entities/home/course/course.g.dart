// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CourseEntityAdapter extends TypeAdapter<CourseEntity> {
  @override
  final int typeId = 1;

  @override
  CourseEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CourseEntity(
      courseId: fields[0] as String?,
      author: fields[1] as String?,
      title: fields[2] as String?,
      links: (fields[3] as List?)?.cast<CourselinkEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, CourseEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.courseId)
      ..writeByte(1)
      ..write(obj.author)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.links);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
