import 'package:flutter/material.dart';

class Testpage extends StatelessWidget {
  const Testpage({super.key});

  @override
  Widget build(BuildContext context) {
    String? selectedValue;
    final List<String> items = ["male", "female"];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            DropdownButton(
              value: selectedValue,
              hint: Text("Select Gender"),
              items: items.map((String item){
                return DropdownMenuItem(
                  value: item,
                  child: Text(item));
              }).toList(),

              onChanged: (String? newValue) {
                // setState((){selectedValue = newValue});
              }
              ),
          ],
        ),
      ),
    );
  }
}
