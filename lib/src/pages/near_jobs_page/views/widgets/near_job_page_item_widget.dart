import 'package:flutter/material.dart';

import '../../../../infrastructures/themes/custom_theme.dart';
import '../../../../infrastructures/utils/constants/utils.dart';
import '../../../../shared/widget/custom_avatar_widget.dart';
import '../../../../shared/widget/jobs_subtasks_and_location_widget.dart';
import '../../models/near_jobs_view_model.dart';

class NearJobPageItemWidget extends StatelessWidget {
  final NearJobsViewModel item;
  final void Function(String id) onTap;

  const NearJobPageItemWidget({
    required this.item,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => _body(context);

  Widget _body(final BuildContext context) => Padding(
        padding: utils.smallPadding,
        child: InkWell(
          onTap: () => onTap.call(item.address),
          borderRadius: _borderRadius(),
          child: _content(context),
        ),
      );

  Widget _content(final BuildContext context) => Material(
        borderRadius: _borderRadius(),
        elevation: 5,
        child: Padding(
          padding: utils.smallPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _profileAndPayment(context),
              _details(context),
            ],
          ),
        ),
      );

  Widget _details(final BuildContext context) => Row(
        children: [_subtasksAndAddress(context), _remainingTime(context)],
      );

  Widget _remainingTime(final BuildContext context) => Text(
        //TODO: use date time formatter
        'Until ${item.date.day} Nov',
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 11.5,
              color: customTheme.textColor.shade400,
            ),
      );

  Widget _subtasksAndAddress(final BuildContext context) =>
      JobsSubtasksAndLocationWidget(
        location: item.address,
        subtasks: item.subtasks,
        iconSize: 10.6,
        textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 11.5,
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
        avatarId: item.avatar,
        size: utils.smallAvatarSize,
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
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: customTheme.textColor.shade400,
            ),
      );

  Widget _payment(final BuildContext context) => Text(
        '\$${item.payment.toInt()}',
        style: Theme.of(context).textTheme.headlineSmall,
      );

  BorderRadius _borderRadius() => BorderRadius.circular(
        customTheme.borderRadiusSemiRound,
      );
}
