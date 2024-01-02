import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../infrastructures/themes/custom_theme.dart';
import '../../infrastructures/utils/constants/utils.dart';

class AnimatedLoadingIndicator extends StatelessWidget {
  const AnimatedLoadingIndicator({super.key});

  @override
  Widget build(final BuildContext context) => Padding(
        padding: utils.largePadding,
        child: Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: customTheme.primaryColor,
            size: 50,
          ),
        ),
      );
}
