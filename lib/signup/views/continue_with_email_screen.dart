import 'package:flutter/material.dart';
import 'package:lavescape_mob/app/constants/app_strings.dart';
import 'package:lavescape_mob/widgets/ui_scaffold.dart';
import 'package:lavescape_mob/widgets/ui_textfield.dart';
import 'package:lavescape_mob/widgets/ui_button.dart';
import 'package:lavescape_mob/app/widgets/app_paddings.dart';
import 'package:lavescape_mob/app/widgets/app_spacing_widgets.dart';

class ContinueWithEmailScreen extends StatelessWidget {
  const ContinueWithEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UiScaffold(
      title: AppStrings.continueWithEmail,
      body: AppPadding.xlarge(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VSpace.large(),
            UITextField(
              hintText: 'Email Address',
              keyboardType: TextInputType.emailAddress,
            ),
            const VSpace.large(),
            UIButton(
              onPressed: () {
                // Navigate to the next screen or handle email input
              },
              child: const Text(AppStrings.next),
            ),
          ],
        ),
      ),
    );
  }
}
