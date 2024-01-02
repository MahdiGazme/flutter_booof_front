import 'package:flutter/material.dart';

import '../../infrastructures/utils/constants/utils.dart';

class JobsSubtasksAndLocationWidget extends StatelessWidget {
  final int subtasks;
  final String location;
  final Color? color;
  final TextStyle? textStyle;
  final double? iconSize;

  const JobsSubtasksAndLocationWidget({
    required this.subtasks,
    required this.location,
    super.key,
    this.color,
    this.textStyle,
    this.iconSize,
  });

  @override
  Widget build(final BuildContext context) => Expanded(
        child: Wrap(
          children: [
            _location(context),
            utils.smallHorizontalSpacer,
            _subtasks(context),
          ],
        ),
      );

  Widget _subtasks(final BuildContext context) => _iconAndLabelWidget(
        context,
        '$subtasks Subtasks',
        Icons.layers_outlined,
      );

  Widget _location(final BuildContext context) => _iconAndLabelWidget(
        context,
        location,
        Icons.location_on_outlined,
      );

  Widget _iconAndLabelWidget(
    final BuildContext context,
    final String text,
    final IconData icon,
  ) =>
      Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _icon(icon),
          utils.tinyHorizontalSpacer,
          _label(context, text)
        ],
      );

  Widget _icon(final IconData icon) => Icon(
        icon,
        size: iconSize,
        color: color,
      );

  Widget _label(final BuildContext context, final String text) => Text(
        text,
        style: textStyle?.copyWith(
          color: color,
        ),
      );
}
