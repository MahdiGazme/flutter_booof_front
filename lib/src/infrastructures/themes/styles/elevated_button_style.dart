import 'package:flutter/material.dart';

import '../../utils/constants/utils.dart';
import '../custom_theme.dart';

class ElevatedButtonStyle {
  ElevatedButtonStyle._();

  static ElevatedButtonThemeData getStyle(
    final BuildContext context,
  ) =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          maximumSize: const MaterialStatePropertyAll(
            Size(
              130,
              40,
            ),
          ),
          minimumSize: const MaterialStatePropertyAll(
            Size(
              80,
              32,
            ),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  customTheme.borderRadiusRound,
                ),
              ),
            ),
          ),
          textStyle: MaterialStatePropertyAll(
            Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          foregroundColor: MaterialStateProperty.all<Color>(
            customTheme.textColor.shade50,
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
            (final states) {
              if (states.contains(MaterialState.pressed)) {
                return Theme.of(context).colorScheme.primary;
              } else if (states.contains(MaterialState.disabled)) {
                return customTheme.primaryColor.shade300;
              }
              return null; // Use the component's default.
            },
          ),
          padding: MaterialStatePropertyAll(
            utils.smallPadding,
          ),
          enableFeedback: true,
          elevation: const MaterialStatePropertyAll(0.0),
        ),
      );
}
