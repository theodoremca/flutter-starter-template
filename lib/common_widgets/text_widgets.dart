
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';

Widget regularText(String text,
    {
      Color? color,
      Color? dMColor,
      bool dMode=false,
    double? fontSize = 14,
    double? letterSpacing,
    double? height,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    FontWeight? fontWeight}) {
  return Text(
          text,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          softWrap: true,
          style: GoogleFonts.manrope(
            color: dMode?dMColor:color,
            letterSpacing: letterSpacing,
            fontSize: fontSize,
            height: height,
            fontWeight: fontWeight,
            decoration: decoration,
          ),
        );
}

Widget userNameText(
  String text, {
  Color? color,
  double? fontSize = 14,
  double? letterSpacing,
  double? height,
  TextAlign? textAlign,
  int? maxLines,
  TextOverflow? overflow,
  TextDecoration? decoration,
  FontWeight? fontWeight,
  bool blur = false,
  Color? usernameColor,
}) {
  return  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              textAlign: textAlign,
              maxLines: maxLines,
              overflow: overflow,
              softWrap: true,
              style: GoogleFonts.manrope(
                color: color,
                letterSpacing: letterSpacing,
                fontSize: fontSize,
                height: height,
                fontWeight: fontWeight,
                decoration: decoration,
              ),
            ),
            if (usernameColor != null)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.h),
                child: Image.asset(
                  'assets/images/star.png',
                  height: fontSize! * 0.8,
                  color: usernameColor,
                ),
              ),
          ],
        );
}


TextSpan regularTextSpan(text,{Color? color,
  Color? dMColor,
  bool dMode=false,
  double fontSize=13,FontWeight fontWeight=FontWeight.w500,List<InlineSpan>? children}) {
  return TextSpan(
    text: text,
    style: GoogleFonts.manrope(
      color: dMode?dMColor:color,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
    ),
    recognizer: TapGestureRecognizer()..onTap = () {},
    children: children,
  );
}
