import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../main.dart';
import '../../modules/auth/login/infrastructure/secure_storage/auth_secure_storage.dart';
import '../constants/api_constants.dart';

class DioInterceptor extends Interceptor {
  final Dio dio = Dio();
  final AuthSecureStorage _secureStorage = AuthSecureStorage();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {

    String? token = await _secureStorage.getToken();
    debugPrint("===>>> Retrieved Token: $token");
    options.headers["Content-Type"] = ApiConstants.contentType;

    options.headers["Content-Type"] = ApiConstants.contentType;
    if (!options.path.contains("/idp/api/v1/auth/")) {
      if (token != null) {
        options.headers["Authorization"] = "Bearer $token";
      }
    } else {
      options.headers.remove("Authorization");
    }

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Check if the user is unauthorized
    if (err.response?.statusCode == 401) {
      // Clear secure storage and navigate to the login screen
      await _secureStorage.clear();

      // Optionally, notify the user
      debugPrint("Session expired. Logging out...");

      // Use a mechanism to redirect the user to the login screen
      // Ensure you're in a Flutter context
      navigatorKey.currentState?.pushNamedAndRemoveUntil(
        '/login',
            (route) => false,
      );

      // Pass a modified error response
      return handler.resolve( Response(
        requestOptions: err.requestOptions,
        statusCode: 401,
        data: {'error': 'Your session has expired. Please log in again.'},
      ));
    }

    debugPrint("===>>> Error: ${err.response?.data} Error Code: ${err.response?.statusCode}");
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200) {
      if(!response.data.toString().contains("110005")){
        debugPrint("===>>> Interceptor Response: ${response.data}");
      }
    }
    return super.onResponse(response, handler);
  }
}