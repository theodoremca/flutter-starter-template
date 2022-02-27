 import 'package:flutter/material.dart';
import 'package:nft/app/components/text_widgets.dart';
import 'package:nft/app/utils/colors.dart';


class CustomDialog extends StatelessWidget {
  final String title;
  final String desc;
  final String? primary;
  final Color? primaryColor;
  final String? secondary;
  final Function()? primaryAction;
  final Function()? secondaryAction;

  const CustomDialog(
      {Key? key,
      required this.title,
      required this.desc,
      this.primary,
      this.secondary,
      this.primaryAction,
      this.secondaryAction, this.primaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: AppColors.white,
          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              regularText(
                title,
                fontSize: 24.sp,
                color: AppColors.black,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 10.h),
              regularText(
                desc,
                fontSize: 15.sp,
                height: 1.5,
                color: AppColors.black,
              ),
            ],
          ),
        ),
        Container(
          color: Color(0xffF2F3F5),
          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 15.h),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: primaryAction,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.h, vertical: 6.h),
                    decoration: BoxDecoration(
                      color:primaryColor ?? AppColors.btnRed,
                      border: Border.all(color:primaryColor ??  AppColors.btnRed),
                      borderRadius: BorderRadius.circular(6.h),
                    ),
                    child: regularText(
                      primary!,
                      fontSize: 15.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 14.h),
              Expanded(
                child: InkWell(
                  onTap: secondaryAction,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.h, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.grey),
                      borderRadius: BorderRadius.circular(6.h),
                    ),
                    child: regularText(
                      secondary!,
                      fontSize: 15.sp,
                      textAlign: TextAlign.center,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
