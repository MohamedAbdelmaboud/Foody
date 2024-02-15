import 'package:flutter/material.dart';
import 'package:foody/core/utlis/styles.dart';
import 'package:foody/features/Auth/presentaion/views/widgets/custom_text_form_field.dart';

class CustomColumn extends StatelessWidget {
  final String text;

  final String hintText;

  final IconData prefixIcon;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  const CustomColumn(
      {super.key,
      required this.text,
      required this.hintText,
      required this.prefixIcon,
      this.onChanged,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              text,
              style: Styles.textStyle14,
            ),
          ],
        ),
        CustomTextFromField(
          prefixIcon: prefixIcon,
          hintText: hintText,
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    );
  }
}
