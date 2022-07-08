import 'package:flutter/material.dart';
import 'package:submission_bmafup_movie_dicoding_app/helper/constants_helper.dart';
import 'package:submission_bmafup_movie_dicoding_app/presentation/main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigatorToHome();
  }

  // Function _navigatorToHome to navigate splash page to home page
  // After delayed
  _navigatorToHome() async {
    var duration = const Duration(seconds: 3);
    return Future.delayed(duration, () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const MainPage(),
        ),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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
