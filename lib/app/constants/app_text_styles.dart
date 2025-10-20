import 'package:flutter/material.dart';
import 'package:lavescape_mob/app/constants/app_colors.dart';

abstract class AppTextStyles {
  static const TextStyle headline = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    fontSize: 24,
    color: AppColors.heading,
  );

  static const TextStyle body = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: AppColors.heading,
  );

  static const TextStyle label = TextStyle(
    color: AppColors.label,
    fontSize: 14,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    letterSpacing: 0.07,
  );
  static const TextStyle heading = TextStyle(
    color: AppColors.heading,
    fontSize: 14,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    letterSpacing: 0.07,
  );

  static const TextStyle placeholder = TextStyle(
    color: AppColors.placeholder,
    fontSize: 15,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    letterSpacing: 0.07,
  );

  static const TextStyle countryCode = TextStyle(
    color: AppColors.placeholder,
    fontSize: 15,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    letterSpacing: 0.07,
  );
}
