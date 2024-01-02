import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../infrastructures/utils/constants/asset_paths.dart';
import '../../../../infrastructures/utils/constants/utils.dart';
import '../../../../shared/widget/app_slogan_widget.dart';
import '../../../../shared/widget/custom_app_bar.dart';
import '../../../../shared/widget/custom_asset_image.dart';
import '../../../../shared/widget/custom_scaffold.dart';
import '../../../../shared/widget/primary_text_field.dart';
import '../../../../shared/widget/wide_elevated_button.dart';
import '../controller/phone_confirmation_page_controller.dart';

class PhoneConfirmationPage extends GetView<PhoneConfirmationPageController> {
  const PhoneConfirmationPage({super.key});

  @override
  Widget build(final BuildContext context) => CustomScaffold(
        appBar: _appBar(),
        body: Column(
          children: [
            _content(),
            utils.smallVerticalSpacer,
            _button(),
          ],
        ),
      );

  Widget _content() => Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AppSloganWidget(),
              _form(),
            ],
          ),
        ),
      );

  Widget _form() => Form(
        key: controller.formKey,
        child: _phoneNumber(),
      );

  Widget _phoneNumber() => PrimaryTextField(
        topLabel: 'Phone Number',
        controller: controller.phoneNumberText,
        keyboardType: TextInputType.phone,
        validator: (final value) => controller.phoneNumberValidator(
          value!,
        ),
        bottomHint: 'We’ll text you a code to confirm your number.',
      );

  Widget _button() => Obx(
        () => WideElevatedButton(
          showLoading: controller.showLoading.value,
          onPressed: controller.onSendButtonTep,
          title: 'Send',
        ),
      );

  CustomAppBar _appBar() => CustomAppBar(
        title: CustomAssetImage(
          path: assetPaths.secondaryLogo,
        ),
      );
}
