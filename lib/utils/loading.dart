import 'package:flutter/material.dart';

class AppLoadingIndication extends StatelessWidget {
  const AppLoadingIndication( {
    this.color = Colors.white,
    Key? key}) : super(key: key);
    final Color? color;
  @override
  Widget build(BuildContext context,) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Transform.scale(scale: .5, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(color))),
    );
  }
}