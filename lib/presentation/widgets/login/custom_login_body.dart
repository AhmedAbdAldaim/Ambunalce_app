import 'package:ambulance/core/app_string.dart';
import 'package:ambulance/presentation/widgets/login/custom_login_header.dart';
import 'package:ambulance/presentation/widgets/login/custom_login_textformfield.dart';
import 'package:flutter/material.dart';
import '../../../core/size_config.dart';
import '../custom_form_title.dart';

class CustomLoginBody extends StatelessWidget {
  const CustomLoginBody({super.key});

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
            CustomLoginHeader(),
            CustomFormTitle(
              title: AppString.titleLoginForm,
              subTitle: AppString.subTitleLoginForm,
            ),
            CustomLoginTextformfield()
          ],
        ),
      ),
    );
  }
}
