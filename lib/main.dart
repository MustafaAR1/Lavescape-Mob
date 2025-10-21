import 'package:flutter/material.dart';
import 'package:lavescape_mob/app/constants/app_strings.dart';
import 'package:lavescape_mob/app/routes/app_pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavescape_mob/signup/cubit/signup_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<SignupCubit>(
          create: (BuildContext context) => SignupCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.flutterDemo,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppPages.INITIAL,
      onGenerateRoute: AppPages.onGenerateRoute,
    );
  }
}
