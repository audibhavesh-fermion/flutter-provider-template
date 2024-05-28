import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_provider_template/core/exceptions/api_exceptions.dart';
import 'package:flutter_provider_template/core/network/client/api_client_options.dart';
import 'package:flutter_provider_template/core/network/constants/network_constants.dart';
import 'package:flutter_provider_template/core/network/constants/token_handler.dart';

class ApiClient {
  ApiClient._provideInstance();

  static final ApiClient _instance = ApiClient._provideInstance();

  factory ApiClient() {
    return _instance;
  }

  var dio = Dio(ApiClientOptions())
    ..interceptors.add(AwesomeDioInterceptor(
        logRequestTimeout: false,
        logRequestHeaders: false,
        logResponseHeaders: false,
        logger: debugPrint));

  String _combineBaseUrl(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }
    final url = Uri.parse(baseUrl);
    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }

  Future<dynamic> postWithoutAuthToken(
      Map<dynamic, dynamic> request, String path,
      {String newBaseUrl = ""}) async {
    var url = path;
    if (newBaseUrl.isNotEmpty) {
      url = _combineBaseUrl(NetworkConstants.baseUrl, newBaseUrl);
    }

    try {
      var response = await dio.post(url, data: request);
      return checkAndReturnResponse(response);
    } on DioException catch (e) {
      throw ApiException(
          message: e.response?.statusMessage,
          statusCode: e.response?.statusCode,
          extra: e.response?.extra);
    } catch (e, stacktrace) {
      rethrow;
    }
  }

  Future<Response> post(Map<dynamic, dynamic> request, String path,
      {String newBaseUrl = ""}) async {
    var url = path;
    if (newBaseUrl.isNotEmpty) {
      url = _combineBaseUrl(NetworkConstants.baseUrl, newBaseUrl);
    }

    try {
      var response = await dio.post(url,
          data: request,
          options: Options(headers: {
            "Authorization": "Bearer ${TokenHandler.accessToken}"
          }));
      return checkAndReturnResponse(response);
    } on DioException catch (e) {
      throw ApiException(
          message: e.response?.statusMessage,
          statusCode: e.response?.statusCode,
          extra: e.response?.extra);
    } catch (e, stacktrace) {
      rethrow;
    }
  }

  Future<Response> postMultipart(FormData formData, String path,
      {String newBaseUrl = ""}) async {
    var url = path;
    if (newBaseUrl.isNotEmpty) {
      url = _combineBaseUrl(NetworkConstants.baseUrl, newBaseUrl);
    }

    try {
      var response = await dio.post(url,
          data: formData,
          options: Options(headers: {
            "Authorization": "Bearer ${TokenHandler.accessToken}"
          }));
      return checkAndReturnResponse(response);
    } on DioException catch (e) {
      throw ApiException(
          message: e.response?.statusMessage,
          statusCode: e.response?.statusCode,
          extra: e.response?.extra);
    } catch (e, stacktrace) {
      rethrow;
    }
  }

  checkAndReturnResponse(Response<dynamic> response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    } else {
      throw ApiException(
          message: response.statusMessage,
          statusCode: response.statusCode,
          extra: response);
    }
  }
}
