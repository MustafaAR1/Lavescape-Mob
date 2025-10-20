import 'package:flutter/material.dart';
import 'package:lavescape_mob/app/constants/app_assets.dart';
import 'package:lavescape_mob/app/constants/app_colors.dart';
import 'package:lavescape_mob/app/constants/app_strings.dart';
import 'package:lavescape_mob/app/constants/app_text_styles.dart';
import 'package:lavescape_mob/app/widgets/app_paddings.dart';
import 'package:lavescape_mob/app/widgets/app_spacing_widgets.dart';
import 'package:lavescape_mob/widgets/phone_number_textfield.dart';
import 'package:lavescape_mob/widgets/social_login_buttons.dart';
import 'package:lavescape_mob/widgets/svg_icon.dart';
import 'package:lavescape_mob/widgets/ui_button.dart';
import 'package:lavescape_mob/widgets/ui_divider.dart';
import 'package:lavescape_mob/widgets/ui_scaffold.dart';
import 'package:lavescape_mob/widgets/ui_text.dart';

class ContinueWithMobileScreen extends StatelessWidget {
  const ContinueWithMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UiScaffold(
      body: AppPadding.xlarge(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 14,
          children: [
            VSpace.xlarge(),
            Center(child: UISvgIcon(AppAssets.appLogo)),
            VSpace.medium(),
            UIText(
              AppStrings.welcomeToLaveScape,
              style: AppTextStyles.heading,
            ),
            UIText(
              AppStrings.discoverAuthenticExperiences,
              style: AppTextStyles.body
                  .copyWith(fontSize: 14, color: AppColors.placeholder),
            ),
            VSpace.xxsmall(),
            PhoneNumberTextField(
              hintText: '(000) 000-0000',
            ),
            VSpace.large(),
            UIButton(
              onPressed: () {
                // Handle continue action
              },
              child: const UIText(AppStrings.continueText),
            ),
            VSpace.small(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UIDivider(),
                UIText('OR'),
                UIDivider(),
              ],
            ),
            VSpace.small(),
            SocialLoginButtons()
          ],
        ),
      ),
    );
  }
}
