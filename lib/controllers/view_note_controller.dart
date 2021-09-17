import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:notes/services/local_database.dart';
import 'package:notes/services/models/note.dart';

import 'main_screen_controller.dart';

class ViewNoteController extends GetxController {

  late int _index;
  late Note _note;
  final _database = Get.put(LocalDatabase());

  /// Get controller of previous screen.
  final MainScreenController mainScreenController = Get.find();

  @override
  void onInit() async {
    super.onInit();
    try {
      var args = Get.arguments;
      _index = args[0];
      _note = args[1];
      await _database.initDB();
      Logger().i(_index);
    } catch (e) {
      _note = Note(title: "Error", content: "Error", date: "Error");
    }
  }

  getIndex() => _index;

  getTitle() => _note.title;

  getContent() => _note.content;

  getNote() => _note;

  deleteNote() {
    _database.deleteNote(_index);
    mainScreenController.setDatabaseChanged();
  }

}