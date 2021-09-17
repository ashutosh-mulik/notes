import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:notes/services/models/note.dart';
import 'package:notes/utils/fonts.dart';
import 'package:notes/utils/other.dart';

class CustomCard extends StatelessWidget {
  final Color cardColor;
  final int index;
  final Note note;
  const CustomCard({
    Key? key,
    required this.cardColor,
    required this.index,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Logger().i(note.toString());
    return GestureDetector(
      onTap: () => Get.toNamed('/view', arguments: [index, note]),
      child: Container(
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20.h,
            horizontal: 20.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  getTitleForCard(note.title),
                  style: FONTS.secondary(
                    TextStyle(
                      fontSize: 17.sp,
                    ),
                  ),
                ),
              ),
              Text(
                getCustomFormatDate(note.date),
                style: FONTS.secondary(
                  TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
