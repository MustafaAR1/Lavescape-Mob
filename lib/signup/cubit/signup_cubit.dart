import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lavescape_mob/app/routes/app_routes.dart';

import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  String _phoneNumber = "";
  Timer? _timer;
  int _secondsRemaining = 60;
  int _resendAttempts = 0;
  bool _isResending = false;

  void setPhoneNumber(String phoneNo) {
    _phoneNumber = phoneNo;
  }

  void routeToOTPScreen(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.VERIFY_PHONE);
    startResendTimer();
  }

  void editPhoneNumer(BuildContext context) {
    Navigator.pop(context);
  }

  String get phoneNumber => _phoneNumber;

  Stream<int> get timerStream =>
      Stream.periodic(const Duration(seconds: 1), (x) {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
          emit(SignupTimerTick(
              secondsRemaining: _secondsRemaining, isResending: _isResending));
        }
        return _secondsRemaining;
      }).takeWhile((seconds) => seconds >= 0);

  void startResendTimer() {
    _secondsRemaining = 60;
    _isResending = true;
    emit(SignupTimerTick(
        secondsRemaining: _secondsRemaining, isResending: _isResending));
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        _timer?.cancel();
        _isResending = false;
        emit(SignupTimerTick(
            secondsRemaining: _secondsRemaining, isResending: _isResending));
      } else {
        _secondsRemaining--;
        emit(SignupTimerTick(
            secondsRemaining: _secondsRemaining, isResending: _isResending));
      }
    });
  }

  void resendCode() {
    _resendAttempts++;
    startResendTimer();
  }

  void resetResendTimer() {
    _timer?.cancel();
    _secondsRemaining = 0;
    _isResending = false;
    emit(SignupTimerTick(
        secondsRemaining: _secondsRemaining, isResending: _isResending));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
