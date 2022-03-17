class AppException implements Exception {
  String message;

  AppException({required this.message}) {
    if (message == null || message.isEmpty) {
      message = "Unknown Exception Occurred";
    }
  }

  @override
  String toString() => message;
}