import 'package:flutter/material.dart';
import 'package:lavescape_mob/app/routes/app_routes.dart';
import 'package:lavescape_mob/signup/views/continue_with_email_screen.dart';
import 'package:lavescape_mob/signup/views/continue_with_mobile_screen.dart';
import 'package:lavescape_mob/signup/views/finishing_signup_screen.dart';
import 'package:lavescape_mob/signup/views/guest_profile_created_screen.dart';
import 'package:lavescape_mob/signup/views/verify_email_screen.dart';
import 'package:lavescape_mob/signup/views/verify_phone_screen.dart';

class AppPages {
  static const INITIAL = Routes.CONTINUE_WITH_MOBILE;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.CONTINUE_WITH_MOBILE:
        return MaterialPageRoute(builder: (_) => ContinueWithMobileScreen());
      case Routes.VERIFY_PHONE:
        return MaterialPageRoute(builder: (_) => VerifyPhoneScreen());
      case Routes.CONTINUE_WITH_EMAIL:
        return MaterialPageRoute(builder: (_) => ContinueWithEmailScreen());
      case Routes.VERIFY_EMAIL:
        return MaterialPageRoute(builder: (_) => VerifyEmailScreen());
      case Routes.FINISHING_SIGNUP:
        return MaterialPageRoute(builder: (_) => FinishingSignupScreen());
      case Routes.GUEST_PROFILE_CREATED:
        return MaterialPageRoute(builder: (_) => GuestProfileCreatedScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Text('Error: ${settings.name} not found'));
    }
  }
}
