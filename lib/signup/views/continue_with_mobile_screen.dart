import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavescape_mob/app/constants/app_assets.dart';
import 'package:lavescape_mob/app/constants/app_colors.dart';
import 'package:lavescape_mob/app/constants/app_strings.dart';
import 'package:lavescape_mob/app/constants/app_text_styles.dart';
import 'package:lavescape_mob/app/widgets/app_paddings.dart';
import 'package:lavescape_mob/app/widgets/app_spacing_widgets.dart';
import 'package:lavescape_mob/signup/cubit/signup_cubit.dart';
import 'package:lavescape_mob/widgets/phone_number_textfield.dart';
import 'package:lavescape_mob/widgets/social_login_buttons.dart';
import 'package:lavescape_mob/widgets/svg_icon.dart';
import 'package:lavescape_mob/widgets/ui_button.dart';
import 'package:lavescape_mob/widgets/ui_divider.dart';
import 'package:lavescape_mob/widgets/ui_scaffold.dart';
import 'package:lavescape_mob/widgets/ui_text.dart';
import 'package:lavescape_mob/utils/app_validators.dart';
import 'package:lavescape_mob/app/routes/app_pages.dart';
import 'package:lavescape_mob/app/routes/app_routes.dart';

class ContinueWithMobileScreen extends StatefulWidget {
  const ContinueWithMobileScreen({super.key});

  @override
  State<ContinueWithMobileScreen> createState() =>
      _ContinueWithMobileScreenState();
}

class _ContinueWithMobileScreenState extends State<ContinueWithMobileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _signupCubit = BlocProvider.of<SignupCubit>(context);

    return UiScaffold(
      body: AppPadding.xlarge(
        child: Form(
          key: _formKey,
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
                controller: _phoneNumberController,
                hintText: '(000) 000-0000',
                validator: (value) =>
                    AppValidators.validateEmpty(value, 'Phone number'),
              ),
              VSpace.large(),
              UIButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _signupCubit.setPhoneNumber(_phoneNumberController.text);
                    _signupCubit.routeToOTPScreen(context);
                  }
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
      ),
    );
  }
}
