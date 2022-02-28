import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/landing_page.dart';
import 'locator.dart';
import 'services/shared_preferences_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(ProviderScope(
    overrides: [
      sharedPreferencesServiceProvider.overrideWithValue(
        SharedPreferencesService(sharedPreferences),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () => MaterialApp(
          title: 'App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const LandingPage(title: 'App'),
        ),
      );
}
