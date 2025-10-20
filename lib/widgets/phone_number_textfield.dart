import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:lavescape_mob/app/constants/app_colors.dart';
import 'package:lavescape_mob/app/constants/app_spacing.dart';
import 'package:lavescape_mob/app/constants/app_text_styles.dart';

class PhoneNumberTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final ValueChanged<String>? onChanged;

  const PhoneNumberTextField({
    super.key,
    this.controller,
    this.hintText,
    this.onChanged,
  });

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  String _selectedCountryCode = '+1'; // Default to US country code

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Color(0xFFE5E7EB),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0C000000),
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
            showDropDownButton: true, // Hide the dropdown arrow
            dialogTextStyle: AppTextStyles.countryCode,
            searchStyle: AppTextStyles.placeholder,
            padding: EdgeInsets.zero, // Remove padding to help with alignment
          ),
          Container(
            width: 1,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.background,
            ),
          ),
          Expanded(
            child: TextField(
              controller: widget.controller,
              keyboardType: TextInputType.phone,
              onChanged: widget.onChanged,
              style: AppTextStyles.placeholder,
              decoration: InputDecoration(
                hintText: '(000) 000-0000',
                hintStyle: AppTextStyles.placeholder,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.medium, vertical: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
