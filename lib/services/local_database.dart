import 'package:hive_flutter/adapters.dart';
import 'package:notes/services/models/note.dart';

class LocalDatabase {
  late Box box;

  /// Initialize database
  Future initDB() async => box = await Hive.openBox<Note>("Notes_Database");

  /// Save note into local file
  void saveNote(Note note) => box.add(note);

  /// Get all notes
  Iterable getNotes() => box.values;

  /// Update note
  void updateNote(int index, Note note) => box.putAt(index, note);

  /// Delete note
  void deleteNote(int index) => box.deleteAt(index);

  /// Delete all notes
  void deleteAllNotes() => box.deleteAll(box.keys);

  /// Close database
  void closeDB() async => box.close();
}
