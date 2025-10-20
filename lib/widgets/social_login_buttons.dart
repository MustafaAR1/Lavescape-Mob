import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        _SocialButton(
          iconAsset: 'assets/svg/facebook.svg',
        ),
        SizedBox(width: 16),
        _SocialButton(
          iconAsset: 'assets/svg/google.svg',
        ),
        SizedBox(width: 16),
        _SocialButton(
          iconAsset: 'assets/svg/apple.svg',
        ),
        SizedBox(width: 16),
        _SocialButton(
          iconAsset: 'assets/svg/mail.svg',
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String iconAsset;
  final VoidCallback? onTap;

  const _SocialButton({
    required this.iconAsset,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap ?? () {},
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Center(
          child: SvgPicture.asset(
            iconAsset,
            height: 28,
            width: 28,
          ),
        ),
      ),
    );
  }
}