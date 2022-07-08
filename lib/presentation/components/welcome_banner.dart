import 'package:flutter/material.dart';
import 'package:submission_bmafup_movie_dicoding_app/helper/constants_helper.dart';

class WelcomeBanner extends StatelessWidget {
  final String? name;
  const WelcomeBanner({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: ConstantsHelper.paddingHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Hello, $name 👋",
              style: const TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: ConstantsHelper.kBackSplash)),
          const Text("Welcome to Play Catalog Movie",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: ConstantsHelper.kBackSplash)),
        ],
      ),
    );
  }
}
