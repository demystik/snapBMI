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
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: AlwaysScrollableScrollPhysics(),
              
              child: Column(
                children: [
                  
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
                          "assets/images/img3.jpeg",
                          false,
                          true,
                        ),
                        Divider(),
                        SizedBox(height: 6,),
                        customeListTile(
                          "Announcements",
                          "assets/images/img1.jpeg",
                          true,
                          false,
                        ),
                        normalGroupTile(
                          "Global World Programming Community",
                          "assets/images/img2.jpeg",
                        ),
                        normalGroupTile(
                          "Golang Programmers and Job hunting",
                          "assets/images/img4.jpeg",
                        ),
                        normalGroupTile(
                          "Mobile Dev in Uk/USA",
                          "assets/images/img6.png",
                        ),
                        customeListTile(
                          "Rev Code",
                          "assets/images/img2.jpeg",
                          false,
                          true,
                        ),
                        SizedBox(height: 8,),
                        Divider(height: 5,),
                        SizedBox(height: 8,),
                        customeListTile(
                          "Announcements",
                          "assets/images/img1.jpeg",
                          true,
                          false,
                        ),
                        normalGroupTile(
                          "African Community",
                          "assets/images/img4.jpeg",
                        ),
                        normalGroupTile(
                          "Tech Updates",
                          "assets/images/img5.jpg",
                        ),
                        normalGroupTile(
                          "Coding Challenges",
                          "assets/images/img6.png",
                        ),
                        normalGroupTile(
                          "Hackathon annoucements and update",
                          "assets/images/man.png",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


Padding normalGroupTile(String groupName, String imagePath){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0),
    child: ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
          leading: CircleAvatar(radius: 27, foregroundImage: AssetImage(imagePath),),
          title: Text(groupName, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18), maxLines: 1, overflow: TextOverflow.ellipsis,),
          subtitle: Text("Lorem ipsum the man for the job is the last person i know since the day", maxLines: 1, overflow: TextOverflow.ellipsis,),
          trailing: Text("3:55 pm"),
        ),
  );
}


Row customeListTile(
  String groupName,
  String imagePath,
  bool announce,
  bool comm,
) {
  return Row(
    children: [
      Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
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
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
