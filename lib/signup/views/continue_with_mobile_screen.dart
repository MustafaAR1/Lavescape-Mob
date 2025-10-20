import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavescape_mob/app/constants/app_assets.dart';
import 'package:lavescape_mob/app/constants/app_spacing.dart';
import 'package:lavescape_mob/app/constants/app_text_styles.dart';
import 'package:lavescape_mob/signup/cubit/signup_cubit.dart';
import 'package:lavescape_mob/widgets/svg_icon.dart';
import 'package:lavescape_mob/widgets/ui_scaffold.dart';

class ContinueWithMobileScreen extends StatelessWidget {
  const ContinueWithMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: UiScaffold(
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppSpacing.large,
                    UISvgIcon(AppAssets.appLogo),
                    Container(
                      width: double.infinity,
                      padding:
                          const EdgeInsets.only(bottom: AppSpacing.xxsmall),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'Phone Number',
                              style: AppTextStyles.label,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors
                            .white /* Basic-Forms-Input-Background-Bg-Color */,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color: const Color(
                                0xFFE5E7EB) /* Basic-Forms-Input-Border-Border-Color */,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x0C000000),
                            blurRadius: 2,
                            offset: Offset(0, 1),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.medium, vertical: 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 18,
                                  height: 18,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(999),
                                    ),
                                  ),
                                  child: Stack(),
                                ),
                                const SizedBox(width: AppSpacing.small),
                                Text(
                                  'US',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.countryCode,
                                ),
                                const SizedBox(width: AppSpacing.small),
                                Container(
                                  width: 14,
                                  height: 14,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Stack(),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(
                                  0xFFE5E7EB) /* Basic-Forms-Input-Divider-Color */,
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: AppSpacing.medium,
                                        vertical: 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 235,
                                          child: Text(
                                            '+1 (000) 000-0000',
                                            style: AppTextStyles.placeholder,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
