import 'package:lavescape_mob/signup/data/datasources/fake_auth_api.dart';
import 'package:lavescape_mob/signup/data/models/otp_response_model.dart';
import 'package:lavescape_mob/signup/data/models/otp_verification_response_model.dart';
import 'package:lavescape_mob/signup/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FakeAuthApi fakeAuthApi;

  AuthRepositoryImpl(this.fakeAuthApi);

  @override
  Future<OtpResponseModel> sendOtp(String phoneNumber) async {
    final response = await fakeAuthApi.sendOtp(phoneNumber);
    final otpResponse = OtpResponseModel.fromJson(response);
    if (!otpResponse.success) {
      throw Exception(otpResponse.message ?? 'Failed to send OTP');
    }
    return otpResponse;
  }

  @override
  Future<OtpVerificationResponseModel> verifyOtp(
      String phoneNumber, String otp) async {
    final response = await fakeAuthApi.verifyOtp(phoneNumber, otp);
    final otpVerificationResponse =
        OtpVerificationResponseModel.fromJson(response);
    if (!otpVerificationResponse.success) {
      throw Exception(
          otpVerificationResponse.message ?? 'Failed to verify OTP');
    }
    return otpVerificationResponse;
  }
}
