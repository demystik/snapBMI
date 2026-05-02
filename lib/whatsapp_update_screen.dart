// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WhatsappUpdateScreen extends StatefulWidget {
  const WhatsappUpdateScreen({super.key});

  @override
  State<WhatsappUpdateScreen> createState() => _WhatsappUpdateScreenState();
}

class _WhatsappUpdateScreenState extends State<WhatsappUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
                //Header--------------------------------------
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
          
                Expanded(
                  child: Text(
                    "Updates",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Icon(Icons.search_rounded, size: 30),
                SizedBox(width: 10),
                Icon(Icons.more_vert, size: 30),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
                  "Status",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
          ),
        ],
      ),
    );
  }
}


