import 'package:fsk/common_widgets/custom_scaffold.dart';
import 'package:fsk/common_widgets/text_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PublicView extends StatefulWidget {
  const PublicView({Key? key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<PublicView> {
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
            regularText("unAuthenticated Home")
          ],
        ));
  }
}
