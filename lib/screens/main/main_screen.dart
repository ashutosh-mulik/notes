import 'dart:ui';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:notes/controllers/main_screen_controller.dart';
import 'package:notes/services/models/note.dart';
import 'package:notes/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/utils/fonts.dart';
import 'package:notes/widgets/card.dart';

class MainScreen extends StatelessWidget {
  final controller = Get.put(MainScreenController());

  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.primary,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 80.h,
        elevation: 0,
        backgroundColor: COLORS.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                COLORS.primary,
                COLORS.transparent,
              ],
            ),
          ),
        ),
        title: Text(
          "Notes",
          style: FONTS.primary(
            TextStyle(fontSize: 30.sp),
          ),
        ),
        actions: [
          BouncingWidget(
            onPressed: () => Get.toNamed('/settings'),
            duration: const Duration(milliseconds: 100),
            scaleFactor: 1.5,
            child: Container(
              width: 43.w,
              margin: EdgeInsets.only(
                top: 20.h,
                right: 10.w,
                bottom: 20.h,
              ),
              decoration: BoxDecoration(
                color: COLORS.secondary,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                Icons.settings_outlined,
                size: 20.h,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: COLORS.secondary,
        onPressed: () => Get.toNamed('/edit'),
      ),
      body: Container(
        margin: EdgeInsets.only(
          left: 10.h,
          right: 10.h,
        ),
        child: Obx(() {
          /// refresh card list if new item is added.
          if (controller.isNewNoteAdded()) {
            controller.resetNewNoteAdded();
            return _buildCardList();
          }

          /// first build
          return _buildCardList();
        }),
      ),
    );
  }

  /// Get data from storage and build list.
  _buildCardList() {
    return FutureBuilder(
      future: controller.getNotes(),
      builder: (context, data) {
        if (data.hasData && data.data is Iterable) {
          var notes = data.data as Iterable;
          var rNotes = notes.toList().reversed;
          return StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: rNotes.length,
            itemBuilder: (BuildContext context, int index) {
              Note note = rNotes.elementAt(index);
              return CustomCard(cardColor: controller.getColor(), index: (rNotes.length - index) - 1, note: note);
            },
            staggeredTileBuilder: (int index) => StaggeredTile.count(
              2,
              rNotes.elementAt(index).title.length > 70
                  ? 3
                  : rNotes.elementAt(index).title.length > 10
                      ? 2
                      : 1,
            ),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
