import 'package:bloc/bloc.dart';

import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  void toPhoneInput() => emit(SignupPhoneInput());

  void submitPhoneNumber(String phoneNumber) {
    // Here you would typically make an API call to send a verification code
    emit(SignupPhoneVerification(phoneNumber));
  }

  void submitPhoneVerificationCode(String code) {
    // Here you would verify the code
    emit(SignupEmailInput());
  }

  void submitEmail(String email) {
    // Here you would typically make an API call to send a verification code
    emit(SignupEmailVerification(email));
  }

  void submitEmailVerificationCode(String code) {
    // Here you would verify the code
    emit(SignupFinishing());
  }

  void finishSignup(String username) {
    // Here you would create the user profile
    emit(SignupSuccess());
  }
}
