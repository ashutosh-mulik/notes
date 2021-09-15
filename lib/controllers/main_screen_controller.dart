import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:notes/services/local_database.dart';
import 'package:notes/utils/colors.dart';

class MainScreenController extends GetxController {
  /// colors for card
  final List<Color> colors = [
    COLORS.one,
    COLORS.two,
    COLORS.three,
    COLORS.four,
    COLORS.five,
    COLORS.six,
    COLORS.seven,
  ];

  final database = Get.put(LocalDatabase());

  void printData(message) {
    Logger().d(message);
  }

  Future getNotes() async {
    await database.initDB();
    return database.getNotes();
  }

  /// Get random color
  Color getColor() {
    return colors[Random().nextInt(colors.length)];
  }

  @override
  void onClose() {
    super.onClose();
    database.closeDB();
  }
}
