import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core /constants/api_constants.dart';
import '../../../../../core /error/error_handler.dart';
import '../../../../../core /network/dio_interceptor.dart';
import '../models/signup_request.dart';
import '../models/signup_response.dart';

class SignupService{
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );

  SignupService() {
    _dio.interceptors.add(DioInterceptor());
  }

  static const registerEndpoint = "${ApiConstants.baseUrl}/idp/auth/register";

  Future<SignupResponse> signup(SignupRequest req) async {
    try {

      final Response response = await _dio.post(
        registerEndpoint,
        data: req,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data != null && response.data.isNotEmpty) {
          return SignupResponse.fromJson(response.data);
        } else {
          throw const FormatException("Empty response data");
        }
      } else {
        throw ErrorHandler.handleHttpResponseError(
            response.statusCode, response);
      }
    } on FormatException catch (e) {
      debugPrint("===>>> Response: ${e.message.toString()}");
      throw ErrorHandler.handleHttpResponseError(400, e.message.toString());
    } on DioException catch (e) {
      debugPrint(
          "===>> Status code: ${e.response?.statusCode.toString()} - Response: ${e.response}");

      throw ErrorHandler.handleHttpResponseError(
          e.response?.statusCode, e.response);
    }
  }

}
