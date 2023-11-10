import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/shared/style/colors/app_colores.dart';

class BuildMovieImage extends StatelessWidget {
  const BuildMovieImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        SizedBox(
          width: 129,
          child: CarouselSlider(
            items: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  width: 129,
                  height: 199,
                  imageUrl: image,
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
            ],
            options: CarouselOptions(
              height: 199,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
        Image.asset(
          'assets/images/bookmark.png',
          width: 27,
          height: 36,
          fit: BoxFit.fitHeight,
        ),
      ],
    );
  }
}