import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MeezaWidget extends StatelessWidget {
  const MeezaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 12.0.w),
      child: Row(
        children: [
          Expanded(child: Divider()),
          SizedBox(width: 10.w,),
          SizedBox(
            width: 70.w,
            child: Image.asset(
              'assets/images/Meeza.png',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
