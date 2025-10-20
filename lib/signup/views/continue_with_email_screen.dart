import 'package:flutter/material.dart';
import 'package:lavescape_mob/app/constants/app_strings.dart';
import 'package:lavescape_mob/widgets/ui_scaffold.dart';

class ContinueWithEmailScreen extends StatelessWidget {
  const ContinueWithEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UiScaffold(
      title: AppStrings.continueWithEmail,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the next screen or handle email input
          },
          child: const Text(AppStrings.next),
        ),
      ),
    );
  }
}