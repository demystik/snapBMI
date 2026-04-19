import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:snapbmi/bmi_calculator.dart';
import 'package:snapbmi/utils/app_colors.dart';
import 'package:snapbmi/utils/apptext.dart';
import 'package:snapbmi/models.dart';

class Resultpage extends StatefulWidget {
  final String age;
  final String height;
  final String weight;
  final String heightMetric;
  final String weightMetric;
  const Resultpage({
    super.key,
    required this.age,
    required this.height,
    required this.weight,
    required this.heightMetric,
    required this.weightMetric,
  });

  @override
  State<Resultpage> createState() => _ResultpageState();
}

class _ResultpageState extends State<Resultpage> {
  late double result;
  late double percent;

  @override
  void initState() {
    super.initState();

    final (double res, double per) = bmiCalculator(
      widget.weight,
      widget.height,
      widget.weightMetric,
      widget.heightMetric,
    );
    result = res;
    percent = per;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenSize.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentGeometry.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.5],
              colors: [Colors.green, Colors.blueGrey],
            ),
          ),
          child: Column(
            children: [
              //Upper content
              //------------------------------------------------------------------
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                size: 30,
                              ),
                            ),
                            Icon(Icons.notifications_none_rounded, size: 30),
                          ],
                        ),
                        Text("Your BMI result", style: Apptext.displayMedium),
                      ],
                    ),
                  ),
                ),
              ),
          
              //White Container--------------------------------------------------------------------
              //White Container--------------------------------------------------------------------
              Expanded(
                flex: 7,
                child: Container(
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(48),
                      topRight: Radius.circular(48),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              // circular percentage-----------------------------------------------------
                              GetCircularPercentIndicator(
                                percent: percent,
                                result: result,
                              ),
                              // Your have BMI-----------------------------------------------------------
                              // Your have BMI-----------------------------------------------------------
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  getBmiMessage(result),
                                  textAlign: TextAlign.center,
                                  style: Apptext.bodyLarge.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            
                              //Age, Weight, Height banner---------------------------------------------------------------
                              Container(
                                height: screenSize.height * 0.08,
                                decoration: BoxDecoration(
                                  color: AppColors.blueFadeGradient,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ageWeightHeightRowContent("Age", widget.age),
                                    Container(
                                      width: 1,
                                      height: 35,
                                      color: Colors.black,
                                    ),
                                    ageWeightHeightRowContent(
                                      "Weight",
                                      "${widget.weight} ${widget.weightMetric}",
                                    ),
                                    Container(
                                      width: 1,
                                      height: 35,
                                      color: Colors.black,
                                    ),
                                    ageWeightHeightRowContent(
                                      "Height",
                                      "${widget.height} ${widget.heightMetric}",
                                    ),
                                  ],
                                ),
                              ),
                              // List of BMI Values---------------------------------------------------------
                              SizedBox(height: screenSize.height * 0.02),
                              Column(
                                // spacing: 10,
                                children: categories.map((item) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 6,
                                      horizontal: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isTheOne(result, item.range)
                                          ? Colors.black12
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          spacing: 15,
                                          children: [
                                            Container(
                                              width: 15,
                                              height: 15,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: item.color,
                                              ),
                                            ),
                                            Text(
                                              item.category,
                                              style: Apptext.bodySmall,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          item.range,
                                          style: Apptext.bodySmall,
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Divider(color: Colors.black),
                              ),
                              
                              //Normal Weight-------------------------------------------------------------------
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Normal weight",
                                    style: Apptext.bodySmall,
                                  ),
                                  Text("50.4-67.8", style: Apptext.bodySmall),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column ageWeightHeightRowContent(String property, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(property, textAlign: TextAlign.center, style: Apptext.bodySmall),
        Text(value, textAlign: TextAlign.center, style: Apptext.bodyMedium),
      ],
    );
  }

  bool isTheOne(double bmiresult, String range) {
    if (range.contains('<')) {
      return bmiresult < 16;
    } else if (range.contains('>')) {
      return bmiresult > 39.9;
    } else {
      // Handle range like "18.5-24.9"
      final parts = range.split('-');
      final min = double.parse(parts[0]);
      final max = double.parse(parts[1]);
      return bmiresult >= min && bmiresult <= max;
    }
  }
}

class GetCircularPercentIndicator extends StatelessWidget {
  const GetCircularPercentIndicator({
    super.key,
    required this.percent,
    required this.result,
  });

  final double percent;
  final double result;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 60.0,
      lineWidth: 13.0,
      animation: true,
      percent: percent,
      center: Text(
        "$result",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Colors.purple,
    );
  }
}

String getBmiMessage(double bmi) {
  if (bmi < 16) {
    return "You have Very Severely Underweight body";
  } else if (bmi < 17) {
    return "You have Severely Underweight body";
  } else if (bmi < 18.5) {
    return "You have Underweight body";
  } else if (bmi < 25) {
    return "You have Normal body weight";
  } else if (bmi < 30) {
    return "You have Overweight body";
  } else if (bmi < 35) {
    return "You have Obese Class I body";
  } else if (bmi < 40) {
    return "You have Obese Class II body";
  } else {
    return "You have Obese Class III body";
  }
}
