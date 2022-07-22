import 'package:fsk/common_widgets/text_widgets.dart';
import 'package:fsk/utils/colors.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble(
      {Key? key,
      required this.text,
      required this.isSender,
      required this.timeSent})
      : super(key: key);
  final bool isSender;
  final String timeSent;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h, right: 16.h, left: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (isSender) Expanded(child: SizedBox()),
          if (!isSender)
            Padding(
              padding: EdgeInsets.only(right: 12.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.h),
                child: Image.asset(
                  'assets/images/placeholder.png',
                  height: 40.h,
                  width: 40.h,
                ),
              ),
            ),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * .7,
              minWidth: MediaQuery.of(context).size.width * .3,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    userNameText(
                      'Phoenix Baker',
                      fontSize: 14.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                      usernameColor: Color(0xffFFA384),
                    ),
                    Spacer(),
                    regularText(
                      'Friday 2:20pm',
                      fontSize: 13.sp,
                      color: AppColors.textBlack,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.h, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: isSender ? Color(0xff74BDCB) : Color(0xffFFFF1E2),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isSender ? 8.h : 0),
                      topRight: Radius.circular(isSender ? 0 : 8.h),
                      bottomLeft: Radius.circular(8.h),
                      bottomRight: Radius.circular(8.h),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.grey.withOpacity(.2),
                        blurRadius: 2,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(8.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          regularText(text,
                              fontSize: 15.sp,
                              color:
                                  isSender ? AppColors.white : AppColors.black),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
