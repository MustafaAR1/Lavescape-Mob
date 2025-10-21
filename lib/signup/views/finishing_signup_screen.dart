import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavescape_mob/app/constants/app_strings.dart';
import 'package:lavescape_mob/app/constants/app_text_styles.dart';
import 'package:lavescape_mob/app/widgets/app_paddings.dart';
import 'package:lavescape_mob/app/widgets/app_spacing_widgets.dart';
import 'package:lavescape_mob/signup/cubit/signup_cubit.dart';
import 'package:lavescape_mob/signup/cubit/signup_state.dart';
import 'package:lavescape_mob/widgets/ui_button.dart';
import 'package:lavescape_mob/widgets/ui_scaffold.dart';
import 'package:lavescape_mob/widgets/ui_text.dart';
import 'package:lavescape_mob/widgets/ui_textfield.dart';
import 'package:lavescape_mob/utils/app_validators.dart';

class FinishingSignupScreen extends StatefulWidget {
  const FinishingSignupScreen({super.key});

  @override
  State<FinishingSignupScreen> createState() => _FinishingSignupScreenState();
}

class _FinishingSignupScreenState extends State<FinishingSignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _legalNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _legalNameController.dispose();
    _dobController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _signupCubit = BlocProvider.of<SignupCubit>(context);

    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          // TODO: Navigate to home screen or show success message
          print('Signup Successful!');
        } else if (state is SignupFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        bool isPasswordVisible = false;
        bool isLoading = false;

        if (state is SignupFinishing) {
          isPasswordVisible = state.isPasswordVisible;
          isLoading = state.isLoading;
        } else if (state is SignupSuccess || state is SignupFailure) {
          isLoading = state.isLoading;
        }

        return UiScaffold(
          title: AppStrings.finishingSignup,
          body: AppPadding.xlarge(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  spacing: 15,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // VSpace.medium(),
                    UITextField(
                      controller: _legalNameController,
                      hintText: AppStrings.hintEnterYourName,
                      labelText: AppStrings.legalName,
                      validator: (value) => AppValidators.validateLegalName(value),
                    ),
                    UITextField(
                      controller: _dobController,
                      hintText: AppStrings.hintEnterYourDOB,
                      labelText: AppStrings.dateOfBirth,
                      readOnly: true,
                      validator: (value) => AppValidators.validateEmpty(value, AppStrings.dateOfBirth),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (pickedDate != null) {
                            _dobController.text = pickedDate
                                .toIso8601String()
                                .split('T')[0]; // Format date
                          }
                        },
                      ),
                    ),
                    UITextField(
                      controller: _emailController,
                      hintText: AppStrings.hintExampleEmail,
                      labelText: AppStrings.email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => AppValidators.validateEmail(value),
                    ),
                    BlocBuilder<SignupCubit, SignupState>(
                      buildWhen: (previous, current) =>
                          previous is SignupFinishing &&
                          current is SignupFinishing &&
                          previous.isPasswordVisible != current.isPasswordVisible,
                      builder: (context, state) {
                        bool isPasswordVisible = false;
                        if (state is SignupFinishing) {
                          isPasswordVisible = state.isPasswordVisible;
                        }
                        return UITextField(
                          controller: _passwordController,
                          hintText: AppStrings.hintPassword,
                          labelText: AppStrings.createPassword,
                          obscureText: !isPasswordVisible,
                          validator: (value) => AppValidators.validateEmpty(value, AppStrings.createPassword),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              _signupCubit.togglePasswordVisibility();
                            },
                          ),
                        );
                      },
                    ),
                    VSpace.xlarge(),
                    UIButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                _signupCubit.finishSignup(
                                  _legalNameController.text,
                                  _dobController.text,
                                  _emailController.text,
                                  _passwordController.text,
                                );
                              }
                            },
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const UIText(AppStrings.agreeAndContinue),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
