import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class QuickActionWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const QuickActionWidget({super.key,
    required this.title,
    required this.icon,
    required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 160.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(12.sp),
              // width: 72.w,
              // height: 72.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.black87, size: 36.sp),
            ),
            SizedBox(height: 12.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style:  TextStyles.font16blackSemiBold.copyWith(
                  fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
