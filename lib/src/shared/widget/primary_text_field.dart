import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../infrastructures/themes/custom_theme.dart';
import '../../infrastructures/utils/constants/utils.dart';

class PrimaryTextField extends StatelessWidget {
  final String topLabel;
  final String? bottomHint;
  final String? Function(String? value)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final InputDecoration? decoration;

  const PrimaryTextField({
    required this.topLabel,
    this.keyboardType,
    this.decoration,
    this.obscureText = false,
    this.bottomHint,
    this.controller,
    this.validator,
    this.inputFormatters,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _label(context),
          utils.tinyVerticalSpacer,
          _textField(),
          if (bottomHint != null) _hintField(context),
        ],
      );

  Widget _textField() => TextFormField(
        cursorColor: customTheme.textColor,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        decoration: decoration,
      );

  Widget _label(final BuildContext context) => Text(
        topLabel,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: customTheme.textColor.withOpacity(
                0.7,
              ),
            ),
      );

  Widget _hintField(final BuildContext context) => Column(
        children: [
          utils.tinyVerticalSpacer,
          _hintText(context),
        ],
      );

  Widget _hintText(final BuildContext context) => Text(
        bottomHint!,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: customTheme.textColor.withOpacity(
                0.5,
              ),
            ),
      );
}
