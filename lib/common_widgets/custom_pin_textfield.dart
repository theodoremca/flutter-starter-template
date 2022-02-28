import 'package:calenbine/common_widgets/text_widgets.dart';
import 'package:calenbine/utils/colors.dart';
import 'package:flutter/material.dart';

import 'package:pinput/pin_put/pin_put.dart';

class CustomPinTextField extends StatelessWidget {
  final String? title;
  final int maxLength;
  final TextEditingController controller;

  final Function(String?)? onDone;

  CustomPinTextField({
    this.title,
    this.onDone,
    required this.maxLength,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == null
            ? SizedBox()
            : Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: regularText(
                  title!,
                  fontSize: 12.sp,
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
        PinPut(
          fieldsCount: maxLength,
          onSubmit: onDone,
          eachFieldWidth: 52.h,
          eachFieldHeight: 56.h,
          obscureText: '●',
          controller: controller,
          textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          followingFieldDecoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.h),
              border: Border.all(
                  color: AppColors.green.withOpacity(.2), width: 1.h)),
          selectedFieldDecoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.h),
              border: Border.all(color: AppColors.green, width: 1.h)),
          submittedFieldDecoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.h),
              border: Border.all(color: AppColors.darkBlue, width: .5.h)),
        ),
      ],
    );
  }
}
