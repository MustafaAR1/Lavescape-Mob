import 'package:flutter/material.dart';
import 'package:lavescape_mob/app/constants/app_colors.dart';
import 'package:lavescape_mob/app/constants/app_spacing.dart';
import 'package:lavescape_mob/app/constants/app_text_styles.dart';
import 'package:lavescape_mob/app/widgets/app_spacing_widgets.dart';
import 'package:lavescape_mob/widgets/ui_text.dart';

class UITextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final bool readOnly;
  final Widget? suffixIcon;

  const UITextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.onChanged,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.readOnly = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          UIText(
            labelText!,
            style: AppTextStyles.body.copyWith(color: AppColors.heading),
          ),
        if (labelText != null) VSpace.xxsmall(),
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
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            onChanged: onChanged,
            obscureText: obscureText,
            style: AppTextStyles.placeholder,
            validator: validator,
            readOnly: readOnly,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppTextStyles.placeholder,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.medium, vertical: 10),
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
