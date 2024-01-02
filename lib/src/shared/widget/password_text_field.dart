import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../infrastructures/themes/custom_theme.dart';
import '../../infrastructures/utils/constants/icon_asset_paths.dart';
import '../../infrastructures/utils/constants/utils.dart';
import 'booof_icon/booof_asset_svg_icon.dart';
import 'booof_icon/booof_icons.dart';
import 'primary_text_field.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(bool value)? onObscuredChanged;
  final bool isHided;

  const PasswordTextField({
    required this.controller,
    this.onObscuredChanged,
    this.isHided = true,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => PrimaryTextField(
        controller: controller,
        obscureText: isHided,
        validator: utils.passwordValidator,
        topLabel: 'Password',
        decoration: _decoration(context),
      );

  InputDecoration _decoration(
    final BuildContext context,
  ) =>
      InputDecoration(
        suffixIcon: _showHidePassword(),
        //TODO: localization
        hintText: 'At least 8 characters contains letters and numbers',
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: customTheme.textColor.withOpacity(
                0.3,
              ),
            ),
      );

  Widget _showHidePassword() => GestureDetector(
        onTap: onObscuredChanged != null
            ? () => onObscuredChanged!.call(!isHided)
            : null,
        child: isHided
            ? const Icon(
                CupertinoIcons.eye_slash,
              )
            : const Icon(
                CupertinoIcons.eye,
              ),
      );
}
