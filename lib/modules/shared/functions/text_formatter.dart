class TextFormatter{

  static String toSentenceCase(String input) {
    if (input.isEmpty) return input; // Handle empty strings
    input = input.toLowerCase(); // Convert the entire string to lowercase
    return input[0].toUpperCase() + input.substring(1); // Capitalize the first letter
  }

}