import 'package:fsk/common_widgets/custom_scaffold.dart';
import 'package:fsk/common_widgets/text_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivateView extends StatefulWidget {
  const PrivateView({Key? key}) : super(key: key);

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<PrivateView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        removeImage: true,
        child: Column(
          children: [SizedBox(height: 75.h), regularText("Authenticated Home")],
        ));
  }
}
