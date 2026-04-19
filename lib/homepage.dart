import 'package:flutter/material.dart';
import 'package:snapbmi/utils/apptext.dart';
import 'package:snapbmi/detailspage.dart';
import 'package:snapbmi/utils/textfield_container.dart';
import 'package:snapbmi/utils/app_colors.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    String userName;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: screenSize.width,
            height: screenSize.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: [0.1, 0.5],
                begin: AlignmentGeometry.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.upperGradient, AppColors.lowerGradient],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Upper stuffs
                //-----------------------------------------------
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        height: MediaQuery.of(context).size.height * 0.35,
                        "assets/images/bot.png",
                      ),
                      Text("Welcome!", style: Apptext.displayMedium),
                    ],
                  ),
                ),

                //Lower Container
                //--------------------------------------------------
                Expanded(
                  child: Container(
                    width: screenSize.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(48),
                        topRight: Radius.circular(48),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //Text Input
                          //-----------------------------------
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "What's your name?",
                                style: Apptext.displaySmall,
                              ),
                              TextFieldContainer(
                                elevated: true,
                                textController: nameController,
                                typeOfKeyboard: TextInputType.name,
                              ),
                            ],
                          ),
                          // Next Button
                          //--------------------------------------
                          SizedBox(
                            height: 45,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightBlueAccent,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide.none,
                                  borderRadius: BorderRadiusGeometry.circular(
                                    8,
                                  ),
                                ),
                              ),
                              iconAlignment: IconAlignment.end,
                              label: Text("Next", style: Apptext.bodyMedium),
                              icon: Icon(
                                Icons.arrow_forward_sharp,
                                size: 20,
                                weight: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              onPressed: () {
                                if (nameController.text.isNotEmpty) {
                                  userName = nameController.text;
                                  nameController.clear();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailsPage(userName: userName),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
