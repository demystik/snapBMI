import 'package:flutter/material.dart';
import 'package:snapbmi/utils/app_colors.dart';
import 'package:snapbmi/utils/apptext.dart';
class TextFieldContainer extends StatelessWidget {
  final bool elevated;
  final TextEditingController textController;
  final TextInputType typeOfKeyboard;
  const TextFieldContainer({
    super.key,
    required this.elevated,
    required this.textController,
    required this.typeOfKeyboard,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: elevated == true ? [
          BoxShadow(
            color: const Color.fromARGB(223, 140, 159, 198),
            blurRadius: 8,
            offset: Offset(0, 7),
            spreadRadius: 0,
          ),
        ] : [
          BoxShadow(
            color: Color.fromARGB(0, 154, 221, 240),
            blurRadius: 0,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextField(
        controller: textController,
        style: Apptext.bodyMedium,
        keyboardType: typeOfKeyboard,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.blueFadeGradient,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}