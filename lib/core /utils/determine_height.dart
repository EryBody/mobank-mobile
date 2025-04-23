double determineHeight(double deviceHeight) {
  if (deviceHeight < 600) {
    // Extra Small Devices (Phones)
    return deviceHeight * 0.4; // 40% of the device height
  } else if (deviceHeight >= 600 && deviceHeight < 700) {
    // Small Devices
    return deviceHeight * 0.45; // 45% of the device height
  } else if (deviceHeight >= 700 && deviceHeight < 800) {
    // Medium Devices
    return deviceHeight * 0.5; // 50% of the device height
  } else if (deviceHeight >= 800 && deviceHeight < 900) {
    // Large Devices
    return deviceHeight * 0.55; // 55% of the device height
  } else {
    // Extra Large Devices (Tablets, Large Phones)
    return deviceHeight * 0.6; // 60% of the device height
  }
}
