import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/models/postar_page.dart';
import 'package:moviesapp/screens/details_screen/details_screen.dart';
import 'package:moviesapp/shared/style/colors/app_colores.dart';
import 'package:moviesapp/shared/widget/build_movie_image.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key, required this.poster});
  final PosterImageSlider poster;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 290,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DetailsScreen(),
            ),
          );
        },
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CarouselSlider(
                  items: [
                    SizedBox(
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Stack(
                              children: [
                                CachedNetworkImage(
                                  width: double.infinity,
                                  imageUrl:
                                      "https://image.tmdb.org/t/p/w500${poster.image}",
                                  fit: BoxFit.fill,
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.selectedIconColor,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                    Icons.error,
                                    color: AppColors.selectedIconColor,
                                  ),
                                ),
                                BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Container(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ],
                            ),
                            Image.asset(
                              'assets/images/play-button-2.png',
                              width: 60,
                              height: 60,
                              fit: BoxFit.fill,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                  options: CarouselOptions(
                    height: 217,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Row(
                  children: [
                    const Expanded(child: SizedBox.shrink()),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            poster.title,
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            poster.relaiseDate,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.grey, fontSize: 10),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            Positioned(
                left: 21,
                child: BuildMovieImage(
                  image: "https://image.tmdb.org/t/p/w500${poster.image}",
                ))
          ],
        ),
      ),
    );
  }
}
