import 'package:flutter/material.dart';
import 'package:snapbmi/whatsapp_home_screen.dart';

class WhatsappBottomNavbar extends StatefulWidget {
  const WhatsappBottomNavbar({super.key});

  @override
  State<WhatsappBottomNavbar> createState() => _WhatsappBottomNavbarState();
}

class _WhatsappBottomNavbarState extends State<WhatsappBottomNavbar> {
    int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    void navigatorBottomBar(int index){
      setState(() {
        selectedIndex = index;
      });
    }
    final List<Widget> _pages = [
      WhatsappHomeScreen(),
      const Scaffold(),
      const Scaffold(),
      const Scaffold(),
    ];
    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: navigatorBottomBar,
        items: navBars),
    );
  }
}

List<BottomNavigationBarItem> navBars = [
  BottomNavigationBarItem(icon: Icon(Icons.message_outlined), activeIcon: Icon(Icons.message_rounded), label: "Chats"),
  BottomNavigationBarItem(icon: Icon(Icons.radio_button_checked_rounded), activeIcon: Icon(Icons.radio_button_unchecked), label: "Updates"),
  BottomNavigationBarItem(icon: Icon(Icons.groups_2_outlined), activeIcon: Icon(Icons.groups_2), label: "Communities"),
  BottomNavigationBarItem(icon: Icon(Icons.call_outlined), activeIcon: Icon(Icons.call), label: "Calls"),
];