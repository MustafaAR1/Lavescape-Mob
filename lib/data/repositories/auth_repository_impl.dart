import 'package:lavescape_mob/data/datasources/fake_auth_api.dart';
import 'package:lavescape_mob/data/models/otp_response_model.dart';
import 'package:lavescape_mob/domain/repositories/auth_repository.dart';

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
}