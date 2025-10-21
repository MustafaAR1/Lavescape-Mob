import 'package:lavescape_mob/data/models/otp_response_model.dart';

abstract class AuthRepository {
  Future<OtpResponseModel> sendOtp(String phoneNumber);
}