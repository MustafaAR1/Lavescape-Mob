class OtpResponseModel {
  final bool success;
  final String? otp;
  final String? message;

  OtpResponseModel({
    required this.success,
    this.otp,
    this.message,
  });

  factory OtpResponseModel.fromJson(Map<String, dynamic> json) {
    return OtpResponseModel(
      success: json['success'] as bool,
      otp: json['otp'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'otp': otp,
      'message': message,
    };
  }
}