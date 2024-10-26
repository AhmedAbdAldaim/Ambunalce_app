import 'package:ambulance/core/size_config.dart';
import 'package:ambulance/presentation/widgets/ambunalce_request/custom_ambunalce_request_textformfield.dart';
import 'package:flutter/material.dart';
import '../../../core/app_string.dart';
import '../custom_form_title.dart';

class CustomAmbunalceRequestBody extends StatelessWidget {
  const CustomAmbunalceRequestBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        SizeConfig.safeBlockHorizontal * 0.04,
      ),
      child: const CustomAmbunalceRequestTextformfield(),
    );
  }
}
