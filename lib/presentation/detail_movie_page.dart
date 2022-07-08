import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:submission_bmafup_movie_dicoding_app/helper/constants_helper.dart';
import 'package:submission_bmafup_movie_dicoding_app/model/movie_model.dart';
import 'package:submission_bmafup_movie_dicoding_app/presentation/components/image_component.dart';

class DetailMoviePage extends StatefulWidget {
  final MovieModel detailMovie;
  const DetailMoviePage({Key? key, required this.detailMovie})
      : super(key: key);

  @override
  State<DetailMoviePage> createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        color: ConstantsHelper.kBackSplash,
        child: TextButton(
            child: const Text(
              "Add To Favorite",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onPressed: () {
              showSimpleNotification(
                  const Text("You are cliked Add to favorite"),
                  background: Colors.green);
            }),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 3.94,
                    width: double.infinity,
                    child: ImageComponent(
                        imageUrl:
                            "${ConstantsHelper.baseURLBanner}${widget.detailMovie.backdropPath}"),
                  ),
                ),
                Positioned(
                  top: 28,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: ConstantsHelper.paddingHorizontal, vertical: 10),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 120,
                    height: 150,
                    child: ImageComponent(
                        imageUrl:
                            "${ConstantsHelper.baseURLPoster}${widget.detailMovie.posterPath}"),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: ConstantsHelper.paddingHorizontal,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          width: MediaQuery.of(context).size.width - 200,
                          child: Text(
                            widget.detailMovie.originalTitle!,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.detailMovie.voteAverage.toString(),
                              style: const TextStyle(
                                  // color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RatingBar.builder(
                              initialRating: double.tryParse(
                                      widget.detailMovie.voteAverage!)! /
                                  2,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 10,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                // ignore: avoid_print
                                print(rating);
                              },
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: <Widget>[
                            const Icon(
                              Icons.remove_red_eye,
                              color: Colors.blueGrey,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Text(
                                widget.detailMovie.voteCount!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: <Widget>[
                            const Icon(
                              Icons.date_range,
                              color: Colors.blueGrey,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Text(
                                widget.detailMovie.releaseDate!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: ConstantsHelper.paddingHorizontal, vertical: 8),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Overview",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.detailMovie.overview!,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: ConstantsHelper.kBackSplash.withOpacity(0.7)),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: ConstantsHelper.paddingHorizontal, vertical: 10),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 30,
                    child: ListView.builder(
                      itemCount: widget.detailMovie.genre!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 1),
                          child: Center(
                              child: Text(
                                  widget.detailMovie.genre![index]!.genreName!,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal))),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: ConstantsHelper.paddingHorizontal, vertical: 8),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Cast",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      itemCount: widget.detailMovie.cast!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                            right: 8.0,
                          ),
                          width: 100.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 70.0,
                                height: 70.0,
                                child: ImageComponent(
                                    imageUrl:
                                        "${ConstantsHelper.baseURLCast}${widget.detailMovie.cast![index]!.photo}"),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              SizedBox(
                                width: 300,
                                child: Text(
                                  widget.detailMovie.cast![index]!.nameCast!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    height: 1.4,
                                    color: ConstantsHelper.kBackSplash,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
