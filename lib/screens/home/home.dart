import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:moviesapp/shared/widget/movie_data.dart';

import 'get_popular_movies_data.dart';
import 'recommended.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          GetSliderData(),
          Gap(28),
          NewRelaseMovies(),
          Gap(28),
          RecommandedMovies(),
          Gap(28),
        ],
      ),
    );
  }
}
