import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';
import 'package:vibecheck/helper/firestore_helper.dart';
import 'package:vibecheck/utils/app_color.dart';
import 'package:vibecheck/views/homepage/controller/homepage_controller.dart';
import 'package:vibecheck/views/homepage/model/user.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController homePageController = Get.put(HomePageController());

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/background/background2.png'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(flex: 10),
            Container(
              margin: const EdgeInsets.all(25),
              child: Image.asset(
                "assets/logo/VibeCheck.png",
                height: 110,
              ),
            ),
            const Spacer(),
            const Text(
              "Experience the magic\nof real-time connection",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: AppColor.secondaryColor,
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 90),
              child: Text(
                "Where every face is a story waiting to be told, and every call is an invitation to dive deeper into the human experience.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColor.secondaryColor,
                ),
              ),
            ),
            const Spacer(flex: 3),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Form(
                key: homePageController.formKey,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: AppColor.secondaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please Enter your nickname.";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      homePageController.nickname = val!;
                    },
                    cursorColor: AppColor.primaryColor,
                    style: const TextStyle(color: AppColor.secondaryColor),
                    decoration: InputDecoration(
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Enter your name",
                      hintStyle: GoogleFonts.getFont(
                        'Poppins',
                        color: AppColor.secondaryColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: GestureDetector(
                onTap: () async {
                  if (homePageController.formKey.currentState!.validate()) {
                    homePageController.formKey.currentState!.save();

                    String userId = const Uuid().v1();

                    User user = User(
                      nickName: homePageController.nickname,
                      userId: userId,
                      time: DateTime.now().toString(),
                    );

                    await FireStoreHelper.fireStoreHelper.addLiveUser(user);

                    List<User> users = await FireStoreHelper.fireStoreHelper
                        .fetchAllLiveUser();

                    homePageController.setLiveUsers(users);

                    print(homePageController.allLiveUser[0].nickName);

                    // Get.to(
                    //   CallPage(
                    //       callID: "abc",
                    //       userID: homePageController.allLiveUser[0].userId,
                    //       nickName: homePageController.allLiveUser[0].nickName),
                    // );
                  }
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  child: const Text(
                    "GO",
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColor.backgroundColor,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 5),
          ],
        ),
      ),
    );
  }
}
