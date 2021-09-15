import 'dart:ui';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:notes/controllers/main_screen_controller.dart';
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
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                COLORS.primary,
                COLORS.primary.withOpacity(0.9),
                COLORS.primary.withOpacity(0.7),
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
            onPressed: () {},
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
                Icons.search,
                size: 20.h,
              ),
            ),
          ),
          BouncingWidget(
            onPressed: () {},
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
                Icons.settings,
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
        child: FutureBuilder(
          future: controller.getNotes(),
          builder: (context, data) {
            if (data.hasData && data.data is Map) {
              var notes = data.data as Map;
              var n = notes.entries;
              return StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: notes.length,
                itemBuilder: (BuildContext context, int index) => CustomCard(
                  cardColor: controller.getColor(),
                  title: n.elementAt(index).value.title,
                ),
                staggeredTileBuilder: (int index) => StaggeredTile.count(
                  2,
                  index.isEven ? 3 : 2,
                ),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
