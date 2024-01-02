import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import '../../../../infrastructures/themes/custom_theme.dart';
import '../../../../infrastructures/utils/constants/utils.dart';
import '../../../../shared/widget/custom_time_line_widget.dart';
import '../../../../shared/widget/jobs_subtasks_and_location_widget.dart';
import '../../models/active_job_view_model.dart';
import 'job_list_page_active_job_map.dart';

class PersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final ActiveJobViewModel item;
  final void Function() onContinueTap;

  PersistentHeaderDelegate({
    required this.item,
    required this.onContinueTap,
  });

  @override
  double get minExtent => 200.0;

  @override
  double get maxExtent => 430.0;

  @override
  Widget build(final BuildContext context, final double shrinkOffset,
      final bool overlapsContent) {
    final percent = shrinkOffset / (maxExtent - minExtent);
    return Stack(
      children: [
        JobListPageActiveJobMapWidget(
          position: Position(item.longitude, item.latitude),
        ),
        DecoratedBox(
          decoration: _decoration(percent),
          child: _body(context),
        ),
      ],
    );
  }

  Widget _body(final BuildContext context) => Padding(
        padding: utils.mediumPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _description(context),
            utils.giantVerticalSpacer,
            _timeline(),
            utils.smallVerticalSpacer,
            _buttonAndDetails(context),
          ],
        ),
      );

  Widget _timeline() => CustomTimeLine(
        doneSubtasks: item.doneSubtasks,
        totalSubtasks: item.totalSubtasks,
      );

  Widget _buttonAndDetails(final BuildContext context) => Row(
        children: [
          _locationAndSubtasks(context),
          utils.smallHorizontalSpacer,
          _button(),
        ],
      );

  Widget _locationAndSubtasks(final BuildContext context) =>
      JobsSubtasksAndLocationWidget(
        subtasks: item.totalSubtasks,
        location: item.location,
        iconSize: 9,
        color: customTheme.textColor.shade50,
        textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              //TODO: handle in font theme,
              fontSize: 10,
            ),
      );

  Widget _button() => ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll(customTheme.textColor.shade50),
          foregroundColor: MaterialStatePropertyAll(
            customTheme.primaryColor,
          ),
        ),
        onPressed: onContinueTap,
        child: const Text(
          'Continue Job',
        ),
      );

  Text _description(final BuildContext context) => Text(
        item.description,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: customTheme.textColor.shade50,
            ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      );

  BoxDecoration _decoration(final double percent) => BoxDecoration(
        gradient: LinearGradient(
            begin: AlignmentDirectional.bottomCenter,
            end: AlignmentDirectional.topCenter,
            colors: [
              customTheme.primaryColor,
              Colors.transparent,
            ],
            stops: [
              0.25 + percent,
              1.0,
            ]),
        borderRadius: BorderRadius.circular(
          customTheme.borderRadiusRound,
        ),
      );

  @override
  bool shouldRebuild(
          covariant final SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
