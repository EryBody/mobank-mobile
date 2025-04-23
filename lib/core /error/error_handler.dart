
import 'dart:convert';

import 'package:flutter/material.dart';

class ErrorHandler {

  static String handleHttpResponseError(int? statusCode, dynamic data) {
    try {
      debugPrint("===>>> Error Message: $data Status Code: $statusCode");

      // Check if data is null or if it's an empty string before parsing
      if (data == null || data.toString().isEmpty) {
        return "No data received from server.";
      }

      // Check if data is a valid JSON string
      Map<String, dynamic> jsonData;
      try {
        jsonData = jsonDecode(data.toString());
      } catch (e) {
        // If JSON decoding fails, treat the response as plain text
        return data.toString(); // This is the plain error message
      }

      // Extract error message from the decoded JSON
      dynamic errorMessage = jsonData['message'];

      if (errorMessage is List) {
        // If 'message' is a list, join the elements into a single string
        errorMessage = (errorMessage).map((e) => e.toString()).join("\n");
      } else if (errorMessage is String) {
        // If 'message' is a string, use it directly
        errorMessage = errorMessage;
      } else {
        // If 'message' is neither a string nor a list, default to a generic error
        errorMessage = "An unknown error occurred";
      }

      if (statusCode == 300) {
        //Multiple Choices:
        return '$errorMessage';
      } else if (statusCode == 301) {
        //Moved Permanently:
        return '$errorMessage';
      } else if (statusCode == 302) {
        //Found
        return '$errorMessage';
      } else if (statusCode == 400) {
        //Bad Request
        return '$errorMessage';
      } else if (statusCode == 401) {
        // Unauthorized
        String error = jsonData['error'] ?? "Unauthorized access";
        return error;
      } else if (statusCode == 403) {
        //Forbidden
        return '$errorMessage';
      } else if (statusCode == 404) {
        //Not Found
        return '$errorMessage';
      } else if (statusCode == 500) {
        //Internal Server Error:
        return '$errorMessage';
      }else if (statusCode == 409) {
        //Internal Server Error:
        return '$errorMessage';
      }
      else {
        //Received invalid status code:
        return '$statusCode';
      }
    } on FormatException catch (e) {
      debugPrint("===>>> Exception Handler Error: $e");
      return "Error: Invalid JSON format or server response is not in JSON format";
    } on Exception catch (e) {
      debugPrint("===>>> Exception Handler Error: $e");
      return "$e";
    }
  }
}
