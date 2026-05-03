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
              itemCount: groupList.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return updateUpperSection();
                }
                Groups groups = groupList[index - 1];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 12,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      foregroundImage: AssetImage(groups.groupImage),
                    ),
                    title: Text(
                      groups.groupName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      groups.lastMessage,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: [2, 4, 5].contains(index)
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(groups.lastChatTime),
                              Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                                child: Text(
                                  '3',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        : Text(groups.lastChatTime),
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
            children: List.generate(8, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 170,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          opacity: 0.8,
                          fit: BoxFit.cover,
                          image: AssetImage(chats[index].statusImage),
                        ),
                      ),
                    ),

                    Positioned(
                      top: 5,
                      left: 5,
                      child: Container(
                        height: 70,
                        width: 70,
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.green),
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.black12,
                            //     offset: Offset(0, 5),
                            //     spreadRadius: 15,
                            //     blurRadius: 8
                            //   ),
                            // ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(chats[index].image),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(
                          chats[index].name,
                          textAlign: TextAlign.left,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.1,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
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
