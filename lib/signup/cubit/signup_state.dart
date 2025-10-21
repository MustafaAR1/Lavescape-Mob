import 'package:equatable/equatable.dart';

abstract class SignupState extends Equatable {
  final bool isLoading;
  const SignupState({this.isLoading = false});

  @override
  List<Object> get props => [isLoading];
}

class SendOTPInitial extends SignupState {
  const SendOTPInitial({super.isLoading});
}

class SignupPhoneInput extends SignupState {
  const SignupPhoneInput({super.isLoading});
}

class SignupPhoneVerification extends SignupState {
  final String phoneNumber;

  const SignupPhoneVerification(this.phoneNumber, {super.isLoading});

  @override
  List<Object> get props => [phoneNumber, isLoading];
}

class SignupEmailInput extends SignupState {
  const SignupEmailInput({super.isLoading});
}

class SignupEmailVerification extends SignupState {
  final String email;

  const SignupEmailVerification(this.email, {super.isLoading});

  @override
  List<Object> get props => [email, isLoading];
}

class SignupFinishing extends SignupState {
  const SignupFinishing({super.isLoading});
}

class SendOTPSuccess extends SignupState {
  const SendOTPSuccess({super.isLoading});
}

class SendOTPFailure extends SignupState {
  final String error;

  const SendOTPFailure(this.error, {super.isLoading});

  @override
  List<Object> get props => [error, isLoading];
}

class OTPTimerTick extends SignupState {
  final int secondsRemaining;
  final bool isResending;

  const OTPTimerTick({
    required this.secondsRemaining,
    required this.isResending,
    super.isLoading,
  });

  @override
  List<Object> get props => [secondsRemaining, isResending, isLoading];
}
