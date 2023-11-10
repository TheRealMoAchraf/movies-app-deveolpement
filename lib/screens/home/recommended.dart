import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moviesapp/shared/database/api/api_manger.dart';
import 'package:moviesapp/shared/style/colors/app_colores.dart';
import 'package:moviesapp/shared/widget/movie_item.dart';
import '../../models/postar_page.dart';
import '../../models/recommanded_model.dart';
import '../../models/recommanded_movies.dart';

class RecommandedMovies extends StatelessWidget {
  const RecommandedMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 32, top: 10, bottom: 5),
      height: 300,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: AppColors.moviesBackGround,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recommended',
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 15),
          ),
          const Gap(5),
          FutureBuilder<RecommnedMoviesModel>(
            future: ApiManger.recommendedMovies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.selectedIconColor,
                ));
              }
              if (snapshot.connectionState == ConnectionState.none) {
                return const Center(
                  child: Text('Please connect with internet'),
                );
              }
              var movies = snapshot.data?.results ?? [];
              return Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 20,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => MovieItem(
                    recommandedModel: RecommandedModel(
                        posterImage: PosterImageSlider(
                            image: movies[index].posterPath!,
                            title: movies[index].title!,
                            relaiseDate: movies[index].releaseDate!),
                        rating: movies[index].voteAverage.toString()),
                  ),
                  itemCount: movies.length,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
