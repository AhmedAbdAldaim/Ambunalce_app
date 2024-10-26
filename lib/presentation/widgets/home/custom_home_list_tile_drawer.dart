import 'package:flutter/material.dart';

import '../../../core/app_styles.dart';
import '../../../core/size_config.dart';

class CustomHomeListTileDrawer extends StatelessWidget {
  final IconData icon;
  final String title;
  final GestureTapCallback? onTap;
  const CustomHomeListTileDrawer({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: SizeConfig.safeBlockVertical * 0.03,
      ),
      title: Text(
        title,
        style: AppStyles.textstyle04,
      ),
      onTap: onTap,
    );
  }
}
