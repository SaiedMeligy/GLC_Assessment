
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glc_assessment/core/theming/styles.dart';

class OnlineCompany extends StatelessWidget {
  final List<String> assetPaths;

  const OnlineCompany({super.key, required this.assetPaths});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pay online globally using Vodafone Cash. Our special partners:',
            style: TextStyles.font12BlackBold.copyWith(
              color: Colors.grey.shade500,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            height: 70.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 15.h),
            decoration: BoxDecoration(
                color: Colors.white
            ),

            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: assetPaths.length,
              itemBuilder: (context, index) {
                final path = assetPaths[index];
                return Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.asset(
                      path,
                      height: 90.h,
                      width: 90.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
