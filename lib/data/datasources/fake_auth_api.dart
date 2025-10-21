class FakeAuthApi {
  Future<Map<String, dynamic>> sendOtp(String phoneNumber) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));
    // In a real app, this would call a backend API
    print('Sending OTP to $phoneNumber');
    return {
      'success': true,
      'otp': '123456',
      'message': 'OTP sent successfully',
    };
  }
}