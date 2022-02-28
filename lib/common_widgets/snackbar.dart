import 'package:another_flushbar/flushbar.dart';
import 'package:calenbine/common_widgets/text_widgets.dart';
import 'package:calenbine/utils/colors.dart';
import 'package:flutter/material.dart';


void errorSnackBar(BuildContext context, String title) {
  final Flushbar<void> flushBar = Flushbar<void>(
    title: title,
    titleText: Row(
      children: [
        Icon(
          Icons.error_outline_rounded,
          color: AppColors.btnRed,
          size: 22.h,
        ),
        Spacer(),
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.close,
            size: 20.h,
            color: AppColors.btnRed,
          ),
        )
      ],
    ),
    messageText: regularText(
      title,
      fontSize: 15.sp,
      color: AppColors.btnRed,
      fontWeight: FontWeight.w600,
    ),
    borderRadius: BorderRadius.circular(8.h),
    margin: EdgeInsets.all(16.h),
    borderColor: AppColors.btnRed,
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    duration: Duration(seconds: 2),
    backgroundColor: Color(0xFFE3CDC6),
  );

  if (!flushBar.isShowing()) {
    flushBar.show(context);
  }
}

void successSnackBar(BuildContext context, String title) {
  final Flushbar<void> flushBar = Flushbar<void>(
    title: title,
    titleText: Row(
      children: [
        Image.asset(
          'assets/images/check-circle.png',
          width: 20.h,
          height: 20.h,
        ),
        Spacer(),
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.close,
            size: 20.h,
            color: AppColors.darkGreen,
          ),
        )
      ],
    ),
    messageText: regularText(
      title,
      fontSize: 15.sp,
      color: AppColors.darkGreen,
      fontWeight: FontWeight.w600,
    ),
    borderRadius: BorderRadius.circular(8.h),
    margin: EdgeInsets.all(16.h),
    borderColor: AppColors.darkGreen,
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    duration: Duration(seconds: 4),
    backgroundColor: Color(0xffF6FEF9),
  );

  if (!flushBar.isShowing()) {
    flushBar.show(context);
  }
}
