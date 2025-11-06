import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class DueBillWidget extends StatelessWidget {
  const DueBillWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children:  [
          Icon(Icons.star, color: Colors.orange, size: 26.sp),
          SizedBox(width: 8.w),
          Text('Due Bills', style: TextStyles.font16blackSemiBold),
          Spacer(),
          Text('No Due Bills', style: TextStyles.font16blackSemiBold.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400
          )),
          SizedBox(width: 8.w),
          Icon(Icons.keyboard_arrow_right_sharp, color: Colors.grey.shade400,size: 30.sp,),
        ],
      ),
    );
  }
}
