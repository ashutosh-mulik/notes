import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:logger/logger.dart';
import 'package:notes/screens/edit_or_add/edit_or_add_screen.dart';
import 'package:notes/screens/main/main_screen.dart';
import 'package:notes/screens/settings/settings_screen.dart';
import 'package:notes/screens/view_note/view_note_screen.dart';
import 'package:notes/services/models/note.dart';
import 'package:notes/utils/colors.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(NoteAdapter());
  await Hive.initFlutter(
    await getApplicationDocumentsDirectory().then((value) => value.path),
  );

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
          GetPage(name: '/edit', page: () => EditOrAddNoteScreen()),
          GetPage(name: '/view', page: () => ViewNoteScreen()),
          GetPage(name: '/settings', page: () => SettingsScreen()),
        ],
      ),
    );
  }
}
