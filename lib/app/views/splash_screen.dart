import 'package:flutter/material.dart';
import 'package:lavescape_mob/app/constants/app_assets.dart';
import 'package:lavescape_mob/app/routes/app_routes.dart';
import 'package:lavescape_mob/widgets/svg_icon.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();
    _navigateToNextScreen();
  }

  _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3)); // Simulate loading time
    if (mounted) {
      Navigator.of(context).pushReplacementNamed(Routes.CONTINUE_WITH_MOBILE);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: const UISvgIcon(
            AppAssets.appLogo,
            height: 100,
            width: 100,
          ),
        ),
      ),
    );
  }
}
