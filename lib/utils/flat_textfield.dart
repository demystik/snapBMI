import 'package:flutter/material.dart';
import 'package:snapbmi/utils/apptext.dart';

class FlatTextfield extends StatelessWidget {
  const FlatTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
        style: Apptext.bodyMedium,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.blueGrey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      );
  }
}