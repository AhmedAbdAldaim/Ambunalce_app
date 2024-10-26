import 'package:ambulance/core/app_icons.dart';
import 'package:ambulance/core/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String> validator;
  final TextInputType? keyboardType;
  final bool? isPass;
  final bool? isPhone;
  final int? maxLines;
  final VoidCallback? onPressedSuffuix;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatter;
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.focusNode,
      required this.validator,
      this.textInputAction,
      required this.keyboardType,
      this.isPass,
      this.onPressedSuffuix,
      this.isPhone,
      this.maxLines,
      required this.onFieldSubmitted, this.inputFormatter});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      inputFormatters: inputFormatter,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        suffixIcon: isPass == null
            ? null
            : IconButton(
                onPressed: onPressedSuffuix,
                icon: Icon(
                  isPass == true ? AppIcons.keye : AppIcons.keyeRemove,
                ),
              ),
      ),
      maxLength: isPhone != null ? 10 : null,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      obscureText: isPass ?? false,
      minLines: maxLines,
      maxLines: maxLines ?? 1,
      style: AppStyles.textstyle03,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
