import 'package:equatable/equatable.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class SignupPhoneInput extends SignupState {}

class SignupPhoneVerification extends SignupState {
  final String phoneNumber;

  const SignupPhoneVerification(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class SignupEmailInput extends SignupState {}

class SignupEmailVerification extends SignupState {
  final String email;

  const SignupEmailVerification(this.email);

  @override
  List<Object> get props => [email];
}

class SignupFinishing extends SignupState {}

class SignupSuccess extends SignupState {}

class SignupFailure extends SignupState {
  final String error;

  const SignupFailure(this.error);

  @override
  List<Object> get props => [error];
}
