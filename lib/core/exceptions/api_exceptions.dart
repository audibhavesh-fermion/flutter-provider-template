class ApiException implements Exception {
  String? message = "";
  int? statusCode = 0;
  dynamic extra;

  ApiException({this.message, this.statusCode, this.extra});
}
 