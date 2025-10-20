import 'package:flutter/material.dart';
import 'package:lavescape_mob/app/constants/app_padding_values.dart';

class AppPadding extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final Widget? child;

  const AppPadding({super.key, required this.padding, this.child});

  AppPadding.all(double value, {super.key, this.child})
      : padding = EdgeInsets.all(value);

  AppPadding.symmetric(
      {super.key, double vertical = 0.0, double horizontal = 0.0, this.child})
      : padding =
            EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal);

  AppPadding.only(
      {super.key,
      this.child,
      double left = 0.0,
      double top = 0.0,
      double right = 0.0,
      double bottom = 0.0})
      : padding =
            EdgeInsets.only(left: left, top: top, right: right, bottom: bottom);

  const AppPadding.xxsmall({super.key, this.child})
      : padding = const EdgeInsets.all(AppPaddingValues.xxsmall);

  const AppPadding.xsmall({super.key, this.child})
      : padding = const EdgeInsets.all(AppPaddingValues.xsmall);

  const AppPadding.small({super.key, this.child})
      : padding = const EdgeInsets.all(AppPaddingValues.small);

  const AppPadding.medium({super.key, this.child})
      : padding = const EdgeInsets.all(AppPaddingValues.medium);

  const AppPadding.large({super.key, this.child})
      : padding = const EdgeInsets.all(AppPaddingValues.large);

  const AppPadding.xlarge({super.key, this.child})
      : padding = const EdgeInsets.all(AppPaddingValues.xlarge);

  const AppPadding.xxlarge({super.key, this.child})
      : padding = const EdgeInsets.all(AppPaddingValues.xxlarge);

  const AppPadding.xxxlarge({super.key, this.child})
      : padding = const EdgeInsets.all(AppPaddingValues.xxxlarge);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: child,
    );
  }
}
