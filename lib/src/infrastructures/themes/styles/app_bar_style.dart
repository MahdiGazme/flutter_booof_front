import 'package:flutter/material.dart';

import '../custom_theme.dart';

class AppBarStyle {
  AppBarStyle._();

  static AppBarTheme getStyle(final BuildContext context) => AppBarTheme(
        backgroundColor: Colors.transparent,
        titleSpacing: 0.0,
        centerTitle: true,
        elevation: 0.0,
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: customTheme.textColor.withOpacity(0.5),
        ),
        toolbarTextStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: customTheme.textColor.withOpacity(0.5),
            ),

        actionsIconTheme: IconThemeData(
          color: customTheme.textColor,
        ),
        titleTextStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: customTheme.textColor.withOpacity(0.5),
            ),
        foregroundColor: customTheme.textColor.withOpacity(0.5),
      );
}
