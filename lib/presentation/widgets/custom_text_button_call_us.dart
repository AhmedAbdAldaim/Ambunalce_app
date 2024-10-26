import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/app_icons.dart';
import '../../core/app_styles.dart';
import '../../core/helper/fun.dart';
import '../../core/size_config.dart';

class CustomTextButtonCallUs extends StatelessWidget {
  const CustomTextButtonCallUs({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        backgroundColor: Colors.red.shade900,
      ),
      onPressed: launchTell,
      icon: Icon(
        color: AppColors.whiteColor,
        AppIcons.kcalladd,
        size: SizeConfig.safeBlockVertical * 0.024,
      ),
      label: Text(
        'اتصل الآن',
        style: AppStyles.textstyle04.copyWith(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}
