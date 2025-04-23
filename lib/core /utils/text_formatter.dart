String getInitials(String fullName) {
  if (fullName.trim().isEmpty) {
    return ''; // Handle empty or whitespace-only names
  }

  // Split by spaces and remove any extra empty parts
  List<String> nameParts = fullName.trim().split(RegExp(r'\s+'));

  if (nameParts.length >= 2) {
    // Ensure both parts have at least one character
    return nameParts[0].isNotEmpty && nameParts[1].isNotEmpty
        ? nameParts[0][0].toUpperCase() + nameParts[1][0].toUpperCase()
        : '';
  } else if (nameParts.length == 1 && nameParts[0].isNotEmpty) {
    return nameParts[0][0].toUpperCase();
  }

  return '';
}

String getSecondWord(String? fullName) {
  if (fullName == null || fullName.trim().isEmpty) {
    return ''; // Return empty string for null or empty input
  }

  // Split the string by any whitespace
  List<String> nameParts = fullName.trim().split(RegExp(r'\s+'));

  // Check if the second word exists
  return nameParts.length > 1 ? nameParts[1] : '';
}
