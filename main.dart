import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 't_native_page.dart';
import 'x_app_list_reorderable_page.dart';
import 'x_qcard_reorderable_page.dart';
import 'x_recent_input.dart';
import 'x_shelves_reorderable_page.dart';

// TEST MESSAGE.....

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(3840, 2160),
        builder: (context, child) => MaterialApp(
              // initialRoute: '/',
              home: const TNativePage(),
              routes: {
                '/t_native_page': (context) => const TNativePage(),
                '/x_app_list_reorderable_page': (context) => const XAppListReorderablePage(),
                '/x_qcard_reorderable_page': (context) => const XQcardReorderablePage(),
                '/x_recent_input': (context) => const XRecentInput(),
                '/x_shelves_reorderable_page': (context) => const XShelvesReorderablePage()
              },
              print("hello");
              print("hello2...");
		print("hello3.....");
		print("branch....");
            ));
  }
}
