import 'package:flutter/material.dart';
import 'package:lavescape_mob/app/constants/app_colors.dart';

class UIButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final ButtonStyle? style;

  const UIButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style ??
            ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryPurple,
              foregroundColor: Colors.white, // Text color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Example border radius
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Example padding
            ),
        child: child,
      ),
    );
  }
}
