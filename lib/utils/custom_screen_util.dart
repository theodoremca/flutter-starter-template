import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ScreenUtilWeb on num {
  double get w => kIsWeb ? toDouble() : ScreenUtil().setWidth(this);
  double get h => kIsWeb ? toDouble() : ScreenUtil().setHeight(this);
  double get r => kIsWeb ? toDouble() : ScreenUtil().radius(this);
  double get sp => kIsWeb ? toDouble() : ScreenUtil().setSp(this);
  double get sm => min(toDouble(), sp);
  double get sw => (kIsWeb ? 450.0 : ScreenUtil().screenWidth) * this;
  double get sh => (kIsWeb ? 608.0 : ScreenUtil().screenHeight) * this;
}
