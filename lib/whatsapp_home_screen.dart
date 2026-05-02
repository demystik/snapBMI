// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:snapbmi/whatsapp_chat_model.dart';

class WhatsappHomeScreen extends StatefulWidget {
  const WhatsappHomeScreen({super.key});

  @override
  State<WhatsappHomeScreen> createState() => _WhatsappHomeScreenState();
}

class _WhatsappHomeScreenState extends State<WhatsappHomeScreen> {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            chatScreenHeader(),
            chatScreenSearchTextfield(),

            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: chats.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return chatScreenCategoryRow();
                  }
                  return selectedCategory == 1
                      ? unreadChatListTile(index - 1)
                      : chatListTile(index - 1);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding unreadChatListTile(int index) {
    List<int> unread = [3, 5, 7, 4];
    if (unread.contains(index)) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            foregroundImage: NetworkImage(chats[index].image),
          ),
          title: Text(chats[index].name),
          subtitle: Row(
            children: [
              Expanded(
                child: Text(
                  chats[index].message,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(chats[index].time),
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
                child: Text('3', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      );
    } else {
      return Padding(padding: EdgeInsets.all(0));
    }
  }

  Padding chatListTile(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          foregroundImage: NetworkImage(chats[index].image),
        ),
        title: Text(chats[index].name),
        subtitle: Row(
          children: [0, 1, 2, 4, 6, 8, 9, 10, 11, 12, 13].contains(index)
              ? [0, 2, 4, 6, 8, 12].contains(index)
                    ? [
                        Icon(
                          Icons.done_all_rounded,
                          size: 20,
                          color: Colors.purple,
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            chats[index].message,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ]
                    : [
                        Icon(Icons.done_all_rounded, size: 20),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            chats[index].message,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ]
              : [
                  // Icon(Icons.check_rounded, size: 20),
                  // SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      chats[index].message,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
        ),
        trailing: [3, 5, 7, 14].contains(index)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(chats[index].time),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    child: Text('3', style: TextStyle(color: Colors.white)),
                  ),
                ],
              )
            : Text(chats[index].time),
      ),
    );
  }

  SingleChildScrollView chatScreenCategoryRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(left: 15),
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: selectedCategory == index
                    ? Colors.green.shade100
                    : Colors.transparent,
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Text(categories[index]),
            ),
          );
        }),
      ),
    );
  }

  Row chatScreenHeader() {
    return Row(
      children: [
        Expanded(
          child: Text(
            "WhatsApp",
            style: TextStyle(
              color: Colors.green,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Icon(Icons.camera_alt_outlined, size: 30),
        SizedBox(width: 10),
        Icon(Icons.more_vert, size: 30),
      ],
    );
  }

  Padding chatScreenSearchTextfield() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: TextField(
        keyboardType: TextInputType.name,
        enabled: true,

        decoration: InputDecoration(
          labelText: "Ask Meta AI or Search",
          prefixIcon: Icon(Icons.search_rounded),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

// MODEL ______________________________________________________________________________
List<String> categories = ["All", "Unread 4", "Favourite 3", "Groups 4", "+"];

