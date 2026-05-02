// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:snapbmi/whatsapp_chat_model.dart';

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

          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return updateUpperSection();
                }
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.green,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Column updateUpperSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: AlwaysScrollableScrollPhysics(),
          child: Row(
            children: List.generate(6, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 100,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(chats[index].statusImage),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Channels",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  "Explore",
                  style: TextStyle(fontSize: 18, letterSpacing: 1.1),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
