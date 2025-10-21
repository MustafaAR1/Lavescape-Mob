import 'package:flutter/material.dart';
import 'package:lavescape_mob/app/constants/app_colors.dart';
import 'package:lavescape_mob/app/constants/app_constants.dart';
import 'package:lavescape_mob/widgets/ui_text.dart';

class UiScaffold extends StatelessWidget {
  final Widget body;
  final String? title;
  final Color? backgroundColor;
  final bool resizeToAvoidBottomOverFlow;

  const UiScaffold(
      {super.key,
      required this.body,
      this.title,
      this.backgroundColor = AppColors.background,
      this.resizeToAvoidBottomOverFlow = true});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomOverFlow,
        appBar: title != null
            ? AppBar(
                backgroundColor: backgroundColor,
                elevation: 2,
                titleTextStyle: AppTextStyles.heading,
                centerTitle: true,
                toolbarHeight: 70,
                title: UIText(title!),
              )
            : null,
        body: body,
      ),
    );
  }
}
