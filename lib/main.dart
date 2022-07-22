import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/firebase_options.dart';
import 'package:template/locator.dart';
import 'package:template/router.dart';
import 'package:template/utils/local_storage.dart';

import 'services/common/shared_preferences_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setUp();
  await AppCache.init();
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  final sharedPreferences = SharedPreferences.getInstance();
  runApp(ProviderScope(
      overrides: [
        sharedPreferencesServiceProvider.overrideWithValue(
          SharedPreferencesService(await sharedPreferences),
        ),
      ],
      child: kIsWeb
          ? FlutterWebFrame(
              maximumSize: const Size(450.0, 608.0),
              enabled: true,
              backgroundColor: const Color(0xffD0CBCB),
              builder: (snapshot) => const MyApp())
          : const MyApp()));
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          scrollBehavior: AppScrollBehavior(),
          debugShowCheckedModeBanner: false,
          routeInformationParser: router(ref).routeInformationParser,
          routerDelegate: router(ref).routerDelegate,
          title: 'Atlanta',
          themeMode: ThemeMode.light,
          theme: ThemeData(textTheme: GoogleFonts.sairaTextTheme()),
        );
      },
    );
  }
}
