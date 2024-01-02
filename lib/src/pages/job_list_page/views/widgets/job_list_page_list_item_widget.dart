import 'package:flutter/material.dart';

import '../../../../infrastructures/themes/custom_theme.dart';
import '../../../../infrastructures/utils/constants/utils.dart';
import '../../../../shared/widget/custom_avatar_widget.dart';
import '../../../../shared/widget/jobs_subtasks_and_location_widget.dart';
import '../../models/job_list_item_view_model.dart';

class JobListPageListItemWidget extends StatelessWidget {
  final AvailableJobsViewModel item;
  final void Function() onTap;
  final bool hasActiveJob;

  const JobListPageListItemWidget({
    required this.item,
    required this.onTap,
    required this.hasActiveJob,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: utils.smallSpace,
        ),
        child: DecoratedBox(
          decoration: _decoration(),
          child: _body(context),
        ),
      );

  Widget _body(final BuildContext context) => Padding(
        padding: utils.mediumPadding,
        child: Column(
          children: [
            _profileAndPayment(context),
            utils.mediumVerticalSpacer,
            _description(context),
            _divider(),
            _buttonAndDetails(context),
          ],
        ),
      );

  Widget _divider() => Divider(
        height: 50,
        color: customTheme.disabledColor,
      );

  Widget _description(final BuildContext context) => Text(
        item.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodySmall,
      );

  Widget _buttonAndDetails(final BuildContext context) => Row(
        children: [
          _locationAndSubtasks(context),
          utils.smallHorizontalSpacer,
          _button(context),
        ],
      );

  Widget _button(final BuildContext context) => ElevatedButton(
        onPressed: hasActiveJob ? null : onTap,
        child: const Text(
          'Look at Job',
        ),
      );

  Widget _locationAndSubtasks(final BuildContext context) =>
      JobsSubtasksAndLocationWidget(
        subtasks: item.subtasks,
        location: item.location,
        iconSize: 13,
        textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w500,
            ),
      );

  Widget _profileAndPayment(final BuildContext context) => Row(
        children: [
          _avatar(),
          utils.smallHorizontalSpacer,
          _names(context),
          _payment(context),
        ],
      );

  Widget _avatar() => CustomAvatarWidget(
        avatarId: item.avatarId,
      );

  Widget _names(final BuildContext context) => Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _companyName(context),
            _employerName(context),
          ],
        ),
      );

  Widget _companyName(final BuildContext context) => Text(
        item.companyName,
        style: Theme.of(context).textTheme.titleMedium,
      );

  Widget _employerName(final BuildContext context) => Text(
        item.employerName,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: customTheme.textColor.shade400,
            ),
      );

  Widget _payment(final BuildContext context) => Text(
        '\$${item.payment.toInt()}',
        style: Theme.of(context).textTheme.headlineSmall,
      );

  BoxDecoration _decoration() => BoxDecoration(
        color: customTheme.textColor.shade100,
        borderRadius: BorderRadius.circular(
          customTheme.borderRadiusSemiRound,
        ),
      );
}
