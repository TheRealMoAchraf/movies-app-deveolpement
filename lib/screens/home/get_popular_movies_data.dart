import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/models/popular_response.dart';
import 'package:moviesapp/shared/database/api/api_manger.dart';
import 'package:moviesapp/shared/style/colors/app_colores.dart';
import 'package:moviesapp/shared/widget/home_slider.dart';

import '../../models/postar_page.dart';

class GetSliderData extends StatelessWidget {
  const GetSliderData({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PopularMovies>(
      future: ApiManger.getPopularMovies(),
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
        return SizedBox(
          height:292 ,
          child: CarouselSlider(
              items: movies
                  .map((e) => HomeSlider(
                        poster: PosterImageSlider(
                          image: e.backdropPath ?? '',
                          relaiseDate: e.releaseDate!,
                          title: e.title!,
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                height: 292,
                viewportFraction: 1.0,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              )),
        );
      },
    );
  }
}
