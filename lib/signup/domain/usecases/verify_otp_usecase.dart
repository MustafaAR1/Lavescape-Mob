import 'package:lavescape_mob/data/models/otp_verification_response_model.dart';
import 'package:lavescape_mob/domain/repositories/auth_repository.dart';

class VerifyOtpUseCase {
  final AuthRepository repository;

  VerifyOtpUseCase(this.repository);

  Future<OtpVerificationResponseModel> call(String phoneNumber, String otp) async {
    return await repository.verifyOtp(phoneNumber, otp);
  }
}