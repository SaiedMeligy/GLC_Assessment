import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class TextStyles {

  static TextStyle font30BlackBold = TextStyle(
    fontFamily: "Cairo",
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
    color: ColorsManager.mainAppColor,
  );
  static TextStyle font12BlackBold = TextStyle(
    fontFamily: "Cairo",
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    color: ColorsManager.secondAppColor,
  );
  static TextStyle font12BlackSemiBold = TextStyle(
    fontFamily: "Cairo",
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: ColorsManager.secondAppColor,
  );

  static TextStyle font16blackSemiBold = TextStyle(
    fontFamily: "Cairo",
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: ColorsManager.secondAppColor,
  );
  static TextStyle font16blackBold = TextStyle(
    fontFamily: "Cairo",
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: ColorsManager.secondAppColor,
  );
  static TextStyle font20blackBold = TextStyle(
    fontFamily: "Cairo",
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: ColorsManager.secondAppColor,
  );
  static TextStyle font20whiteSemiBold = TextStyle(
    fontFamily: "Cairo",
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.whiteColor,
  );
  static TextStyle font16whiteSemiBold = TextStyle(
    fontFamily: "Cairo",
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: ColorsManager.whiteColor,
  );
  static TextStyle font12whiteSemiBold = TextStyle(
    fontFamily: "Cairo",
    fontSize: 12.sp,
    color: ColorsManager.whiteColor,
  );
  static TextStyle font10whiteBold = TextStyle(
    fontFamily: "Cairo",
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    color: ColorsManager.whiteColor,
  );

  static TextStyle fontError = TextStyle(
    fontFamily: "Cairo",
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    color: ColorsManager.darkRed,
  );
}
