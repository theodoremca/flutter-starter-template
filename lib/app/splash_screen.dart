import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proste_route_animation/proste_route_animation.dart';

import 'public_view.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        child: Image.asset(
          'assets/pngs/logo.png',
          height: 128.h,
          width: 128.h,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
