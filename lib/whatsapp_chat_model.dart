
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
    statusImage: "assets/images/s1.jpeg"
  ),
  Chat(
    name: "Aisha NYC",
    image:
        "https://www.photopacks.ai/static/personas/examples/headshots_2.jpeg",
    message: "Don’t forget the meeting tomorrow",
    time: "9:10 pm",
    statusImage: "assets/images/s2.jpg"
  ),
  Chat(
    name: "David Coder",
    image:
        "https://www.photopacks.ai/static/personas/examples/headshots_1.jpeg",
    message: "Voice call",
    time: "8:45 pm",
    statusImage: "assets/images/s3.jpg"
  ),
  Chat(
    name: "Fatima Flight 💪🏻",
    image:
        "https://www.photopacks.ai/static/personas/examples/headshots_3.jpeg",
    message: "I’m on my way",
    time: "8:30 pm",
    statusImage: "assets/images/s4.jpg"
  ),
  Chat(
    name: "John 🌞",
    image:
        "https://www.photopacks.ai/static/personas/examples/headshots_4.jpeg",
    message: "Nice work on the project",
    time: "7:50 pm",
    statusImage: "assets/images/s5.jpg"
  ),
  Chat(
    name: "Grace Hotline",
    image:
        "https://www.photopacks.ai/static/personas/examples/headshots_5.jpeg",
    message: "Can we talk later?",
    time: "7:10 pm",
    statusImage: "assets/images/s6.jpg"
  ),
  Chat(
    name: "Ibrahim 😎",
    image:
        "https://www.photopacks.ai/static/personas/examples/headshots_6.jpeg",
    message: "I’ll send it tonight",
    time: "6:45 pm",
    statusImage: "assets/images/screen1.jpg"
  ),
  Chat(
    name: "Blessing",
    image:
        "https://www.photopacks.ai/static/personas/examples/headshots_7.jpeg",
    message: "Thanks for your help!",
    time: "6:10 pm",
    statusImage: "assets/images/screen2.png"
  ),
  Chat(
    name: "Samuel DVM",
    image:
        "https://www.photopacks.ai/static/personas/examples/headshots_8.jpeg",
    message: "Are you coming to church?",
    time: "5:55 pm",
    statusImage: "assets/images/screen4.png"
  ),
  Chat(
    name: "Zainab",
    image:
        "https://www.photopacks.ai/static/personas/examples/headshots_9.jpeg",
    message: "Let’s meet at 4pm",
    time: "5:20 pm",
    statusImage: "assets/images/screem3.png"
  ),
  Chat(
    name: "Michael",
    image:
        "https://www.photopacks.ai/static/personas/examples/headshots_10.jpeg",
    message: "Check your email",
    time: "4:50 pm",
    statusImage: "assets/images/screen4.png"
  ),
  Chat(
    name: "Hauwa",
    image:
        "https://www.photopacks.ai/static/personas/examples/headshots_11.jpeg",
    message: "I’m busy right now",
    time: "4:15 pm",
    statusImage: "assets/images/screen5.jpg"
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


class Groups {
  String groupName;
  String lastChatTime;
  String lastMessage;
  String groupImage;
  Groups({
    required this.groupName,
    required this.lastChatTime,
    required this.lastMessage,
    required this.groupImage,
  });
}

List<Groups> groupList = [
  Groups(
    groupName: "Flutter Devs",
    lastChatTime: "10:30 AM",
    lastMessage: "Check the new widget update",
    groupImage: "assets/images/img1.jpeg",
  ),
  Groups(
    groupName: "NYSC Batch C1",
    lastChatTime: "9:15 AM",
    lastMessage: "CDS tomorrow by 8am",
    groupImage: "assets/images/img2.jpeg",
  ),
  Groups(
    groupName: "Family",
    lastChatTime: "Yesterday",
    lastMessage: "Dinner is ready",
    groupImage: "assets/images/img3.jpeg",
  ),
  Groups(
    groupName: "UI/UX Designers",
    lastChatTime: "Monday",
    lastMessage: "New Figma file uploaded but did you guys checked the last one?",
    groupImage: "assets/images/img4.jepg",
  ),
  Groups(
    groupName: "Github Bounties ++",
    lastChatTime: "01/05/2026",
    lastMessage: "Github repositories to enhance your Python proficiency",
    groupImage: "assets/images/img5.jpg",
  ),
  Groups(
    groupName: "Zero Trust Hackers & CyberSecurities",
    lastChatTime: "01/05/2026",
    lastMessage: "Anthropic's cybersecurity AI was reportedly breached on launch day",
    groupImage: "assets/images/img6.png",
  ),
  Groups(
    groupName: "Programming and AI Recources",
    lastChatTime: "28/04/2026",
    lastMessage: "Today, let's understand another programming concept of Greedy Algorithm with others",
    groupImage: "assets/images/img2.jpeg",
  ),
];