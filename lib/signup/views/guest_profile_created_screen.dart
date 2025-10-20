import 'package:flutter/material.dart';
import 'package:lavescape_mob/app/constants/app_strings.dart';
import 'package:lavescape_mob/widgets/ui_scaffold.dart';

class GuestProfileCreatedScreen extends StatelessWidget {
  const GuestProfileCreatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const UiScaffold(
      title: AppStrings.profileCreated,
      body: Center(
        child: Text(AppStrings.welcomeMessage),
      ),
    );
  }
}