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
  final bool isPasswordVisible;
  final String legalName;
  final String dob;
  final String email;
  final String password;

  const SignupFinishing({
    super.isLoading,
    this.isPasswordVisible = false,
    this.legalName = '',
    this.dob = '',
    this.email = '',
    this.password = '',
  });

  @override
  List<Object> get props => [isLoading, isPasswordVisible, legalName, dob, email, password];

  SignupFinishing copyWith({
    bool? isLoading,
    bool? isPasswordVisible,
    String? legalName,
    String? dob,
    String? email,
    String? password,
  }) {
    return SignupFinishing(
      isLoading: isLoading ?? this.isLoading,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      legalName: legalName ?? this.legalName,
      dob: dob ?? this.dob,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

class SignupSuccess extends SignupState {
  const SignupSuccess({super.isLoading});
}

class SignupFailure extends SignupState {
  final String error;

  const SignupFailure(this.error, {super.isLoading});

  @override
  List<Object> get props => [error, isLoading];
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

class VerifyOtpSuccess extends SignupState {
  const VerifyOtpSuccess({super.isLoading});
}

class VerifyOtpFailure extends SignupState {
  final String error;

  const VerifyOtpFailure(this.error, {super.isLoading});

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
