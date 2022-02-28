import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SvgAsset extends StatelessWidget {
  const SvgAsset(this.svg,{
    Key? key,
  }) : super(key: key);

  final String svg;

  @override
  Widget build(BuildContext context) {
    return  SvgPicture.asset('assets/svgs/$svg.svg',

    );
  }
}
