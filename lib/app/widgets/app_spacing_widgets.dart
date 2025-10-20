import 'package:flutter/material.dart';
import 'package:lavescape_mob/app/constants/app_spacing.dart';

class VSpace extends StatelessWidget {
  final double space;

  const VSpace(this.space, {super.key});

  const VSpace.xxsmall({super.key}) : space = AppSpacing.xxsmall;
  const VSpace.small({super.key}) : space = AppSpacing.small;
  const VSpace.medium({super.key}) : space = AppSpacing.medium;
  const VSpace.large({super.key}) : space = AppSpacing.large;
  const VSpace.xlarge({super.key}) : space = AppSpacing.xlarge;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: space);
  }
}

class HSpace extends StatelessWidget {
  final double space;

  const HSpace(this.space, {super.key});

  const HSpace.xxsmall({super.key}) : space = AppSpacing.xxsmall;
  const HSpace.small({super.key}) : space = AppSpacing.small;
  const HSpace.medium({super.key}) : space = AppSpacing.medium;
  const HSpace.large({super.key}) : space = AppSpacing.large;
  const HSpace.xlarge({super.key}) : space = AppSpacing.xlarge;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: space);
  }
}
