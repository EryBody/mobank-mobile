import 'package:dio/dio.dart';

String extractIsoCode(String input) {
  RegExp regex = RegExp(r'^[A-Z]{2,3}'); // Matches 2-3 uppercase letters at the start
  Match? match = regex.firstMatch(input);
  return match?.group(0) ?? ''; // Return match or empty string if not found
}


Future<String> fetchAndFixSvg(String url) async {
  try {
    Response response = await Dio().get(url);
    if (response.statusCode == 200) {
      String svgContent = response.data.toString();
      // Replace -50% with 0 dynamically
      svgContent = svgContent.replaceAll('-50%', '0');
      return svgContent;
    } else {
      throw Exception("Failed to load SVG, status code: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Error fetching SVG: $e");
  }
}