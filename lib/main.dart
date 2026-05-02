import 'package:flutter/material.dart';
import 'package:snapbmi/whatsapp_bottom_navbar.dart';
// import 'package:snapbmi/homepage.dart';
// import 'package:snapbmi/whatsapp_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: const Homepage(),
      home: const WhatsappBottomNavbar()
    );
  }
}

