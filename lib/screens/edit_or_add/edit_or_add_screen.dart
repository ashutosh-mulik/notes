import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:notes/controllers/add_or_edit_controller.dart';
import 'package:notes/utils/colors.dart';
import 'package:notes/utils/fonts.dart';

/// For editing and adding new note
/// using same screen
class EditOrAddNoteScreen extends StatelessWidget {
  final controller = Get.put(AddOrEditScreenController());
  EditOrAddNoteScreen({Key? key}) : super(key: key);

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
            onPressed: () {
              /// title and content not empty.
              if (controller.validateFields()) {
                controller.saveNote();
                Get.back();
                Get.snackbar(
                  "Done",
                  "Note ${controller.isEdit ? "updated": "saved"} successfully.",
                  duration: const Duration(seconds: 1),
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: COLORS.secondary,
                  colorText: COLORS.primaryText,
                );
              } else {
                Get.snackbar(
                  "Error",
                  "Please enter title and content.",
                  duration: const Duration(seconds: 1),
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: COLORS.secondary,
                  colorText: COLORS.primaryText,
                );
              }
            },
            duration: const Duration(milliseconds: 100),
            scaleFactor: 1.5,
            child: Container(
              width: 70.w,
              margin: EdgeInsets.only(
                top: 20.h,
                right: 10.w,
                bottom: 20.h,
              ),
              decoration: BoxDecoration(
                color: COLORS.secondary,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: Text(
                  controller.isEdit ? "Update" : "Save",
                  style: FONTS.secondary(null),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Column(
          children: [
            TextField(
              scrollPhysics: const BouncingScrollPhysics(),
              controller: controller.titleTextController,
              maxLines: null,
              cursorColor: COLORS.secondaryText.withOpacity(0.7),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
                hintStyle: TextStyle(
                  color: COLORS.secondaryText.withOpacity(0.7),
                ),
              ),
              style: FONTS.secondary(
                TextStyle(
                  fontSize: 30.sp,
                  color: COLORS.primaryText,
                ),
              ),
            ),
            Expanded(
              child: TextField(
                scrollPhysics: const BouncingScrollPhysics(),
                controller: controller.contentTextController,
                cursorColor: COLORS.secondaryText.withOpacity(0.7),
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type something....',
                  hintStyle: TextStyle(
                    color: COLORS.secondaryText.withOpacity(0.7),
                  ),
                ),
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
    );
  }
}
