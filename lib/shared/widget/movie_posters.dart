import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/shared/style/colors/app_colores.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            width: 97,
            height: 128,
            imageUrl: "https://image.tmdb.org/t/p/w500$image",
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
        Image.asset(
          'assets/images/bookmark_add.png',
          width: 27,
          height: 36,
          fit: BoxFit.fill,
        )
      ],
    );
  }
}
