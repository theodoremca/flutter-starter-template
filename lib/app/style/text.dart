import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class AppText extends StatelessWidget {
  const AppText(
      this.text, {
        Key? key,
        this.size = 15,
        this.width = FontWeight.w400,
        this.style = FontStyle.normal,
        this.color = Colors.white,
        this.align = TextAlign.center,
      }) : super(key: key);
  final double size;
  final FontWeight width;
  final FontStyle style;
  final Color color;
  final TextAlign align;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.rubik(
          fontSize: size.sp, fontWeight: width, fontStyle: style, color: color),
      textAlign: TextAlign.center,
    );
  }
}