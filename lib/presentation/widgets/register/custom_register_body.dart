import 'package:ambulance/core/size_config.dart';
import 'package:ambulance/presentation/widgets/register/custom_register_textformfield.dart';
import 'package:flutter/material.dart';

import '../../../core/app_string.dart';
import '../custom_form_title.dart';

class CustomRegisterBody extends StatelessWidget {
  const CustomRegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(
          SizeConfig.safeBlockHorizontal * 0.04,
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFormTitle(
              title: AppString.titleRegisterForm,
              subTitle: AppString.subTitleRegisterForm,
            ),
            CustomRegisterTextformfield()
          ],
        ),
      ),
    );
  }
}
