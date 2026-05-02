import 'package:flutter/material.dart';

class WhatsappCommunities extends StatefulWidget {
  const WhatsappCommunities({super.key});

  @override
  State<WhatsappCommunities> createState() => _WhatsappCommunitiesState();
}

class _WhatsappCommunitiesState extends State<WhatsappCommunities> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          width: 300,
          height: 500,
          decoration: BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
              image: NetworkImage(
                "https://i.pravatar.cc/150?img=1"
              ),
            ),
          ),
        ),
      ),
    );
  }
}
