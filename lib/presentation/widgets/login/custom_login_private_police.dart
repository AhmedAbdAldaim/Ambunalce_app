import 'package:ambulance/core/app_string.dart';
import 'package:flutter/material.dart';

import '../../../core/app_styles.dart';
import '../../../core/helper/fun.dart';

class CustomLoginPrivatePolice extends StatelessWidget {
  const CustomLoginPrivatePolice({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.center,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        children: [
          Text(
            'بتسجيل الدخول توافق على ',
            style: AppStyles.textstyle03,
          ),
          TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            onPressed: ()=>launchURL(url: AppString.privatePoliceUrl),
            child: Text(
              'سياسة الخصوصية',
              style: AppStyles.textstyle03,
            ),
          )
        ],
      ),
    );
  }
}
