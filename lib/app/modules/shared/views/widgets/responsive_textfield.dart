import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/responsive.dart';

class ResponsiveTextField extends StatelessWidget {
  const ResponsiveTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.validator,
    this.enabled = true,
    this.obscureText = false,
    this.initialValue,
    this.prefix,
    this.suffix,
  });
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool enabled;
  final bool obscureText;
  final String? initialValue;
  final Widget? prefix;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    final theme = Get.theme;
    return Wrap(
      alignment: Responsive.isMobile(context)
          ? WrapAlignment.start
          : WrapAlignment.center,
      crossAxisAlignment: Responsive.isMobile(context)
          ? WrapCrossAlignment.start
          : WrapCrossAlignment.center,
      spacing: Responsive.isMobile(context)
          ? SizeConfig.defaultSize
          : SizeConfig.defaultSize * 0.4,
      runSpacing: Responsive.isMobile(context)
          ? SizeConfig.defaultSize
          : SizeConfig.defaultSize * 0.4,
      children: [
        Text(
          labelText,
          style: theme.textTheme.bodyMedium,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 650),
          child: TextFormField(
            controller: controller,
            enabled: enabled,
            obscureText: obscureText,
            initialValue: initialValue,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
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
        ),
      ],
    );
  }
}
