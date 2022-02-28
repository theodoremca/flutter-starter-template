import 'package:template/common_widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buttonWithBorder(
  String text, {
  Color? buttonColor,
  Color? textColor,
  Function()? onTap,
  Color? borderColor,
  FontWeight? fontWeight,
  double? fontSize,
  double? horiMargin,
  double? borderRadius,
  String? icon,
  double? height,
  double? width,
  bool busy = false,
  bool isActive = true,
}) {
  return InkWell(
    onTap: isActive ? (busy ? null : onTap) : null,
    child: Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: horiMargin ?? 0),
      decoration: BoxDecoration(
          color: isActive ? buttonColor : Color(0xffF6F6F6),
          borderRadius: BorderRadius.circular(borderRadius ?? 8.h),
          border: Border.all(
              width: .7.h,
              color: isActive
                  ? (borderColor ?? Colors.transparent)
                  : Color(0xffF6F6F6))),
      child: Center(
          child: busy
              ? SizedBox(
                  child: const CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                  height: 20.h,
                  width: 20.h,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    regularText(
                      text,
                      color: isActive
                          ? textColor
                          : Color(0xff8E8B8B).withOpacity(.5),
                      fontSize: fontSize,
                      fontWeight: fontWeight ?? FontWeight.w600,
                    ),
                    if (icon != null)
                      Padding(
                        padding: EdgeInsets.only(left: 12.h),
                        child: Image.asset(
                          'assets/images/$icon.png',
                          height: 13.h,
                          width: 13.h,
                        ),
                      ),
                  ],
                )),
    ),
  );
}
