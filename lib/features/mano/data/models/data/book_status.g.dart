// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookStatusAdapter extends TypeAdapter<BookStatus> {
  @override
  final typeId = 5326;

  @override
  BookStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return BookStatus.continuing;
      case 1:
        return BookStatus.stopped;
      case 2:
        return BookStatus.finished;
      default:
        return BookStatus.continuing;
    }
  }

  @override
  void write(BinaryWriter writer, BookStatus obj) {
    switch (obj) {
      case BookStatus.continuing:
        writer.writeByte(0);
      case BookStatus.stopped:
        writer.writeByte(1);
      case BookStatus.finished:
        writer.writeByte(2);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
