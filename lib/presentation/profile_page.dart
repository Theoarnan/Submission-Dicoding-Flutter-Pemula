import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:submission_bmafup_movie_dicoding_app/helper/constants_helper.dart';
import 'package:submission_bmafup_movie_dicoding_app/presentation/components/image_component.dart';
import 'package:submission_bmafup_movie_dicoding_app/presentation/components/setting_component.dart';
import 'package:submission_bmafup_movie_dicoding_app/presentation/splash_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String defaultImage =
        "https://i.pinimg.com/originals/8c/2d/59/8c2d59b48660922144d67886a5c8bd2d.png";
    return Scaffold(
      backgroundColor: ConstantsHelper.kBaseColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(
                  horizontal: ConstantsHelper.paddingHorizontal, vertical: 10),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("My Profile",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: ConstantsHelper.kBackSplash)),
                  const SizedBox(height: 4),
                  const Text("All about setting and profile of you friend",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: ConstantsHelper.kBackSplash)),
                  const SizedBox(height: 10),
                  Center(
                    child: Stack(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 180,
                          child: ImageComponent(imageUrl: defaultImage),
                        ),
                        Positioned(
                          bottom: 16,
                          right: 20,
                          child: GestureDetector(
                            onTap: () {
                              showSimpleNotification(
                                  const Text(
                                      "You are cliked update photo profile"),
                                  background: Colors.green);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.4),
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              child: const Icon(
                                Icons.edit_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                      // child: ,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Column(
                      children: const <Widget>[
                        Text("Arnan Abdiel Theopilus",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: ConstantsHelper.kBackSplash)),
                        SizedBox(height: 4),
                        Text("'Always make somethings new'",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic,
                                color: ConstantsHelper.kBackSplash)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(
                  horizontal: ConstantsHelper.paddingHorizontal, vertical: 10),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("Setting",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ConstantsHelper.kBackSplash)),
                  const SizedBox(height: 22),
                  SettingComponent(
                    iconComponent: const Icon(
                      Icons.change_circle_rounded,
                      color: ConstantsHelper.kBackSplash,
                    ),
                    titleComponent: "Change Profile",
                    onTap: () {
                      showSimpleNotification(
                          const Text("You are cliked Change Profile"),
                          background: Colors.green);
                    },
                  ),
                  SettingComponent(
                    iconComponent: const Icon(
                      Icons.lock,
                      color: ConstantsHelper.kBackSplash,
                    ),
                    titleComponent: "Change Password",
                    onTap: () {
                      showSimpleNotification(
                          const Text("You are cliked Change Password"),
                          background: Colors.green);
                    },
                  ),
                  SettingComponent(
                    iconComponent: const Icon(
                      Icons.translate,
                      color: ConstantsHelper.kBackSplash,
                    ),
                    titleComponent: "Change Language",
                    onTap: () {
                      showSimpleNotification(
                          const Text("You are cliked Change Language"),
                          background: Colors.green);
                    },
                  ),
                  SettingComponent(
                    iconComponent: const Icon(
                      Icons.warning_rounded,
                      color: ConstantsHelper.kBackSplash,
                    ),
                    titleComponent: "About",
                    onTap: () {
                      showSimpleNotification(const Text("You are cliked About"),
                          background: Colors.green);
                    },
                  ),
                  SettingComponent(
                    iconComponent: const Icon(
                      Icons.logout_outlined,
                      color: ConstantsHelper.kBackSplash,
                    ),
                    titleComponent: "Logout",
                    onTap: () async {
                      await showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title:
                                    const Text('Are you sure want to leave?'),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const SplashPage(),
                                          ),
                                          (route) => false,
                                        );
                                      },
                                      child: const Text('Yes')),
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text('No'))
                                ],
                              ));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
