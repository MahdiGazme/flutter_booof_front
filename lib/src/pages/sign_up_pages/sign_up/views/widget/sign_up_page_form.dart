import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../infrastructures/utils/constants/utils.dart';
import '../../../../../shared/widget/password_text_field.dart';
import '../../../../../shared/widget/primary_text_field.dart';
import '../../controller/sign_up_page_controller.dart';
import 'sign_up_agreement_widget.dart';

class SignUPPageForm extends GetView<SignUpPageController> {
  const SignUPPageForm({super.key});

  @override
  Widget build(final BuildContext context) => Form(
        key: controller.formKey,
        child: Column(
          children: [
            //TODO: set a proper validation for these
            _fullName(),
            utils.smallVerticalSpacer,
            _nationalID(),
            utils.smallVerticalSpacer,
            _email(),
            utils.smallVerticalSpacer,
            _password(),
            utils.mediumVerticalSpacer,
            _agreement()
          ],
        ),
      );

  Widget _password() => Obx(
        () => PasswordTextField(
          controller: controller.passwordText,
          isHided: controller.passwordHided.value,
          onObscuredChanged: (final value) =>
              controller.passwordHided.value = value,
        ),
      );

  Widget _email() => PrimaryTextField(
        topLabel: 'Email',
        controller: controller.emailText,
        validator: (final value) => utils.regularValidator(value!),
      );

  Widget _nationalID() => PrimaryTextField(
        topLabel: 'National ID',
        controller: controller.nationalIdText,
        validator: (final value) => utils.regularValidator(value!),
      );

  Widget _fullName() => PrimaryTextField(
        topLabel: 'Full Name',
        controller: controller.fullNameText,
        validator: (final value) => utils.regularValidator(value!),
      );

  Widget _agreement() => Obx(
        () => SignUpPageAgreementWidget(
          value: controller.isAgreedToTermsAndConditions.value,
          onChanged: (final value) =>
              controller.isAgreedToTermsAndConditions.value = value,
        ),
      );
}
