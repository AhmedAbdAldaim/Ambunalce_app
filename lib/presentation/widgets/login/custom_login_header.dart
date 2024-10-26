import 'package:ambulance/presentation/widgets/custom_logo.dart';
import 'package:ambulance/presentation/widgets/custom_text_button_call_us.dart';
import 'package:flutter/material.dart';
import '../../../core/size_config.dart';

class CustomLoginHeader extends StatelessWidget {
  const CustomLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomLogo(),
        SizedBox(
          height: SizeConfig.safeBlockVertical * 0.05,
          child: const VerticalDivider(),
        ),
        const CustomTextButtonCallUs(),
      ],
    );
  }
}
