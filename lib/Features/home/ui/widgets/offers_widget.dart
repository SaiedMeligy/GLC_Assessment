import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_cached_image.dart';


class OffersWidget extends StatelessWidget {
  final List<String> imageUrls;

  const OffersWidget({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding:  EdgeInsets.symmetric(horizontal: 12.w),
        itemCount: imageUrls.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return CustomCachedImage.service(imageUrls[index]);
        },
      ),
    );
  }
}
