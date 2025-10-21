import 'package:flutter/material.dart';
import 'package:lavescape_mob/app/routes/app_routes.dart';
import 'package:lavescape_mob/signup/views/continue_with_email_screen.dart';
import 'package:lavescape_mob/signup/views/continue_with_mobile_screen.dart';
import 'package:lavescape_mob/signup/views/finishing_signup_screen.dart';
import 'package:lavescape_mob/signup/views/guest_profile_created_screen.dart';
import 'package:lavescape_mob/signup/views/verify_email_screen.dart';
import 'package:lavescape_mob/signup/views/verify_phone_screen.dart';
import 'package:lavescape_mob/app/views/splash_screen.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    WidgetBuilder builder;
    switch (settings.name) {
      case Routes.SPLASH:
        builder = (_) => SplashScreen();
        break;
      case Routes.CONTINUE_WITH_MOBILE:
        builder = (_) => ContinueWithMobileScreen();
        break;
      case Routes.VERIFY_PHONE:
        builder = (_) => VerifyPhoneScreen();
        break;
      case Routes.CONTINUE_WITH_EMAIL:
        builder = (_) => ContinueWithEmailScreen();
        break;
      case Routes.VERIFY_EMAIL:
        builder = (_) => VerifyEmailScreen();
        break;
      case Routes.FINISHING_SIGNUP:
        builder = (_) => FinishingSignupScreen();
        break;
      case Routes.GUEST_PROFILE_CREATED:
        builder = (_) => GuestProfileCreatedScreen();
        break;
      default:
        builder = (_) => Text('Error: ${settings.name} not found');
    }

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
