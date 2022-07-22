
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:template/utils/colors.dart';

import '../utils/local_storage.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _index = 0;

  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              controller: controller,
              onPageChanged: (a) {
                _index = a;
                setState(() {});
              },
              itemCount: pages.length,
              itemBuilder: (context, index) {
                return pages[_index];
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Dots(index: _index, controller: controller),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.sp),
                      topRight: Radius.circular(50.sp),
                    ),
                    color: AppColors.primary,
                  ),
                  height: 90.h,
                  width: 100.w,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        if (_index == 2) {
                          AppCache.setFirstTime();
                          context.go("/auth/number");
                          return;
                        }
                        controller.nextPage(
                            duration: const Duration(microseconds: 1000),
                            curve: Curves.easeInCirc);
                      },
                      child: Container(
                        height: 50.w,
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(50.sp),
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class OnBoard extends StatelessWidget {
  final String imgLink;
  final String pageText;
  final String description;
  const OnBoard({
    Key? key,
    required this.imgLink,
    required this.pageText,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30.h),
        Image.asset(
          imgLink,
          height: 440.h,
        ),
        SizedBox(height: 30.h),
        Container(
          constraints: BoxConstraints(maxWidth: 327.w),
          child: Text(
            pageText,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22.sp, color: AppColors.primary),
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          constraints: BoxConstraints(
            maxWidth: 267.w,
          ),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.sp, color: AppColors.grey),
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}

class Dots extends StatelessWidget {
  const Dots({
    Key? key,
    required int index,
    required this.controller,
  })  : _index = index,
        super(key: key);

  final int _index;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 4.h,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.3),
            borderRadius: BorderRadius.circular(56.sp),
          ),
          margin: EdgeInsets.only(bottom: 20.h),
          child: ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      height: 4.h,
                      width: 51.w,
                      decoration: BoxDecoration(
                          color: _index == index
                              ? AppColors.primary
                              : const Color.fromARGB(0, 31, 4, 4),
                          borderRadius: BorderRadius.circular(56.sp)),
                    )
                  ],
                );
              }),
        ));
  }
}
String mainIntroPath = 'assets/images/intro';
String introImg1 = '$mainIntroPath/intro_img1.png';
String introImg2 = '$mainIntroPath/intro_img2.png';
String introImg3 = '$mainIntroPath/intro_img3.png';

List<OnBoard> pages = [
  OnBoard(
    imgLink: introImg1,
    pageText: 'Resources that meet the needs of the community',
    description:
        'A complane health app chat the allows customers get diagnased via chera phone',
  ),
  OnBoard(
    imgLink: introImg2,
    pageText: 'Relief from mental health challenges',
    description:
        'A complane health app chat the allows customers get diagnased via chera phone',
  ),
  OnBoard(
    imgLink: introImg3,
    pageText: 'Relief from mental health challenges',
    description:
        'A complane health app chat the allows customers get diagnased via chera phone',
  )
];
