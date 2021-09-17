
import 'package:get/get.dart';
import 'package:notes/services/local_database.dart';

import 'main_screen_controller.dart';

class SettingsController extends GetxController{

  final database = Get.put(LocalDatabase());

  /// Get controller of previous screen.
  final MainScreenController mainScreenController = Get.find();

  void deleteAllNotes()async{
    await database.initDB();
    database.deleteAllNotes();
    database.closeDB();
    mainScreenController.setDatabaseChanged();
  }

}