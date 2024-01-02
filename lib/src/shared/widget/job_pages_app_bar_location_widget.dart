import 'package:flutter/material.dart';

import '../../infrastructures/themes/custom_theme.dart';
import '../../infrastructures/utils/constants/utils.dart';

class JobPagesAppBarLocationWidget extends StatelessWidget {
  final String location;

  const JobPagesAppBarLocationWidget({
    required this.location,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _titleText(context),
          utils.tinyVerticalSpacer,
          _location(context),
        ],
      );

  Widget _titleText(final BuildContext context) => Text(
        'AVAILABLE JOBS',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 13,
            ),
      );

  Widget _location(final BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _locationIcon(),
          _locationText(context),
        ],
      );

  Widget _locationText(final BuildContext context) => Text(
        location,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: customTheme.textColor.withOpacity(
                0.5,
              ),
              fontSize: 9,
            ),
      );

  Widget _locationIcon() => const Icon(
        Icons.location_on_outlined,
        size: 12,
      );
}
