import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:notes/controllers/main_screen_controller.dart';
import 'package:notes/services/local_database.dart';
import 'package:notes/services/models/note.dart';

class AddOrEditScreenController extends GetxController {
  final titleTextController = TextEditingController();
  final contentTextController = TextEditingController();
  final database = Get.put(LocalDatabase());

  @override
  void onInit() {
    super.onInit();
    database.initDB();
  }

  bool validateFields() {
    Logger().i(database.getNotes());
    if (titleTextController.text.isEmpty) return false;
    if (contentTextController.text.isEmpty) return false;
    return true;
  }

  void saveNote() {
    var now = DateTime.now().toIso8601String();
    var note = Note(
      title: titleTextController.text,
      content: contentTextController.text,
      date: now,
    );
    database.saveNote(note);
  }

  @override
  void onClose() {
    super.onClose();
    database.closeDB();
  }
}
