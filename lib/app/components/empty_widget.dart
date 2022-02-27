import 'package:flutter/material.dart';
import 'package:nft/app/components/text_widgets.dart';
import 'package:nft/app/utils/colors.dart';


import 'buttons.dart';

class AppEmptyWidget extends StatelessWidget {
  const AppEmptyWidget(this.title, this.desc, {this.onTap});

  final String title, desc;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/empty.png',
            height: 150.h,
          ),
          SizedBox(height: 6.h),
          regularText(
            title,
            fontSize: 20.sp,
            textAlign: TextAlign.center,
            color: AppColors.black,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 6.h),
          regularText(
            desc,
            fontSize: 15.sp,
            textAlign: TextAlign.center,
            color: AppColors.textBlack,
          ),
          SizedBox(height: 16.h),
          if (onTap != null)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 100.h),
              child: SafeArea(
                child: buttonWithBorder(
                  'Make a Request',
                  buttonColor: AppColors.orange,
                  fontSize: 15.sp,
                  height: 56.h,
                  textColor: AppColors.white,
                  fontWeight: FontWeight.w600,
                  onTap: onTap,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
