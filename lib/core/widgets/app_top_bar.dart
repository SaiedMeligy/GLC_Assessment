import 'package:flutter/material.dart';
import 'package:glc_assessment/core/theming/styles.dart';
import '../theming/colors.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String username;
  final double balance;
  final VoidCallback? onRefresh;

  const AppTopBar({
    super.key,
    required this.title,
    required this.username,
    required this.balance,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManager.secondAppColor,
      elevation: 0,
      centerTitle: true,
      title: Text(title, style: TextStyles.font20whiteSemiBold),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
        },
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.card_giftcard, color: Colors.white),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
