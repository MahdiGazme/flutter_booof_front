import 'package:flutter/material.dart';

import '../../infrastructures/themes/custom_theme.dart';
import '../../infrastructures/utils/constants/utils.dart';

class CustomAvatarWidget extends StatelessWidget {
  final String? avatarId;
  final double? size;

  const CustomAvatarWidget({
    super.key,
    this.avatarId,
    this.size,
  });

  @override
  Widget build(final BuildContext context) => CircleAvatar(
        radius: size == null ? utils.mediumAvatarSize / 2 : size! / 2,
        child: avatarId != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(
                  customTheme.borderRadiusCircular,
                ),
                child: Image.network(
                  avatarId!,
                ),
              )
            : const SizedBox(),
      );
}
