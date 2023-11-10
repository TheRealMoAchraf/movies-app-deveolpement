import 'package:flutter/material.dart';

import 'package:moviesapp/models/search_response.dart';
import 'package:moviesapp/screens/search/search_item.dart';
import 'package:moviesapp/shared/database/api/api_manger.dart';
import 'package:moviesapp/shared/style/colors/app_colores.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String query = '';
  List<Result> movieList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: const SizedBox(),
        leadingWidth: 10,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 60,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              onChanged: (newQuery) {
                setState(() {
                  query = newQuery;
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.moviesBackGround,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintText: "Search",
                hintStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                ),
                contentPadding: const EdgeInsets.only(top: 10),
              ),
            ),
          ),
        ),
      ),
      body: query == ''
          ? Center(
              child: Image.asset('assets/images/no_movie.png'),
            )
          : FutureBuilder(
              future: ApiManger.searchResponse(query),
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
                var search = snapshot.data?.results ?? [];
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return SearchWidget(
                      resultSearch: search[index],
                    );
                  },
                  itemCount: search.length,
                );
              },
            ),
    );
  }
}
