import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:notes/controllers/view_note_controller.dart';
import 'package:notes/utils/colors.dart';
import 'package:notes/utils/fonts.dart';

class ViewNoteScreen extends StatelessWidget {
  final controller = Get.put(ViewNoteController());

  ViewNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.primary,
      appBar: AppBar(
        toolbarHeight: 80.h,
        elevation: 0,
        backgroundColor: COLORS.transparent,
        leading: BouncingWidget(
          onPressed: () => Get.back(),
          duration: const Duration(milliseconds: 100),
          scaleFactor: 1.5,
          child: Container(
            width: 50.w,
            margin: EdgeInsets.only(
              top: 20.h,
              left: 10.w,
              bottom: 20.h,
            ),
            decoration: BoxDecoration(
              color: COLORS.secondary,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back_rounded,
                size: 20.h,
              ),
            ),
          ),
        ),
        actions: [
          BouncingWidget(
            onPressed: () => Get.offAndToNamed('/edit', arguments: [controller.getIndex(), controller.getNote()]),
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
                Icons.edit,
                size: 20.h,
              ),
            ),
          ),
          BouncingWidget(
            onPressed: () {
              controller.deleteNote();
              Get.back();
              Get.snackbar(
                "Done",
                "Note deleted successfully.",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: COLORS.secondary,
                colorText: COLORS.primaryText,
              );
            },
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
                Icons.delete,
                size: 20.h,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.getTitle(),
                textAlign: TextAlign.start,
                style: FONTS.secondary(
                  TextStyle(
                    fontSize: 30.sp,
                    color: COLORS.primaryText,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Text(
                  controller.getContent(),
                  textAlign: TextAlign.start,
                  style: FONTS.secondary(
                    TextStyle(
                      fontSize: 18.sp,
                      color: COLORS.primaryText,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
