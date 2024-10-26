import 'package:ambulance/core/app_styles.dart';
import 'package:ambulance/core/size_config.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final bool? showBackgroundColor;
  final bool? showBoarderColor;
  final bool? addColorTitlle;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.showBackgroundColor,
    this.showBoarderColor,
    this.addColorTitlle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              SizeConfig.safeBlockHorizontal * 0.016,
            ),
            side: showBoarderColor == null
                ? BorderSide.none
                : BorderSide(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
          ),
          padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 0.03),
          backgroundColor: showBackgroundColor == null
              ? null
              : Theme.of(context).colorScheme.primary,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: AppStyles.textstyle04.copyWith(
            color: addColorTitlle == null
                ? null
                : Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ),
    );
  }
}
