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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Communities",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Icon(Icons.more_vert, size: 30),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.groups_2,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: Colors.white),
                        ),
                        child: Icon(Icons.add, size: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Text(
                  "New community",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                customeListTile(
                  "GPUC: Global Programmers Union Community",
                  "assets/images/img1.jpeg",
                  false,
                  true,
                  false,
                ),
                Divider(),
                customeListTile(
                  "Announcements",
                  "assets/images/img1.jpeg",
                  true,
                  false,
                  false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Row customeListTile(
  String groupName,
  String imagePath,
  bool announce,
  bool comm,
  bool normalGroup,
) {
  return Row(
    children: [
      Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: normalGroup ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: announce ? Colors.greenAccent : Colors.blue,
          image: comm
              ? DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover)
              : DecorationImage(image: AssetImage("")),
        ),
        child: announce ? Icon(Icons.campaign_rounded, size: 35) : SizedBox(),
      ),
      SizedBox(width: 8),
      announce ? Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
          Text(
            groupName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 18),
          ),
          Text(
            "+234 983 829 2323: but some of the annoucements made in the name of",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 18),
          ),
        
        ],),
      )
       :Expanded(
        child: Text(
          groupName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 18),
        ),
      ),
      announce
          ? Column(
            crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("01/03/2024"),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                  child: Text("Archived"),
                ),
              ],
            )
          : SizedBox(),
    ],
  );
}
