import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavescape_mob/app/constants/app_colors.dart';
import 'package:lavescape_mob/app/constants/app_strings.dart';
import 'package:lavescape_mob/app/constants/app_text_styles.dart';
import 'package:lavescape_mob/app/widgets/app_paddings.dart';
import 'package:lavescape_mob/app/widgets/app_spacing_widgets.dart';
import 'package:lavescape_mob/signup/cubit/signup_cubit.dart';
import 'package:lavescape_mob/signup/cubit/signup_state.dart';
import 'package:lavescape_mob/widgets/ui_button.dart';
import 'package:lavescape_mob/widgets/ui_scaffold.dart';
import 'package:lavescape_mob/widgets/ui_text.dart';
import 'package:lavescape_mob/widgets/otp_textfield.dart';
import 'package:flutter/services.dart';

class VerifyPhoneScreen extends StatefulWidget {
  const VerifyPhoneScreen({super.key});

  @override
  State<VerifyPhoneScreen> createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _signupCubit = BlocProvider.of<SignupCubit>(context);
    return UiScaffold(
      title: AppStrings.verifyPhone,
      body: AppPadding.xlarge(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIText(
              AppStrings.otpConfirmation,
              style: AppTextStyles.heading,
            ),
            VSpace.xxsmall(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIText(
                      AppStrings.enterCodeSentTo,
                      style: AppTextStyles.body
                          .copyWith(fontSize: 14, color: AppColors.placeholder),
                    ),
                    UIText(_signupCubit.phoneNumber,
                        style: AppTextStyles.heading.copyWith(fontSize: 14)),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      _signupCubit.editPhoneNumer(context);
                    },
                    icon: Icon(
                      Icons.mode_edit_outline_outlined,
                    )),
              ],
            ),
            VSpace.large(),
            OtpTextField(
              controller: _otpController,
              onChanged: (value) {
                if (value.length == 6) {
                  // TODO: Handle OTP verification
                }
              },
            ),
            VSpace.small(),
            VSpace.xlarge(),
            UIButton(
              onPressed: () {},
              child: const UIText(AppStrings.continueText),
            ),
            VSpace.large(),
            _otpTimer(_signupCubit),
          ],
        ),
      ),
    );
  }

  Widget _otpTimer(SignupCubit _signupCubit) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        int secondsRemaining = 0;
        bool isResending = false;

        if (state is OTPTimerTick) {
          secondsRemaining = state.secondsRemaining;
          isResending = state.isResending;
        }

        String formattedTime =
            '00:${secondsRemaining.toString().padLeft(2, '0')}';

        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            UIText(
              AppStrings.didntReceiveCode,
              style: AppTextStyles.body
                  .copyWith(fontSize: 14, color: AppColors.label),
            ),
            if (isResending)
              UIText(
                ' ${AppStrings.resendIn} $formattedTime',
                style: AppTextStyles.body.copyWith(fontSize: 14),
              )
            else
              TextButton(
                onPressed: () {
                  _signupCubit.resendCode();
                },
                child: UIText(
                  AppStrings.resendIn,
                  style: AppTextStyles.body.copyWith(
                    fontSize: 14,
                    color: AppColors.primaryPurple,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
