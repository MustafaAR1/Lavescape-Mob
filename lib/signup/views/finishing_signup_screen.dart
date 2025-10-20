import 'package:flutter/material.dart';
import 'package:lavescape_mob/app/constants/app_strings.dart';
import 'package:lavescape_mob/widgets/ui_scaffold.dart';

class FinishingSignupScreen extends StatelessWidget {
  const FinishingSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UiScaffold(
      title: AppStrings.finishingSignup,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Handle finish signup
          },
          child: const Text(AppStrings.finish),
        ),
      ),
    );
  }
}