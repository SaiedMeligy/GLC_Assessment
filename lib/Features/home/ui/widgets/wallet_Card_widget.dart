import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glc_assessment/core/theming/colors.dart';
import 'package:glc_assessment/core/theming/styles.dart';

class WalletCardWidget extends StatelessWidget {
  final double balance;

  const WalletCardWidget({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.whiteColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'You have in your wallet',
                          style: TextStyles.font12BlackSemiBold.copyWith(color: Colors.black54),
                        ),
                        SizedBox(height: 6.h),
                        Text('${balance.toStringAsFixed(2)} LE', style: TextStyles.font20blackBold),
                      ],
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Cashback', style: TextStyles.font12BlackSemiBold.copyWith(color: Colors.black54)),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              Text('0 EGP', style: TextStyles.font16blackBold),
                              SizedBox(width: 4.w),
                              Icon(Icons.monetization_on, size: 20.sp, color: Colors.amber),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // QR & Transactions Row
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 44.h,
                    color: Colors.grey.shade100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.qr_code, size: 20.sp),
                        SizedBox(width: 6.w),
                        Text('My QR', style: TextStyles.font12BlackBold),
                        SizedBox(width: 6.w),
                        Container(
                          padding: EdgeInsets.all(4.sp),
                          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10.r)),
                          child: Text('New', style: TextStyles.font10whiteBold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Container(
                    height: 44.h,
                    color: Colors.grey.shade100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.receipt_long, size: 20.sp),
                        SizedBox(width: 6.w),
                        Text('My Transactions', style: TextStyles.font12BlackBold),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
