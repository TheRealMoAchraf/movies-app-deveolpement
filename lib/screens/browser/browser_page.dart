import 'package:flutter/material.dart';
import 'package:moviesapp/shared/database/api/api_manger.dart';
import 'package:moviesapp/shared/widget/movie_category.dart';

import '../../shared/style/colors/app_colores.dart';

class BrowserPage extends StatelessWidget {
  const BrowserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(23.0),
      child: Column(
        children: [
          Text(
            'Browse Category',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 20,
          ),
          FutureBuilder(
              future: ApiManger.movieCategory(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: AppColors.selectedIconColor,
                  ));
                }
                if (snapshot.connectionState == ConnectionState.none) {
                  return Center(
                    child: Text('Please connect with internet'),
                  );
                }
                var data = snapshot.data?.genres ?? [];
                return Expanded(
                  child: GridView.builder(
                    itemCount: data.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 30,
                            crossAxisCount: 2,
                            crossAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      return MovieCategory(txt: data[index].name!);
                    },
                  ),
                );
              })
        ],
      ),
    );
  }
}
