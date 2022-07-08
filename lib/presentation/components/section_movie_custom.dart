import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:submission_bmafup_movie_dicoding_app/model/movie_model.dart';
import 'package:submission_bmafup_movie_dicoding_app/presentation/components/card_movie.dart';

class SectionMovieCustom extends StatelessWidget {
  final String titleSection;
  final String decsTitleSection;
  final List<MovieModel>? dataListMovie;
  const SectionMovieCustom(
      {Key? key,
      required this.titleSection,
      required this.decsTitleSection,
      this.dataListMovie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
      color: Colors.white,
      child: Column(
        children: [
          // Header Component Upcoming Movie
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    titleSection,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    decsTitleSection,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  showSimpleNotification(const Text("You are clicked See All"),
                      background: Colors.green);
                },
                child: const Text("See All",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.blue)),
              )
            ],
          ),
          CardMovie(
            dataListMovie: dataListMovie,
          ),
        ],
      ),
    );
  }
}
