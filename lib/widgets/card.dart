import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:notes/utils/fonts.dart';

class CustomCard extends StatelessWidget {
  final Color cardColor;
  final String title;
  const CustomCard({
    Key? key,
    required this.cardColor,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed('/edit'),
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
                  title,
                  style: FONTS.secondary(
                    TextStyle(
                      fontSize: 17.sp,
                    ),
                  ),
                ),
              ),
              Text(
                "May 21, 2020",
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
