import 'package:lavescape_mob/data/models/otp_response_model.dart';
import 'package:lavescape_mob/domain/repositories/auth_repository.dart';

class SendOtpUseCase {
  final AuthRepository repository;

  SendOtpUseCase(this.repository);

  Future<OtpResponseModel> call(String phoneNumber) async {
    return await repository.sendOtp(phoneNumber);
  }
}