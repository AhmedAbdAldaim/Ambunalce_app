import 'package:flutter/material.dart';

import '../../core/app_images.dart';
import '../../core/size_config.dart';

class CustomLogo extends StatelessWidget {
  final double? height;
  final double? width;
  const CustomLogo({super.key, this.width ,this.height});

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).colorScheme.brightness == Brightness.dark;
    return Image.asset(
      color: isDark ? Colors.white : Colors.black,
      AppImages.logoPng,
      width: width?? SizeConfig.safeBlockHorizontal * 0.30,
      height: height ?? SizeConfig.safeBlockVertical * 0.15,
    );
  }
}
