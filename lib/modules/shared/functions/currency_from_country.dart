String getCountryFromIso(String isoCountry) {
  String currency = "";
  if (isoCountry.contains("CA")) {
    currency = "CAD";
  } else if (isoCountry.contains("GB")) {
    currency = "GBP";
  } else if (isoCountry.contains("IE")) {
    currency = "EUR";
  } else if (isoCountry.contains("NG")) {
    currency = "NGN";
  } else if (isoCountry.contains("GH") || isoCountry.contains("GHA")) {
    currency = "GHS";
  }
  return currency;
}

String convertIsoToCountryName(String isoCountry) {
  String currency = "";
  if (isoCountry.contains("CA")) {
    currency = "Canada";
  } else if (isoCountry.contains("GB")) {
    currency = "United Kingdom";
  } else if (isoCountry.contains("IE")) {
    currency = "Ireland";
  } else if (isoCountry.contains("NG")) {
    currency = "Nigeria";
  } else if (isoCountry.contains("GH") || isoCountry.contains("GHA")) {
    currency = "Ghana";
  }
  return currency;
}

