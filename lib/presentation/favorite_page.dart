import 'package:flutter/material.dart';
import 'package:submission_bmafup_movie_dicoding_app/helper/constants_helper.dart';
import 'package:submission_bmafup_movie_dicoding_app/model/movie_model.dart';
import 'package:submission_bmafup_movie_dicoding_app/presentation/components/card_favorite.dart';
import 'package:submission_bmafup_movie_dicoding_app/presentation/function/controller.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    horizontal: ConstantsHelper.paddingHorizontal,
                    vertical: 10),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text("Your Favorite",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: ConstantsHelper.kBackSplash)),
                    SizedBox(height: 4),
                    Text("All about your favorite movie",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: ConstantsHelper.kBackSplash)),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                    horizontal: ConstantsHelper.paddingHorizontal),
                color: Colors.white,
                child: TabBar(
                  tabs: [
                    Tab(
                        icon: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.arrow_circle_up),
                        SizedBox(width: 6),
                        Text(
                          "Up Coming",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )),
                    Tab(
                        icon: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.arrow_circle_down),
                        SizedBox(width: 6),
                        Text(
                          "Now Playing",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )),
                  ],
                  controller: _controller,
                  unselectedLabelColor: Colors.grey,
                  indicator: BoxDecoration(
                    color: ConstantsHelper.kBackSplash.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                    horizontal: ConstantsHelper.paddingHorizontal,
                    vertical: 10),
                color: Colors.white,
                height: MediaQuery.of(context).size.height - 200,
                child: TabBarView(
                  controller: _controller,
                  children: [
                    FutureBuilder<List<MovieModel>>(
                        future: Controller.getMovieUpComingNowPlaying(
                            isUpComing: true),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return CardFavorite(
                              dataListMovie: snapshot.data!,
                            );
                          } else {
                            return const CircularProgressIndicator(
                              color: ConstantsHelper.kBackSplash,
                            );
                          }
                        }),
                    FutureBuilder<List<MovieModel>>(
                        future: Controller.getMovieUpComingNowPlaying(
                            isUpComing: false),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return CardFavorite(
                              dataListMovie: snapshot.data!,
                            );
                          } else {
                            return const CircularProgressIndicator(
                              color: ConstantsHelper.kBackSplash,
                            );
                          }
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
