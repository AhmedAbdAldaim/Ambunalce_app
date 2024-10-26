import 'package:flutter/material.dart';
import '../../core/app_styles.dart';

class CustomChioceChip extends StatelessWidget {
  final String label;
  final bool selected;
  final ValueChanged<bool>? onSelected;
  const CustomChioceChip(
      {super.key,
      required this.label,
      required this.selected,
      this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(
        label,
        style: AppStyles.textstyle03,
      ),
      selected: selected,
      onSelected: onSelected,
     // selectedColor: Colors.transparent,
    );
  }
}
