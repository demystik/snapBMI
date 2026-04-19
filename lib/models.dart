import 'package:flutter/material.dart';

class BMICategory {
  final String category;
  final String range;
  final Color? color;

  BMICategory({
    required this.category,
    required this.range,
    required this.color,
  });
}

List<BMICategory> categories = [
  BMICategory(
    category: "Very severely underweight",
    range: "<16",
    color: Colors.blue,
  ),
  BMICategory(
    category: "Severely underweight",
    range: "16.0-16.9",
    color: Colors.blue[400],
  ),
  BMICategory(
    category: "Underweight",
    range: "17.0-18.4",
    color: Colors.blue[200],
  ),
  BMICategory(category: "Normal", range: "18.5-24.9", color: Colors.green),
  BMICategory(category: "overweight", range: "25.0-29.9", color: Colors.amber),
  BMICategory(
    category: "Obese class I",
    range: "30.0-34.9",
    color: Colors.orange,
  ),
  BMICategory(
    category: "Obese class II",
    range: "35.9-39.9",
    color: Colors.red.shade400,
  ),
  BMICategory(category: "Obese class III", range: ">39.9", color: Colors.red),
];
