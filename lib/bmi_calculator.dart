
(double, double) bmiCalculator(
  String weight,
  String height,
  String weightMetric,
  String heightMetric,
) {
  //   BMI Formula:

  // BMI = weight (in kg) ÷ (height in meters)²

  // Example:
  // - If you weigh 70 kg and your height is 1.75 meters:
  // - Height² = 1.75 × 1.75 = 3.0625
  // - BMI = 70 ÷ 3.0625 ≈ 22.86
  double parsedWeight = double.parse(weight);
  double parsedHeight = double.parse(height);
  double actualWeight = 0;
  double actualHeight = 0;

  switch (weightMetric) {
    case "kg": actualWeight = parsedWeight;
    break;
    case "g": actualWeight = parsedWeight / 1000;
    break;
    default:
  }

  switch (heightMetric) {
    case "m": actualHeight = parsedHeight;
      break;
    case "cm" : actualHeight = parsedHeight / 100;      
      break;
    case "in" : actualHeight = parsedHeight * 0.0254;
    default:
  }
  double bmiResult =  actualWeight / (actualHeight * actualHeight);
  //Just incase it goes overboard
  if (bmiResult > 42.0) bmiResult = 42;
  
  double bmiPercentage = (bmiResult / 42);

  String bmiResultInString = bmiResult.toStringAsFixed(1);
  bmiResult = double.parse(bmiResultInString);

return (bmiResult, bmiPercentage);
}
