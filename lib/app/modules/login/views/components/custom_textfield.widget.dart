import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/responsive.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.obscureText,
    this.maxLength,
    this.prefix,
    this.suffix,
    this.validator,
  });
  final TextEditingController? controller;
  final String labelText;
  final String hintText;
  final int? maxLength;
  final bool? obscureText;
  final Widget? prefix;
  final Widget? suffix;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final theme = Get.theme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          labelText,
          style: theme.textTheme.labelLarge,
        ),
        SizedBox(height: SizeConfig.defaultSize),
        TextFormField(
          controller: controller,
          obscureText: obscureText ?? false,
          obscuringCharacter: '*',
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          maxLength: maxLength,
          decoration: InputDecoration(
            hintText: hintText,
            counterText: '',
            border: OutlineInputBorder(
              borderSide: BorderSide(color: theme.colorScheme.outline),
              borderRadius: BorderRadius.circular(SizeConfig.defaultSize),
            ),
            filled: true,
            fillColor: theme.colorScheme.outlineVariant.withAlpha(100),
            prefixIcon: prefix,
            suffixIcon: suffix,
          ),
        ),
      ],
    );
  }
}
