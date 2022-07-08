import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:submission_bmafup_movie_dicoding_app/helper/utils.dart';
import 'package:submission_bmafup_movie_dicoding_app/presentation/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        title: 'Catalogue Movies',
        debugShowCheckedModeBanner: false,
        scrollBehavior: MyCustomScrollBehavior(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
