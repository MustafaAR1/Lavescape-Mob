import 'package:lavescape_mob/signup/data/models/otp_response_model.dart';
import 'package:lavescape_mob/signup/data/models/otp_verification_response_model.dart';

abstract class AuthRepository {
  Future<OtpResponseModel> sendOtp(String phoneNumber);
  Future<OtpVerificationResponseModel> verifyOtp(
      String phoneNumber, String otp);
}
