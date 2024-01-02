import 'package:flutter/material.dart';

import '../../../../infrastructures/themes/custom_theme.dart';

class BalancePageTotalBalanceWidget extends StatelessWidget {
  final Animation<double> animation;
  final String totalBalance;
  final double maxHeight;
  final Size Function(String text, TextStyle style) calculateTextSize;

  const BalancePageTotalBalanceWidget({
    required this.animation,
    required this.totalBalance,
    required this.maxHeight,
    required this.calculateTextSize,
    super.key,
  });

  @override
  Widget build(
    final BuildContext context,
  ) =>
      Positioned.fill(
        left: Tween<double>(
                begin: MediaQuery.of(context).size.width / 2 - 72
                // 2x of font size,
                ,
                end: MediaQuery.of(context).size.width / 2 - 110)
            .evaluate(animation),
        top: Tween<double>(
          begin: kToolbarHeight,
          end: maxHeight / 2,
        ).evaluate(animation),
        child: RichText(
          text: TextSpan(
            children: [
              _price(),
              _decimalPrice(),
              if (totalBalance.split('.').last.length == 1)
                TextSpan(
                  text: '0',
                  style: _decimalTextTheme(),
                ),
            ],
          ),
        ),
      );

  TextSpan _decimalPrice() => TextSpan(
        text: '.${totalBalance.split('.').last}',
        style: _decimalTextTheme(),
      );

  TextSpan _price() => TextSpan(
        text: totalBalance.split('.').first,
        style: _mainStyle(),
      );

  TextStyle _mainStyle() => TextStyle(
        fontSize: _fontSize(animation),
        color: customTheme.textColor.shade50,
        fontWeight: FontWeight.w600,
      );

  TextStyle _decimalTextTheme() => TextStyle(
        fontSize: _fontSize(animation),
        color: customTheme.textColor.shade50.withOpacity(
          0.6,
        ),
        fontWeight: FontWeight.w600,
      );

  double _fontSize(
    final Animation<double> animation,
  ) =>
      Tween<double>(
        begin: 36,
        end: 55,
      ).evaluate(animation);
}
