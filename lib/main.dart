import 'package:flutter/material.dart';
import 'package:lavescape_mob/app/constants/app_strings.dart';
import 'package:lavescape_mob/app/routes/app_pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavescape_mob/signup/cubit/signup_cubit.dart';
import 'package:lavescape_mob/data/datasources/fake_auth_api.dart';
import 'package:lavescape_mob/data/repositories/auth_repository_impl.dart';
import 'package:lavescape_mob/domain/usecases/send_otp_usecase.dart';

void main() {
  // Initialize dependencies
  final fakeAuthApi = FakeAuthApi();
  final authRepository = AuthRepositoryImpl(fakeAuthApi);
  final sendOtpUseCase = SendOtpUseCase(authRepository);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<SignupCubit>(
          create: (BuildContext context) => SignupCubit(sendOtpUseCase),
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
