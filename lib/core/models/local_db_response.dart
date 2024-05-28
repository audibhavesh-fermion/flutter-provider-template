import 'package:flutter_provider_template/core/loader/load_modules.dart';

class LocalDBResponse {
  ResponseType? type;
  String? message;
  dynamic payload;

  LocalDBResponse({this.type, this.message, this.payload});

  bool isError() {
    return type == ResponseType.error || type == ResponseType.failed;
  }

  bool isSuccess() {
    return type == ResponseType.success;
  }
}
