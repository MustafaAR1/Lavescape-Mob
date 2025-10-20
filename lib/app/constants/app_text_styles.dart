import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static const TextStyle headline = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    fontSize: 24,
    color: Colors.black,
  );

  static const TextStyle body = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: Colors.black,
  );

  static const TextStyle label = TextStyle(
    color: Color(0xFF1F2937),
    fontSize: 14,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    letterSpacing: 0.07,
  );

  static const TextStyle placeholder = TextStyle(
    color: Color(0xFF6B7280),
    fontSize: 15,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    letterSpacing: 0.07,
  );

  static const TextStyle countryCode = TextStyle(
    color: Color(0xFF6B7280),
    fontSize: 15,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    letterSpacing: 0.07,
  );
}
