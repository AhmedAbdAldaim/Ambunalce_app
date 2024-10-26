import 'package:ambulance/core/size_config.dart';
import 'package:flutter/material.dart';

class CustomHomeIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const CustomHomeIconButton({super.key, required this.icon,required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ,
      icon: CircleAvatar(
        radius: SizeConfig.safeBlockHorizontal * 0.06,
        child: Icon(
          icon,
          size: SizeConfig.safeBlockVertical * 0.03,
        ),
      ),
    );
  }
}
