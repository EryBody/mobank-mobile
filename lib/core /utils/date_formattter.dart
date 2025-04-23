
import 'package:intl/intl.dart';

String formatDateTimeToGetTime(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  String formattedTime = DateFormat('h a').format(dateTime).toLowerCase();
  return formattedTime;
}

String formatDate(String isoDateString) {
  // Parse the ISO 8601 date string to a DateTime object
  DateTime dateTime = DateTime.parse(isoDateString);

  // Format the DateTime object to the desired format
  String formattedDate = "${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}";

  return formattedDate;
}

String getCurrentDateInIsoFormat() {
  // Get the current date and time in UTC
  DateTime now = DateTime.now().toUtc();

  // Format the date and time in ISO 8601 format
  String isoDateString = DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(now);

  return isoDateString;
}

String formatCurrentDateToDayAndMonth(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  // Format the date as "14 April"
  return DateFormat('d MMMM').format(dateTime);
}

String formatCurrentDateToDayAndMonthAndYear(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  // Format the date as "14 April"
  return DateFormat('d MMMM yyyy').format(dateTime);
}

String formatTimeFromIso(String isoDateString) {
  try {
    // Parse the ISO 8601 date string to a DateTime object
    DateTime dateTime = DateTime.parse(isoDateString);

    // Format the time to "h:mm a" (e.g., "8:32 PM")
    String formattedTime = DateFormat('h:mm a').format(dateTime);

    return formattedTime;
  } catch (e) {
    // Handle parsing errors if the input format is incorrect
    return 'Invalid date format';
  }

}

String getCurrentDateInIso8601() {
  DateTime now = DateTime.now().toUtc();
  String formattedDate = now.toIso8601String().split('.').first + "Z";
  return formattedDate;
}

String convertToIso8601(String timeString) {
  try {
    // Get the current date
    DateTime now = DateTime.now();

    // Parse the time string to a DateTime object
    DateTime parsedTime = DateFormat.jm().parse(timeString);

    // Create a DateTime object with the current date and parsed time
    DateTime dateTime = DateTime(
      now.year,
      now.month,
      now.day,
      parsedTime.hour,
      parsedTime.minute,
    ).toUtc();

    // Return the formatted ISO 8601 string
    return dateTime.toIso8601String();
  } catch (e) {
    print('Error parsing time string: $e');
    return '';
  }
}
