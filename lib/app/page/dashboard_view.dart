import 'package:calenbine/common_widgets/custom_scaffold.dart';
import 'package:calenbine/common_widgets/text_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../locator.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        removeImage: true,
        child: Column(
          children: [
            SizedBox(height: 75.h),
            regularText("App Home")
          ],
        ));
  }
}

