import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:notes/controllers/settings_controller.dart';
import 'package:notes/utils/colors.dart';
import 'package:notes/utils/fonts.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  final controller = Get.put(SettingsController());

  SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.primary,
      appBar: AppBar(
        toolbarHeight: 80.h,
        elevation: 0,
        backgroundColor: COLORS.transparent,
        title: Text(
          "Settings",
          style: FONTS.primary(
            TextStyle(fontSize: 30.sp),
          ),
        ),
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
      ),
      body: Container(
        margin: EdgeInsets.only(
          left: 10.h,
          right: 10.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                Card(
                  color: COLORS.secondary,
                  child: ListTile(
                    onTap: () {
                      Get.defaultDialog(
                        title: "Are you sure?",
                        titleStyle: FONTS.secondary(
                          const TextStyle(color: COLORS.primaryText),
                        ),
                        content: Text(
                          "Do you want to delete all notes.?",
                          style: FONTS.secondary(const TextStyle(color: COLORS.primaryText),),
                        ),
                        backgroundColor: COLORS.secondary,
                        confirmTextColor: COLORS.primaryText,
                        confirm: ElevatedButton(
                          onPressed: () {
                            controller.deleteAllNotes();
                            Get.back();
                            Get.snackbar(
                              "Done",
                              "All note are deleted.",
                              duration: const Duration(seconds: 1),
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: COLORS.secondary,
                              colorText: COLORS.primaryText,
                            );
                          },
                          child: Text(
                            "Delete",
                            style: FONTS.secondary(null),
                          ),
                        ),
                        cancel: ElevatedButton(
                          onPressed: () => Get.back(),
                          child: Text(
                            "Cancel",
                            style: FONTS.secondary(null),
                          ),
                        ),
                      );
                    },
                    leading: const Icon(
                      Icons.delete_outlined,
                      color: COLORS.primaryIcon,
                    ),
                    title: Text(
                      'Delete All Notes',
                      style: FONTS.secondary(
                        const TextStyle(
                          color: COLORS.primaryText,
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  color: COLORS.secondary,
                  child: ListTile(
                    onTap: () => Share.share("Hey, Checkout new free and open-source note-taking app. \n\nhttps://play.google.com/store/apps/details?id=com.twoab.notes"),
                    leading: const Icon(
                      Icons.share_outlined,
                      color: COLORS.primaryIcon,
                    ),
                    title: Text(
                      'Share this app.',
                      style: FONTS.secondary(
                        const TextStyle(
                          color: COLORS.primaryText,
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  color: COLORS.secondary,
                  child: ListTile(
                    onTap: () async => await launch("https://github.com/ashutosh-mulik/notes/blob/master/README.md"),
                    leading: const Icon(
                      Icons.article_outlined,
                      color: COLORS.primaryIcon,
                    ),
                    title: Text(
                      'Readme',
                      style: FONTS.secondary(
                        const TextStyle(
                          color: COLORS.primaryText,
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  color: COLORS.secondary,
                  child: ListTile(
                    onTap: () async => await launch("https://github.com/ashutosh-mulik/notes/blob/master/CHANGE_LOG.md"),
                    leading: const Icon(
                      Icons.published_with_changes_outlined,
                      color: COLORS.primaryIcon,
                    ),
                    title: Text(
                      'Changelog',
                      style: FONTS.secondary(
                        const TextStyle(
                          color: COLORS.primaryText,
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  color: COLORS.secondary,
                  child: ListTile(
                    onTap: () async => await launch("https://github.com/ashutosh-mulik/notes/blob/master/LICENSE"),
                    leading: const Icon(
                      Icons.security_outlined,
                      color: COLORS.primaryIcon,
                    ),
                    title: Text(
                      'License',
                      style: FONTS.secondary(
                        const TextStyle(
                          color: COLORS.primaryText,
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  color: COLORS.secondary,
                  child: ListTile(
                    onTap: () => showLicensePage(context: context, applicationName: "Notes", applicationVersion: "v1.0.2"),
                    leading: const Icon(
                      Icons.favorite_outlined,
                      color: COLORS.primaryIcon,
                    ),
                    title: Text(
                      'Open source Licenses',
                      style: FONTS.secondary(
                        const TextStyle(
                          color: COLORS.primaryText,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
