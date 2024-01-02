import 'package:flutter/material.dart';

import '../../../infrastructures/themes/custom_theme.dart';
import '../../../infrastructures/utils/constants/utils.dart';
import 'otp_text_field_item.dart';

class OtpTextField extends StatefulWidget {
  final GlobalKey formKey;
  final String? Function(String? value)? validator;
  final int length;
  final String? hint;
  final void Function(String value)? onCompleted;

  const OtpTextField({
    required this.formKey,
    required this.length,
    this.validator,
    this.hint,
    this.onCompleted,
    super.key,
  });

  @override
  State<OtpTextField> createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  final List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();

    for (var i = 1; i <= widget.length; i++) {
      _controllers.add(TextEditingController());
    }
  }

  @override
  Widget build(final BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _label(context),
          utils.smallVerticalSpacer,
          _textFields(),
          if (widget.hint != null) _hintText(context),
        ],
      );

  Widget _textFields() => Form(
        key: widget.formKey,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: _generateOTPs(),
        ),
      );

  OtpTextFieldItem _otherOTPs(
    final TextEditingController controller,
  ) =>
      OtpTextFieldItem(
        controller: controller,
        validator: widget.validator,
      );

  OtpTextFieldItem _lastOtp(
    final TextEditingController controller,
  ) =>
      OtpTextFieldItem(
        controller: controller,
        validator: widget.validator,
        isLastItem: true,
        onChanged: (final value) => widget.onCompleted?.call(
          _summery(),
        ),
      );

  OtpTextFieldItem _firstOtp(
    final TextEditingController controller,
  ) =>
      OtpTextFieldItem(
        autoFocus: true,
        controller: controller,
        validator: widget.validator,
      );

  List<Widget> _generateOTPs() {
    final textFields = <Widget>[];

    for (var i = 0; i < _controllers.length; i++) {
      if (i == 0) {
        textFields.add(
          _firstOtp(
            _controllers[i],
          ),
        );
      } else if (i < _controllers.length - 1) {
        textFields.add(
          _otherOTPs(
            _controllers[i],
          ),
        );
      } else {
        textFields.add(
          _lastOtp(
            _controllers[i],
          ),
        );
      }
    }

    return textFields;
  }

  String _summery() {
    final summery = StringBuffer();
    for (final element in _controllers) {
      summery.write(element.text);
    }

    return summery.toString();
  }

  Widget _label(final BuildContext context) => Text(
        'Secure Text',
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: customTheme.textColor.withOpacity(
                0.7,
              ),
            ),
      );

  Widget _hintText(final BuildContext context) => Text(
        widget.hint!,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: customTheme.textColor.withOpacity(
                0.5,
              ),
            ),
      );
}
