import 'package:nft/app/style/text.dart';
import 'package:nft/app/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryAppButton extends StatelessWidget {
  const PrimaryAppButton(
    this.text,
    {
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return AppButton(onPressed: onPressed,
    child: Center(child: AppText(text,width: FontWeight.w600,size: 15)),
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton({
    required this.onPressed, required this.child , this.radius = 8 , 
    this.color = AppTheme.orange , this.borderColor = AppTheme.orange,
    this.width = 335,
    this.height = 56,
    Key? key,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Widget child;
  final int radius;
  final Color color;
  final Color borderColor;
  final int width;
  final int height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: width.w,
          height: height.h,
          child: child,
          decoration: BoxDecoration(
              color: color,
              border: Border.all(
                color: borderColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(radius.r)))),
    );
  }
}
