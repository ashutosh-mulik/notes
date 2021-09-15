import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  /// Get random color
  Color getColor() {
    return colors[Random().nextInt(colors.length)];
  }
}
