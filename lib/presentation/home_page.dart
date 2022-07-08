import 'package:flutter/material.dart';
import 'package:submission_bmafup_movie_dicoding_app/helper/constants_helper.dart';
import 'package:submission_bmafup_movie_dicoding_app/model/movie_model.dart';
import 'package:submission_bmafup_movie_dicoding_app/presentation/components/card_movie.dart';
import 'package:submission_bmafup_movie_dicoding_app/presentation/components/section_movie_custom.dart';
import 'package:submission_bmafup_movie_dicoding_app/presentation/components/welcome_banner.dart';
import 'package:submission_bmafup_movie_dicoding_app/presentation/function/controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String categorySelected = "Fantasy";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantsHelper.kBaseColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // WELCOME AND SEARCH SECTION
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: ConstantsHelper.paddingHorizontal,
                    vertical: 10),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const WelcomeBanner(name: "Theo"),
                    const SizedBox(
                      height: 50,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Find your favorite movie ...",
                        contentPadding: const EdgeInsets.all(12),
                        prefixIcon: const Icon(Icons.search),
                        fillColor: ConstantsHelper.kBackSplash,
                        hoverColor: ConstantsHelper.kBackSplash,
                        focusColor: ConstantsHelper.kBackSplash,
                        isDense: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ],
                ),
              ),

              // CATEGORY MOVIE
              Container(
                margin: const EdgeInsets.only(top: 6),
                padding: const EdgeInsets.symmetric(
                    horizontal: ConstantsHelper.paddingHorizontal,
                    vertical: 10),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Category",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    FutureBuilder<List<String>>(
                        future: Controller.getAllCategoryList(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return SizedBox(
                              height: 30,
                              child: ListView.builder(
                                itemCount: snapshot.data!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () async {
                                      Controller.getMovieByCategory(
                                          categoryMovie: snapshot.data![index]);
                                      setState(() {
                                        categorySelected =
                                            snapshot.data![index];
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 1),
                                      child: Center(
                                          child: Text(snapshot.data![index],
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.normal))),
                                    ),
                                  );
                                },
                              ),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: ConstantsHelper.kBackSplash,
                              ),
                            );
                          }
                        }),
                    const SizedBox(height: 8),
                    FutureBuilder<List<MovieModel>>(
                        future: Controller.getMovieByCategory(
                            categoryMovie: categorySelected),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return CardMovie(
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

              // UPCOMING MOVIE
              FutureBuilder<List<MovieModel>>(
                  future:
                      Controller.getMovieUpComingNowPlaying(isUpComing: true),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SectionMovieCustom(
                        titleSection: ConstantsHelper.upComing,
                        decsTitleSection: ConstantsHelper.subupComing,
                        dataListMovie: snapshot.data!,
                      );
                    } else {
                      return const CircularProgressIndicator(
                        color: ConstantsHelper.kBackSplash,
                      );
                    }
                  }),

              // NOWPLAYING MOVIE
              FutureBuilder<List<MovieModel>>(
                  future:
                      Controller.getMovieUpComingNowPlaying(isUpComing: false),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SectionMovieCustom(
                        titleSection: ConstantsHelper.nowPlaying,
                        decsTitleSection: ConstantsHelper.subNowPlaying,
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
      ),
    );
  }
}
