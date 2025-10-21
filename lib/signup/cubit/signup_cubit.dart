import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lavescape_mob/app/routes/app_routes.dart';
import 'package:lavescape_mob/signup/domain/usecases/send_otp_usecase.dart';
import 'package:lavescape_mob/signup/domain/usecases/verify_otp_usecase.dart';
import 'package:lavescape_mob/signup/data/models/otp_response_model.dart';

import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SendOtpUseCase sendOtpUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;

  SignupCubit(this.sendOtpUseCase, this.verifyOtpUseCase)
      : super(const SendOTPInitial());

  String _phoneNumber = "";
  Timer? _timer;
  int _secondsRemaining = 60;
  int _resendAttempts = 0;
  bool _isResending = false;

  void setPhoneNumber(String phoneNo) {
    _phoneNumber = phoneNo;
  }

  Future<void> sendOTP(BuildContext context) async {
    emit(const SendOTPInitial(isLoading: true));
    try {
      final OtpResponseModel otpResponse =
          await sendOtpUseCase.call(_phoneNumber);
      print('Received OTP: ${otpResponse.otp}'); // For testing purposes
      emit(const SendOTPSuccess(isLoading: false));
      startResendTimer();
    } catch (e) {
      emit(SendOTPFailure(e.toString(), isLoading: false));
    }
  }

  Future<void> verifyOtp(String otp, BuildContext context) async {
    emit(OTPTimerTick(
        secondsRemaining: _secondsRemaining,
        isResending: _isResending,
        isLoading: true));
    try {
      final verificationResponse =
          await verifyOtpUseCase.call(_phoneNumber, otp);
      if (verificationResponse.success) {
        emit(const VerifyOtpSuccess(isLoading: false));
      } else {
        emit(VerifyOtpFailure(
            verificationResponse.message ?? 'OTP verification failed',
            isLoading: false));
      }
    } catch (e) {
      emit(VerifyOtpFailure(e.toString(), isLoading: false));
    }
  }

  void routeToOTPScreen(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.VERIFY_PHONE);
  }

  void routetoEditPhoneNumer(BuildContext context) {
    Navigator.pop(context);
  }

  void routeToFinishingSignup(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.FINISHING_SIGNUP);
    emit(const SignupFinishing());
  }

  void togglePasswordVisibility() {
    if (state is SignupFinishing) {
      final currentFinishingState = state as SignupFinishing;
      emit(currentFinishingState.copyWith(
          isPasswordVisible: !currentFinishingState.isPasswordVisible));
    }
  }

  void finishSignup(
    String legalName,
    String dob,
    String email,
    String password,
  ) {
    // TODO: Implement actual signup logic here
    print('Finishing Signup with:');
    print('Legal Name: $legalName');
    print('DOB: $dob');
    print('Email: $email');
    print('Password: $password');
    // emit(const SignupSuccess());
  }

  String get phoneNumber => _phoneNumber;

  Stream<int> get timerStream =>
      Stream.periodic(const Duration(seconds: 1), (x) {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
          emit(OTPTimerTick(
              secondsRemaining: _secondsRemaining,
              isResending: _isResending,
              isLoading: false));
        }
        return _secondsRemaining;
      }).takeWhile((seconds) => seconds >= 0);

  void startResendTimer() {
    _secondsRemaining = 60;
    _isResending = true;
    emit(OTPTimerTick(
        secondsRemaining: _secondsRemaining,
        isResending: _isResending,
        isLoading: false));
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        _timer?.cancel();
        _isResending = false;
        emit(OTPTimerTick(
            secondsRemaining: _secondsRemaining,
            isResending: _isResending,
            isLoading: false));
      } else {
        _secondsRemaining--;
        emit(OTPTimerTick(
            secondsRemaining: _secondsRemaining,
            isResending: _isResending,
            isLoading: false));
      }
    });
  }

  Future<void> resendCode() async {
    _resendAttempts++;
    emit(OTPTimerTick(
        secondsRemaining: _secondsRemaining,
        isResending: _isResending,
        isLoading: true));
    try {
      final OtpResponseModel otpResponse =
          await sendOtpUseCase.call(_phoneNumber);
      print('Resent OTP: ${otpResponse.otp}'); // For testing purposes
      emit(OTPTimerTick(
          secondsRemaining: _secondsRemaining,
          isResending: _isResending,
          isLoading: false));
      startResendTimer();
    } catch (e) {
      emit(SendOTPFailure(e.toString(), isLoading: false));
    }
  }

  void resetResendTimer() {
    _timer?.cancel();
    _secondsRemaining = 0;
    _isResending = false;
    emit(OTPTimerTick(
        secondsRemaining: _secondsRemaining,
        isResending: _isResending,
        isLoading: false));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
