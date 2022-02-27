import 'package:flutter/cupertino.dart';

void push(BuildContext context, Widget view, {bool dialog = false}) {
  Navigator.push<void>(
      context,
      CupertinoPageRoute<dynamic>(
          builder: (BuildContext context) => view, fullscreenDialog: dialog));
}

void pushReplacement(BuildContext context, Widget view, {bool dialog = false}) {
  Navigator.pushReplacement(
      context,
      CupertinoPageRoute<dynamic>(
          builder: (BuildContext context) => view, fullscreenDialog: dialog));
}

void pushAndRemoveUntil(BuildContext context, Widget view,
    {bool dialog = false}) {
  Navigator.pushAndRemoveUntil(
    context,
    CupertinoPageRoute<dynamic>(
        builder: (BuildContext context) => view, fullscreenDialog: dialog),
    (Route<dynamic> route) => false,
  );
}
