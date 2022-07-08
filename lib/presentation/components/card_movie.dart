import 'package:flutter/material.dart';
import 'package:submission_bmafup_movie_dicoding_app/helper/constants_helper.dart';
import 'package:submission_bmafup_movie_dicoding_app/model/movie_model.dart';
import 'package:submission_bmafup_movie_dicoding_app/presentation/components/image_component.dart';
import 'package:submission_bmafup_movie_dicoding_app/presentation/detail_movie_page.dart';

class CardMovie extends StatelessWidget {
  final List<MovieModel>? dataListMovie;
  const CardMovie({Key? key, this.dataListMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      height: 296,
      child: ListView.builder(
        itemCount: dataListMovie!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailMoviePage(
                    detailMovie: dataListMovie![index],
                  ),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: MediaQuery.of(context).size.width / 3,
                  height: 216,
                  child: ImageComponent(
                      imageUrl:
                          "${ConstantsHelper.baseURLPoster}${dataListMovie![index].posterPath}"),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  padding: const EdgeInsets.only(top: 8, left: 3, right: 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        dataListMovie![index].originalTitle!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: <Widget>[
                          const Icon(
                            Icons.date_range,
                            color: Colors.blueGrey,
                            size: 13,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            dataListMovie![index].releaseDate!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
