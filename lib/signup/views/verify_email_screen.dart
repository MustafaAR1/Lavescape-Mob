import 'package:flutter/material.dart';
import 'package:lavescape_mob/app/constants/app_strings.dart';
import 'package:lavescape_mob/widgets/ui_scaffold.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UiScaffold(
      title: AppStrings.verifyEmail,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Handle verification code input
          },
          child: const Text(AppStrings.verify),
        ),
      ),
    );
  }
}