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
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            chatScreenHeader(),
            chatScreenSearchTextfield(),

            Expanded(
              child: ListView(
                children: [
                  chatScreenCategoryRow(),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: chats.length,
                    itemBuilder: (context, index) {
                      return chatListTile(index);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding chatListTile(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          foregroundImage: NetworkImage("chats[index].image"),
        ),
        title: Text(chats[index].name),
        subtitle: Row(
          children: index % 3 == 0 ? 
          [Icon(Icons.done_all_rounded, size: 20,), SizedBox(width: 5,),  Expanded(child: Text(chats[index].message, maxLines: 1, overflow: TextOverflow.ellipsis,))] 
          : [Icon(Icons.check_rounded, size: 20,), SizedBox(width: 5,), Expanded(child: Text(chats[index].message, maxLines: 1, overflow: TextOverflow.ellipsis,)),],
        ),
        trailing: Text(chats[index].time),
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
  Chat({
    required this.name,
    required this.image,
    required this.message,
    required this.time,
  });
}

List<Chat> chats = [
  Chat(
    name: "Babe 💝",
    image:
        "https://png.pngtree.com/png-vector/20240528/ourmid/pngtree-a-woman-with-blonde-hair-and-blue-blazer-is-posing-for-png-image_12502841.png",
    message: "Have you gotten home?",
    time: "10:21 pm",
  ),
  Chat(
    name: "Aisha NYC",
    image: "https://www.photopacks.ai/static/personas/examples/headshots_1.jpeg",
    message: "Don’t forget the meeting tomorrow",
    time: "9:10 pm",
  ),
  Chat(
    name: "David Coder",
    image: "https://randomuser.me/api/portraits/men/12.jpg",
    message: "Voice call",
    time: "8:45 pm",
  ),
  Chat(
    name: "Fatima Flight 💪🏻",
    image: "https://randomuser.me/api/portraits/women/68.jpg",
    message: "I’m on my way",
    time: "8:30 pm",
  ),
  Chat(
    name: "John 🌞",
    image: "https://randomuser.me/api/portraits/men/22.jpg",
    message: "Nice work on the project",
    time: "7:50 pm",
  ),
  Chat(
    name: "Grace Hotline",
    image: "https://randomuser.me/api/portraits/women/21.jpg",
    message: "Can we talk later?",
    time: "7:10 pm",
  ),
  Chat(
    name: "Ibrahim 😎",
    image: "https://randomuser.me/api/portraits/men/55.jpg",
    message: "I’ll send it tonight",
    time: "6:45 pm",
  ),
  Chat(
    name: "Blessing",
    image: "https://randomuser.me/api/portraits/women/33.jpg",
    message: "Thanks for your help!",
    time: "6:10 pm",
  ),
  Chat(
    name: "Samuel DVM",
    image: "https://randomuser.me/api/portraits/men/41.jpg",
    message: "Are you coming to church?",
    time: "5:55 pm",
  ),
  Chat(
    name: "Zainab",
    image: "https://randomuser.me/api/portraits/women/12.jpg",
    message: "Let’s meet at 4pm",
    time: "5:20 pm",
  ),
  Chat(
    name: "Michael",
    image: "https://randomuser.me/api/portraits/men/36.jpg",
    message: "Check your email",
    time: "4:50 pm",
  ),
  Chat(
    name: "Hauwa",
    image: "https://randomuser.me/api/portraits/women/50.jpg",
    message: "I’m busy right now",
    time: "4:15 pm",
  ),
  Chat(
    name: "Phone guy",
    image: "https://randomuser.me/api/portraits/men/18.jpg",
    message: "Let’s build it together",
    time: "3:40 pm",
  ),
  Chat(
    name: "Amaka Project",
    image: "https://randomuser.me/api/portraits/women/60.jpg",
    message: "Call me when free",
    time: "2:30 pm",
  ),
  Chat(
    name: "Olamide 🌙",
    image: "https://randomuser.me/api/portraits/men/28.jpg",
    message: "Done with the task",
    time: "1:15 pm",
  ),
];
