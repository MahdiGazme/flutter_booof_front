import 'package:flutter/material.dart';

import 'custom_theme.dart';
import 'styles/app_bar_style.dart';
import 'styles/elevated_button_style.dart';
import 'styles/text_button_style.dart';
import 'styles/text_field_style.dart';
import 'styles/text_style.dart';

class CustomThemeData {
  CustomThemeData._();

  static ThemeData getTheme(final BuildContext context) => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          background: customTheme.backgroundColor,
          error: customTheme.dangerColor,
          primary: customTheme.primaryColor,
          secondary: customTheme.secondaryColor,
          surface: customTheme.primaryColor,
          surfaceVariant: customTheme.backgroundColor,
        ),
        fontFamily: customTheme.fontFamilyPrimary,
        appBarTheme: AppBarStyle.getStyle(context),
        inputDecorationTheme: TextFieldStyle.getStyle(context),
        elevatedButtonTheme: ElevatedButtonStyle.getStyle(context),
        textButtonTheme: TextButtonStyle.getStyle(context),
        textTheme: CustomTextStyle.getStyle,
      );
}
