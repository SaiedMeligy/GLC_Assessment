import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glc_assessment/core/theming/styles.dart';

class CustomListItem extends StatelessWidget {
  final String title;
  final IconData? trailingIcon;
  final VoidCallback? onTap;
  final bool isLast;

  const CustomListItem({
    super.key,
    required this.title,
    this.trailingIcon,
    this.onTap,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: TextStyles.font16blackSemiBold.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            ),
            trailing: trailingIcon != null
                ? Icon(trailingIcon, color: Colors.red)
                : null,
            onTap: onTap,
          ),
          if (!isLast)
            Divider(
              thickness: 1,
              indent: 20,
              endIndent: 10,
              color: Colors.grey.shade300,
            ),
        ],
      ),
    );
  }
}
