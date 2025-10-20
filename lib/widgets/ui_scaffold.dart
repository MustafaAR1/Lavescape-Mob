import 'package:flutter/material.dart';
import 'package:lavescape_mob/app/constants/app_colors.dart';

class UiScaffold extends StatelessWidget {
  final Widget body;
  final String? title;
  final Color? backgroundColor;

  const UiScaffold(
      {super.key,
      required this.body,
      this.title,
      this.backgroundColor = AppColors.background});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: title != null
          ? AppBar(
              title: Text(title!),
            )
          : null,
      body: body,
    );
  }
}
