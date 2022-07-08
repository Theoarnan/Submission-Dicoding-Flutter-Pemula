import 'package:flutter/material.dart';
import 'package:submission_bmafup_movie_dicoding_app/helper/constants_helper.dart';
import 'package:submission_bmafup_movie_dicoding_app/model/movie_model.dart';
import 'package:submission_bmafup_movie_dicoding_app/presentation/components/image_component.dart';
import 'package:submission_bmafup_movie_dicoding_app/presentation/detail_movie_page.dart';

class CardFavorite extends StatelessWidget {
  final List<MovieModel>? dataListMovie;
  const CardFavorite({Key? key, this.dataListMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 296,
      child: ListView.builder(
        itemCount: dataListMovie!.length,
        scrollDirection: Axis.vertical,
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
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: ImageComponent(
                        imageUrl:
                            "${ConstantsHelper.baseURLPoster}${dataListMovie![index].posterPath}"),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 150,
                        child: Text(
                          dataListMovie![index].originalTitle!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
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
                      const SizedBox(
                        height: 6,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 150,
                        child: Text(
                          dataListMovie![index].overview!,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
