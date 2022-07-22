import 'package:template/common_widgets/custom_scaffold.dart';
import 'package:template/common_widgets/text_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class PrivateView2 extends StatefulWidget {
  const PrivateView2({Key? key}) : super(key: key);

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<PrivateView2> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        removeImage: true,
        child: Column(
          children: [SizedBox(height: 75.h), regularText("Authenticated ProfileSetup")],
        ));
  }
}

