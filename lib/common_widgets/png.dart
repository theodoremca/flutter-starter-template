import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class PngAsset extends StatelessWidget {
  const PngAsset(this.image,{
    Key? key,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return  Image.asset(
      'assets/pngs/$image.png',
      fit: BoxFit.cover,
    );
  }
}
