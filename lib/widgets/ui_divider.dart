import 'package:flutter/material.dart';
import 'package:lavescape_mob/app/constants/app_colors.dart';

class UIDivider extends StatelessWidget {
  final double thickness;
  final Color? color;
  final double horizontalPadding;
  final double? height;
  const UIDivider(
      {super.key,
      this.height,
      this.thickness = 0.5,
      this.color = AppColors.label,
      this.horizontalPadding = 0.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Divider(
        height: height,
        thickness: thickness,
        color: color,
      ),
    );
  }
}
