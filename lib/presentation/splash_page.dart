import 'package:flutter/material.dart';
import 'package:submission_bmafup_movie_dicoding_app/helper/constants_helper.dart';
import 'package:submission_bmafup_movie_dicoding_app/presentation/main_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const MainPage(),
        ),
        (route) => false,
      );
    });
    return Scaffold(
      backgroundColor: ConstantsHelper.kBackSplash,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image.asset(
              "assets/gif_splash_bg.gif",
              scale: 1.5,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const CircularProgressIndicator(
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            ConstantsHelper.loadingText,
            style: TextStyle(fontSize: 12, color: Colors.white),
          )
        ],
      ),
    );
  }
}
