import 'package:flutter/material.dart';
import 'package:submission_bmafup_movie_dicoding_app/helper/constants_helper.dart';
import 'package:submission_bmafup_movie_dicoding_app/presentation/favorite_page.dart';
import 'package:submission_bmafup_movie_dicoding_app/presentation/home_page.dart';
import 'package:submission_bmafup_movie_dicoding_app/presentation/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _indexSelected = 0;

  static const List<Widget> _pageList = <Widget>[
    HomePage(),
    FavoritePage(),
    ProfilePage(),
  ];

  void _onTabBottomNavigation(int index) {
    setState(() {
      _indexSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantsHelper.kBaseColor,
      body: _pageList[_indexSelected],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexSelected,
        selectedItemColor: ConstantsHelper.kBackSplash,
        unselectedItemColor: ConstantsHelper.kBackSplash.withOpacity(0.5),
        onTap: _onTabBottomNavigation,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
