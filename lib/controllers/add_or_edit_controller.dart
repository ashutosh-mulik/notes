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

  var isEdit = false;
  late int _index;
  late Note _note;

  /// Get controller of previous screen.
  final MainScreenController mainScreenController = Get.find();

  @override
  void onInit() {
    super.onInit();
    database.initDB();

    try{
      var args = Get.arguments;
      _index = args[0];
      _note = args[1];
      isEdit = true;
      titleTextController.text = _note.title;
      contentTextController.text = _note.content;
      Logger().w(_index);
    }catch(e){
      _index = 0;
      _note = Note(title: "Error", content: "Error", date: "Error");
    }

  }

  bool validateFields() {
    if (titleTextController.text.isEmpty) return false;
    if (contentTextController.text.isEmpty) return false;
    return true;
  }

  void saveNote() {
    Logger().i(_index);
    var now = DateTime.now().toIso8601String();
    var note = Note(
      title: titleTextController.text,
      content: contentTextController.text,
      date: now,
    );

    Logger().wtf(note.toString());

    isEdit ? database.updateNote(_index, note) : database.saveNote(note);

    /// set newNoteAdded to true
    mainScreenController.setDatabaseChanged();
  }

  @override
  void onClose() {
    super.onClose();
    database.closeDB();
  }

}
