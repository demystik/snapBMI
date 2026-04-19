import 'package:flutter/material.dart';
import 'package:snapbmi/resultpage.dart';
import 'package:snapbmi/utils/app_colors.dart';
import 'package:snapbmi/utils/apptext.dart';
// import 'package:snapbmi/utils/flat_textfield.dart';
import 'package:snapbmi/utils/textfield_container.dart';

class DetailsPage extends StatefulWidget {
  final String userName;
  const DetailsPage({super.key, required this.userName});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final List<String> weightItems = ["kg", "g"];
  final List<String> heightItems = ["m", "cm", "in"];
  String? selectedHeight;
  String? selectedWeight;
  String selectedGender = "Male";

  //Controllers/////////////////////////////////////////
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    String age;
    String weight;
    String height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          width: screenSize.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentGeometry.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.2],
              colors: [Colors.green, Colors.blueGrey],
            ),
          ),
          child: Column(
            children: [
              //Upper content
              //-----------------------------
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                size: 30,
                              ),
                            ),
                            Icon(Icons.notifications_none_rounded, size: 30),
                          ],
                        ),
                        SizedBox(height: screenSize.height * 0.02),
                        Text(
                          "Hi ${widget.userName}!",
                          style: Apptext.displayMedium,
                        ),
                        // SizedBox(height: screenSize.height * 0.04),
                      ],
                    ),
                  ),
                ),
              ),

              //White Container
              //--------------------------------------------------------------------
              // ==================== WHITE CONTAINER ====================
              Expanded(
                flex: 7,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(48),
                      topRight: Radius.circular(48),
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Profile Images
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: screenSize.width / 3,
                              height:
                                  screenSize.height / 6.5, // Slightly reduced
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  opacity: selectedGender == "Male" ? 1.0 : 0.5,
                                  image: const AssetImage(
                                    "assets/images/man.png",
                                  ),
                                ),
                                color: Colors.black12,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              width: screenSize.width / 3,
                              height: screenSize.height / 6.5,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  opacity: selectedGender == "Female"
                                      ? 1.0
                                      : 0.5,
                                  image: const AssetImage(
                                    "assets/images/woman.png",
                                  ),
                                ),
                                color: Colors.black12,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Gender Selection
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromARGB(255, 197, 225, 232),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () =>
                                      setState(() => selectedGender = "Male"),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: selectedGender == "Male"
                                          ? AppColors.lowerGradient
                                          : Colors.transparent,
                                    ),
                                    child: Text(
                                      "Male",
                                      textAlign: TextAlign.center,
                                      style: selectedGender == "Male"
                                          ? const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            )
                                          : const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black38,
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () =>
                                      setState(() => selectedGender = "Female"),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: selectedGender == "Female"
                                          ? AppColors.lowerGradient
                                          : Colors.transparent,
                                    ),
                                    child: Text(
                                      "Female",
                                      textAlign: TextAlign.center,
                                      style: selectedGender == "Female"
                                          ? const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            )
                                          : const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black38,
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 30),

                        // Form Fields
                        Column(
                          spacing: 20, // Consistent spacing
                          children: [
                            // Age
                            Row(
                              spacing: 15,
                              children: [
                                Text("Age ", style: Apptext.bodyMedium),
                                Expanded(
                                  child: SizedBox(
                                    height: screenSize.height * 0.06,
                                    child: TextFieldContainer(
                                      elevated: true,
                                      textController: ageController,
                                      typeOfKeyboard: TextInputType.number,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // Weight
                            Row(
                              spacing: 15,
                              children: [
                                Text("Weight", style: Apptext.bodyMedium),
                                Expanded(
                                  child: SizedBox(
                                    height: screenSize.height * 0.06,
                                    child: TextFieldContainer(
                                      elevated: false,
                                      textController: weightController,
                                      typeOfKeyboard: TextInputType.number,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.blueFadeGradient,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: DropdownButton<String>(
                                    value: selectedWeight,
                                    hint: Text(
                                      weightItems[0],
                                      style: Apptext.bodyMedium,
                                    ),
                                    underline: const SizedBox(),
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      size: 28,
                                    ),
                                    items: weightItems.map((item) {
                                      return DropdownMenuItem(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: Apptext.bodyMedium,
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (val) =>
                                        setState(() => selectedWeight = val),
                                  ),
                                ),
                              ],
                            ),

                            // Height
                            Row(
                              spacing: 15,
                              children: [
                                Text("Height", style: Apptext.bodyMedium),
                                Expanded(
                                  child: SizedBox(
                                    height: screenSize.height * 0.06,
                                    child: TextFieldContainer(
                                      elevated: false,
                                      textController: heightController,
                                      typeOfKeyboard: TextInputType.number,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.blueFadeGradient,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: DropdownButton<String>(
                                    value: selectedHeight,
                                    hint: Text(
                                      heightItems[0],
                                      style: Apptext.bodyMedium,
                                    ),
                                    underline: const SizedBox(),
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      size: 28,
                                    ),
                                    items: heightItems.map((item) {
                                      return DropdownMenuItem(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: Apptext.bodyMedium,
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (val) =>
                                        setState(() => selectedHeight = val),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 40),

                        // Calculate Button - Pinned at bottom with safe space
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightBlueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            onPressed: () {
                              if (ageController.text.isNotEmpty &&
                                  heightController.text.isNotEmpty &&
                                  weightController.text.isNotEmpty) {
                                age = ageController.text;
                                weight = weightController.text;
                                height = heightController.text;

                                if (int.tryParse(age) == null ||
                                    int.tryParse(weight) == null ||
                                    int.tryParse(height) == null) {
                                  showModalBottomSheet(
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(16),
                                    ),
                                    backgroundColor: Colors.transparent,
                                    isDismissible: true,
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.lowerGradient,
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 20,
                                              spreadRadius: 2,
                                            ),
                                          ],
                                        ),
                                        margin: EdgeInsets.all(16),
                                        padding: EdgeInsets.all(16),
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.cancel_outlined,
                                            color: Colors.white,
                                          ),
                                          title: Text(
                                            "Please enter correct data",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Resultpage(
                                        age: age,
                                        height: height,
                                        weight: weight,
                                        weightMetric: selectedWeight ?? "kg",
                                        heightMetric: selectedHeight ?? "m",
                                      ),
                                    ),
                                  );
                                }
                              }
                            },
                            child: Text(
                              "Calculate your BMI",
                              style: Apptext.bodyMedium,
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 30,
                        ), // Extra breathing space at bottom
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
