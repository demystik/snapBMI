// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

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

class Chat {
  String name;
  String image;
  String message;
  String time;
  String statusImage;
  Chat({
    required this.name,
    required this.image,
    required this.message,
    required this.time,
    required this.statusImage,
  });
}

List<Chat> chats = [
  Chat(
    name: "Babe 💝",
    image:
        "https://png.pngtree.com/png-vector/20240528/ourmid/pngtree-a-woman-with-blonde-hair-and-blue-blazer-is-posing-for-png-image_12502841.png",
    message: "Have you gotten home?",
    time: "10:21 pm",
    statusImage: "https://wallpapercave.com/wp/1ZLpfHy.jpg"
  ),
  Chat(
    name: "Aisha NYC",
    image:
        "https://www.photopacks.ai/static/personas/examples/headshots_2.jpeg",
    message: "Don’t forget the meeting tomorrow",
    time: "9:10 pm",
    statusImage: "https://wallpapercave.com/wp/cD5gD6f.jpg"
  ),
  Chat(
    name: "David Coder",
    image:
        "https://www.photopacks.ai/static/personas/examples/headshots_1.jpeg",
    message: "Voice call",
    time: "8:45 pm",
    statusImage: ""
  ),
  Chat(
    name: "Fatima Flight 💪🏻",
    image:
        "https://www.photopacks.ai/static/personas/examples/headshots_3.jpeg",
    message: "I’m on my way",
    time: "8:30 pm",
    statusImage: ""
  ),
  Chat(
    name: "John 🌞",
    image:
        "https://www.photopacks.ai/static/personas/examples/headshots_4.jpeg",
    message: "Nice work on the project",
    time: "7:50 pm",
    statusImage: ""
  ),
  Chat(
    name: "Grace Hotline",
    image:
        "https://www.photopacks.ai/static/personas/examples/headshots_5.jpeg",
    message: "Can we talk later?",
    time: "7:10 pm",
    statusImage: ""
  ),
  Chat(
    name: "Ibrahim 😎",
    image:
        "https://www.photopacks.ai/static/personas/examples/headshots_6.jpeg",
    message: "I’ll send it tonight",
    time: "6:45 pm",
  ),
  Chat(
    name: "Blessing",
    image:
        "https://www.photopacks.ai/static/personas/examples/headshots_7.jpeg",
    message: "Thanks for your help!",
    time: "6:10 pm",
    statusImage: ""
  ),
  Chat(
    name: "Samuel DVM",
    image:
        "https://www.photopacks.ai/static/personas/examples/headshots_8.jpeg",
    message: "Are you coming to church?",
    time: "5:55 pm",
    statusImage: ""
  ),
  Chat(
    name: "Zainab",
    image:
        "https://www.photopacks.ai/static/personas/examples/headshots_9.jpeg",
    message: "Let’s meet at 4pm",
    time: "5:20 pm",
    statusImage: ""
  ),
  Chat(
    name: "Michael",
    image:
        "https://www.photopacks.ai/static/personas/examples/headshots_10.jpeg",
    message: "Check your email",
    time: "4:50 pm",
    statusImage: ""
  ),
  Chat(
    name: "Hauwa",
    image:
        "https://www.photopacks.ai/static/personas/examples/headshots_11.jpeg",
    message: "I’m busy right now",
    time: "4:15 pm",
    statusImage: ""
  ),
  Chat(
    name: "Phone guy",
    image:
        "https://www.photopacks.ai/static/personas/examples/headshots_12.jpeg",
    message: "Let’s build it together",
    time: "3:40 pm",
    statusImage: ""
  ),
  Chat(
    name: "Amaka Project",
    image:
        "https://www.photopacks.ai/static/personas/examples/headshots_13.jpeg",
    message: "Call me when free",
    time: "2:30 pm",
    statusImage: ""
  ),
  Chat(
    name: "Olamide 🌙",
    image:
        "https://m.media-amazon.com/images/I/71XzBOUJmEL._CR0%2C0%2C1061%2C1061_._US500_SCLZZZZZZZ_.jpg",
    message: "Done with the task",
    time: "1:15 pm",
    statusImage: ""
  ),
];
