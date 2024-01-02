import 'package:flutter/material.dart';

import '../../../../infrastructures/themes/custom_theme.dart';
import '../../../../infrastructures/utils/constants/utils.dart';
import '../../../../shared/widget/job_pages_app_bar_location_widget.dart';

class JobListPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final void Function() onAvatarTap;

  final void Function() onNotificationsTap;
  final String location;

  const JobListPageAppBar({
    required this.onNotificationsTap,
    required this.location,
    required this.onAvatarTap,
    this.preferredSize = const Size.fromHeight(kToolbarHeight),
    super.key,
  });

  @override
  Widget build(final BuildContext context) => AppBar(
        leadingWidth: utils.smallAvatarSize + (utils.smallSpace * 2),
        leading: _avatar(),
        actions: [
          _notification(),
        ],
        title: JobPagesAppBarLocationWidget(
          location: location,
        ),
      );

  Widget _avatar() => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: utils.smallSpace,
        ),
        child: GestureDetector(
          onLongPress: onAvatarTap,
          child: CircleAvatar(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                customTheme.borderRadiusCircular,
              ),
              child: _image(),
            ),
          ),
        ),
      );

  Widget _image() => Image.network(
        'https://marketplace.canva.com/EAFOWUXOOvs/1/0/800w/canva-green-gradient-minimalist-simple-instagram-profile-picture-ZtCfUoGJtSw.jpg',
        fit: BoxFit.cover,
        errorBuilder: (
          final c,
          final o,
          final s,
        ) =>
            const Icon(
          Icons.accessible_forward,
        ),
      );

  IconButton _notification() => IconButton(
        onPressed: onNotificationsTap,
        padding: EdgeInsets.zero,
        icon: const Icon(
          Icons.notifications_none_rounded,
        ),
      );
}
