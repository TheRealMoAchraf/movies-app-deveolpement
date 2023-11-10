import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/firebase_function.dart';
import 'package:moviesapp/models/fav_movie.dart';
import 'package:moviesapp/models/recommanded_model.dart';
import 'package:moviesapp/shared/style/colors/app_colores.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.recommandedModel});

  final RecommandedModel recommandedModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 10,
      child: Container(
        width: 100,
        height: 184,
        decoration: const BoxDecoration(
          color: Color(0xff343534),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: CachedNetworkImage(
                    width: 100,
                    height: 128,
                    imageUrl:
                        "https://image.tmdb.org/t/p/w500${recommandedModel.posterImage.image}",
                    fit: BoxFit.fill,
                    placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                      color: AppColors.selectedIconColor,
                    )),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: AppColors.selectedIconColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/star.png',
                            width: 10,
                            height: 10,
                            fit: BoxFit.fill,
                          ),
                          Text(recommandedModel.rating),
                        ],
                      ),
                      Text(recommandedModel.posterImage.title,
                          maxLines: 2, overflow: TextOverflow.ellipsis),
                      Text(recommandedModel.posterImage.relaiseDate,
                          maxLines: 2, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                )
              ],
            ),
            InkWell(
              onTap: () {
                FavMovie favMovie = FavMovie(
                    title: recommandedModel.posterImage.title,
                    image: recommandedModel.posterImage.image,

                    );
                FirebaseFunction.addMovie(favMovie);
              },
              child: Image.asset(
                'assets/images/bookmark_add.png',
                width: 27,
                height: 36,
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
      ),
    );
  }
}
