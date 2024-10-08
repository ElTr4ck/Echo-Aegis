import 'package:flutter/material.dart';
import 'package:echo_app/theme/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset('lib/assets/images/logo-no-background.png', height: 40),
      centerTitle: true,
      backgroundColor: AppColors.background,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
