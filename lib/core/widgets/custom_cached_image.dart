import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadiusGeometry borderRadius;
  final Color? placeholderColor;
  final Color? errorColor;
  final bool showProgress;
  final double progressSize;
  final Color progressColor;
  final Widget? overlay;
  final String? errorText;

  const CustomCachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = BorderRadius.zero,
    this.placeholderColor,
    this.errorColor,
    this.showProgress = true,
    this.progressSize = 22,
    this.progressColor = const Color(0xFF03BAFC),
    this.overlay,
    this.errorText,
  });

  factory CustomCachedImage.feed(String imageUrl) => CustomCachedImage(
    imageUrl: imageUrl,
    height: 180.h,
    borderRadius: BorderRadius.circular(12.r),
    placeholderColor: const Color(0xFFE0F7FA),
  );

  factory CustomCachedImage.avatar(String imageUrl, {double size = 50}) =>
      CustomCachedImage(
        imageUrl: imageUrl,
        width: size.w,
        height: size.h,
        borderRadius: BorderRadius.circular(size / 2),
        placeholderColor: Colors.grey[200],
        showProgress: false,
      );

  factory CustomCachedImage.service(String imageUrl) => CustomCachedImage(
    imageUrl: imageUrl,
    height: 120.h,
    borderRadius: BorderRadius.circular(10.r),
    placeholderColor: const Color(0xFFF5F5F5),
  );

  factory CustomCachedImage.banner(String imageUrl) => CustomCachedImage(
    imageUrl: imageUrl,
    height: 200.h,
    borderRadius: BorderRadius.circular(16.r),
    placeholderColor: const Color(0xFFE3F2FD),
  );

  @override
  Widget build(BuildContext context) {
    final border = ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        placeholder: (_, __) => _buildPlaceholder(),
        errorWidget: (_, __, ___) => _buildError(),
      ),
    );

    return Stack(
      fit: StackFit.passthrough,
      children: [
        border,
        if (overlay != null) overlay!,
      ],
    );
  }

  Widget _buildPlaceholder() => Container(
    width: width,
    height: height,
    color: placeholderColor ?? Colors.grey[200],
    child: showProgress
        ? Center(
      child: SizedBox(
        width: progressSize.w,
        height: progressSize.h,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation(progressColor),
        ),
      ),
    )
        : null,
  );

  Widget _buildError() => Container(
    width: width,
    height: height,
    color: errorColor ?? Colors.grey[200],
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.broken_image, size: 36.sp, color: Colors.grey[400]),
        if (errorText != null)
          Padding(
            padding: EdgeInsets.only(top: 6.h),
            child: Text(
              errorText!,
              style: TextStyle(color: Colors.grey[600], fontSize: 12.sp),
            ),
          ),
      ],
    ),
  );
}
