import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/models/search_response.dart';
import 'package:moviesapp/shared/style/colors/app_colores.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, this.result});
  final Result? result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(result!.title!),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            width: double.infinity,
            height: 220,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CachedNetworkImage(
                  width: double.infinity,
                  height: 220,
                  imageUrl:
                      "https://image.tmdb.org/t/p/w500${result!.posterPath}",
                  fit: BoxFit.fill,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.selectedIconColor,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: AppColors.selectedIconColor,
                  ),
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
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(20),
           height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(result!.title!, style: Theme.of(context).textTheme.bodyLarge,)
              ],
            ),
          )
        ]),
      ),
    );
  }
}
