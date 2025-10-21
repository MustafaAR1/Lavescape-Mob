class OtpVerificationResponseModel {
  final bool success;
  final String? message;

  OtpVerificationResponseModel({
    required this.success,
    this.message,
  });

  factory OtpVerificationResponseModel.fromJson(Map<String, dynamic> json) {
    return OtpVerificationResponseModel(
      success: json['success'] as bool,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
    };
  }
}