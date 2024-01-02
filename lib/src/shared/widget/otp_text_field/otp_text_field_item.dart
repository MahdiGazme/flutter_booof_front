import 'package:flutter/material.dart';

import '../../../infrastructures/themes/styles/otp_text_field_style.dart';
import '../../../infrastructures/utils/constants/utils.dart';

class OtpTextFieldItem extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String value)? onChanged;
  final bool autoFocus;
  final bool isLastItem;

  final String? Function(String? value)? validator;

  const OtpTextFieldItem({
    required this.controller,
    this.onChanged,
    this.validator,
    this.autoFocus = false,
    this.isLastItem = false,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Theme(
        data: Theme.of(context).copyWith(
          inputDecorationTheme: OtpTextFieldStyle.getStyle(context),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: utils.tinySpace),
          child: TextFormField(
            controller: controller,
            autofocus: autoFocus,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium,
            showCursor: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: _decoration(),
            keyboardType: TextInputType.number,
            validator: validator,
            maxLength: 1,
            onChanged: (final value) {
              if (isLastItem && controller.text.isNotEmpty) {
                FocusScope.of(context).unfocus();
              } else if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              } else if (value.isEmpty) {
                FocusScope.of(context).previousFocus();
              }

              onChanged?.call(value);
            },
          ),
        ),
      );

  InputDecoration _decoration() => const InputDecoration(
        constraints: BoxConstraints(
          // maxWidth: 64,
          //TODO find a way to change this by changing the length
          maxWidth: 44,
        ),
        hintText: '0',
        counter: SizedBox(),
      );
}
