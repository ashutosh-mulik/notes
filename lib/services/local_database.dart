import 'dart:convert';
import 'dart:math';

import 'package:hive_flutter/adapters.dart';
import 'package:logger/logger.dart';
import 'package:notes/services/models/note.dart';
import 'package:uuid/uuid.dart';

class LocalDatabase {
  late Box box;
  final uuid = const Uuid();

  /// Initialize database
  Future initDB() async => box = await Hive.openBox("Notes_Database");

  /// Save note into local file
  void saveNote(Note note) => box.put(uuid.v4(), note.toJson().toString());

  /// Get all notes
  Map getNotes() => Map.fromIterables(box.keys, box.values).map((key, value) {
        Logger().d(value);
        return MapEntry(key, Note.fromJson(value));
      });

  /// Close database
  void closeDB() async => box.close();
}
