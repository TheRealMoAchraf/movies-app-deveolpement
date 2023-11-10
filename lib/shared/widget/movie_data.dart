import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moviesapp/shared/database/api/api_manger.dart';
import 'package:moviesapp/shared/style/colors/app_colores.dart';
import 'package:moviesapp/shared/widget/movie_posters.dart';

import '../../models/new_relase.dart';

class NewRelaseMovies extends StatelessWidget {
  const NewRelaseMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 32, top: 10, bottom: 5),
      height: 187,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: AppColors.moviesBackGround,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'New Releases',
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 15),
          ),
          const Gap(10),
          FutureBuilder<NewRelase>(
            future: ApiManger.upComingMovies(),
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
                  itemBuilder: (context, index) => MoviePoster(
                    image: movies[index].posterPath ?? '',
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
