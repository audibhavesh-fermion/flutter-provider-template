import 'package:dio/dio.dart';
import 'package:flutter_provider_template/core/network/constants/network_constants.dart';

class ApiClientOptions extends BaseOptions {
  ApiClientOptions() {
    super.copyWith(
        baseUrl: NetworkConstants.baseUrl,
        connectTimeout: NetworkConstants.CONNECTION_TIMEOUT,
        receiveTimeout: NetworkConstants.READ_TIMEOUT,
        sendTimeout: NetworkConstants.WRITE_TIMEOUT);
  }
}
