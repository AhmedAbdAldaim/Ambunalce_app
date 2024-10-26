import 'package:ambulance/core/app_styles.dart';
import 'package:ambulance/core/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../core/widgets/custom_textformfield.dart';

class CustomTextformfieldShape extends StatelessWidget {
  final String titleTextFormField;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String messageEmptyValidator;
  final String? messsageLenghtUserNameValidator;
  final String? messsageLenghtPassValidator;
  final String? messageCheckPasswordSimilarity;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool? isPass;
  final bool? isUserName;
  final bool? isPhone;
  final int? maxLines;
  final VoidCallback? onPressedSuffuix;
  final String? passValue;
  final String? passConfirmValue;

  final List<TextInputFormatter>? inputFormatter;
  final ValueChanged<String>? onFieldSubmitted;
  const CustomTextformfieldShape(
      {super.key,
      required this.titleTextFormField,
      required this.controller,
      required this.focusNode,
      required this.textInputAction,
      required this.messageEmptyValidator,
      this.messsageLenghtUserNameValidator,
      this.messsageLenghtPassValidator,
      this.messageCheckPasswordSimilarity,
      required this.keyboardType,
      this.isPass,
      this.onPressedSuffuix,
      this.isUserName,
      this.passValue,
      this.passConfirmValue,
      this.onFieldSubmitted,
      this.isPhone,
      this.maxLines,
      this.inputFormatter});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          titleTextFormField,
          style: AppStyles.textstyle04,
        ),
        SizedBox(
          height: SizeConfig.safeBlockVertical * 0.005,
        ),
        CustomTextFormField(
          controller: controller,
          focusNode: focusNode,
          maxLines: maxLines,
          inputFormatter: isPhone == null
              ? []
              : [
                  FilteringTextInputFormatter.digitsOnly,
                ],
          validator: (val) {
            if (val!.isEmpty) {
              return messageEmptyValidator;
            }
            if (isUserName != null) {
              if (val.length < 4) {
                return messsageLenghtUserNameValidator;
              }
            }

            //add check messsageLenghtPassValidator to denied check lenght
            //password at login screeen
            if (isPass != null && messsageLenghtPassValidator != null) {
              if (val.length < 6) {
                return messsageLenghtPassValidator;
              }
            }
            if (passValue != null) {
              if (passValue != val) {
                return messageCheckPasswordSimilarity;
              }
            }

            return null;
          },
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          isPass: isPass,
          isPhone: isPhone,
          onPressedSuffuix: onPressedSuffuix,
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}
