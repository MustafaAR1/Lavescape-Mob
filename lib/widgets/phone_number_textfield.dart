import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:lavescape_mob/app/constants/app_constants.dart';
import 'package:lavescape_mob/app/constants/app_spacing.dart';
import 'package:lavescape_mob/app/constants/app_text_styles.dart';
import 'package:lavescape_mob/app/constants/app_colors.dart';
import 'package:lavescape_mob/app/widgets/app_spacing_widgets.dart';
import 'package:lavescape_mob/widgets/ui_text.dart';
import 'package:lavescape_mob/widgets/ui_textfield.dart';

class PhoneNumberTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  const PhoneNumberTextField({
    super.key,
    this.controller,
    this.hintText,
    this.onChanged,
    this.validator,
  });

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  String _selectedCountryCode = '+1'; // Default to US country code

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UIText(
          AppStrings.phoneNumber,
          style: AppTextStyles.label,
        ),
        VSpace.small(),
        Container(
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: AppColors.inputBackground,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1,
                color: AppColors.inputBorder,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            shadows: const [
              BoxShadow(
                color: AppColors.inputShadow,
                blurRadius: 2,
                offset: Offset(0, 1),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            children: [
              CountryCodePicker(
                onChanged: (countryCode) {
                  setState(() {
                    _selectedCountryCode = countryCode.dialCode ?? '+1';
                  });
                },
                initialSelection: 'US',
                favorite: const ['+1', 'US'],
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                alignLeft: false,
                showFlagMain: true, // Only show the flag
                showDropDownButton: false, // Hide the dropdown arrow
                dialogTextStyle: AppTextStyles.placeholder,
                searchStyle: AppTextStyles.placeholder,
                padding:
                    EdgeInsets.zero, // Remove padding to help with alignment
              ),
              Container(
                width: 1,
                height: 40,
                decoration: const BoxDecoration(
                  color: AppColors.inputBorder,
                ),
              ),
              Expanded(
                child: UITextField(
                  controller: widget.controller,
                  keyboardType: TextInputType.phone,
                  onChanged: widget.onChanged,
                  hintText: '(000) 000-0000',
                  validator: widget.validator,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
