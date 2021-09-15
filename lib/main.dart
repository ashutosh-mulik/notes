import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:notes/screens/edit/edit_note_screen.dart';
import 'package:notes/screens/main/main_screen.dart';
import 'package:notes/utils/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /// system navigation background color
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: COLORS.primary,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return ScreenUtilInit(
      builder: () => GetMaterialApp(
        theme: ThemeData(
          primaryColor: COLORS.primary,
        ),
        builder: (context, widget) {
          return MediaQuery(
            /// Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget as Widget,
          );
        },
        initialRoute: '/main',

        /// All routes.
        getPages: [
          GetPage(name: '/main', page: () => MainScreen()),
          GetPage(name: '/edit', page: () => const EditNoteScreen()),
        ],
      ),
    );
  }
}
