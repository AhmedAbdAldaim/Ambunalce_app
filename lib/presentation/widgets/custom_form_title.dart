import 'package:flutter/material.dart';

import '../../core/app_styles.dart';
import '../../core/size_config.dart';

class CustomFormTitle extends StatelessWidget {
  final String title;
  final String subTitle;
  const CustomFormTitle({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: AppStyles.textstyle06.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: SizeConfig.safeBlockVertical * 0.01,
        ),
        Text(
          subTitle,
          style: AppStyles.textstyle03.copyWith(),
        ),
        SizedBox(
          height: SizeConfig.safeBlockVertical * 0.02,
        ),
      ],
    );
  }
}
