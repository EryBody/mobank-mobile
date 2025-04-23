import 'package:flutter/material.dart';

/// Generic safe parsing function for any class with a `fromJson` method
T? safeParse<T>(dynamic json, T Function(Map<String, dynamic>) fromJson) {
  try {
    if (json is Map<String, dynamic>) {
      return fromJson(json);
    } else {
      debugPrint("Invalid JSON format for ${T.toString()}: $json");
      return null;
    }
  } catch (e) {
    debugPrint("Error parsing ${T.toString()}: $e");
    return null;
  }
}
