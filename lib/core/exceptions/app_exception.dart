class AppException implements Exception {
  String? error;
  String? message = "";
  dynamic extra;

  AppException(this.error, this.message, this.extra);
}
