import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moviesapp/models/popular_response.dart';
import 'package:moviesapp/models/search_response.dart';

import '../../../models/movie_category.dart';
import '../../../models/new_relase.dart';
import '../../../models/recommanded_movies.dart';
import '../../constants/constants.dart';

class ApiManger {
  static Future<PopularMovies> getPopularMovies() async {
    try {
      Uri url = Uri.https(AppConstants.baseUrl, AppConstants.popularEndPoint);
      var respose = await http.get(url, headers: {
        AppConstants.authorizationHeader: AppConstants.token,
        AppConstants.acceptHeader: AppConstants.acceptHeaderValue
      });
      PopularMovies data = PopularMovies.fromJson(jsonDecode(respose.body));
      return data;
    } catch (e) {
      rethrow;
    }
  }

  static Future<NewRelase> upComingMovies() async {
    try {
      Uri url = Uri.https(AppConstants.baseUrl, AppConstants.upComingEndPoint,
          {"language": 'en-US', "page": "1"});
      var respose = await http.get(url, headers: {
        AppConstants.authorizationHeader: AppConstants.token,
        AppConstants.acceptHeader: AppConstants.acceptHeaderValue
      });
      NewRelase data = NewRelase.fromJson(jsonDecode(respose.body));

      return data;
    } catch (e) {
      rethrow;
    }
  }

  static Future<SearchResponse> searchResponse(String query) async {
    var url = Uri.https(AppConstants.baseUrl, '/3/search/movie', {
      "query": query,
    });
    var response = await http.get(url, headers: {
      AppConstants.authorizationHeader: AppConstants.token,
      AppConstants.acceptHeader: AppConstants.acceptHeaderValue
    });
    return SearchResponse.fromJson(
      jsonDecode(response.body),
    );
  }

  static Future<RecommnedMoviesModel> recommendedMovies() async {
    try {
      Uri url = Uri.https(AppConstants.baseUrl, AppConstants.discoverEndPoint, {
        "language": 'en-US',
        "page": "1",
        "include_adult": 'false',
        "include_video": 'include_video',
        'sort_by': 'vote_average.desc',
        'without_genres': '99,10755',
        'vote_count.gte': '200'
      });
      var respose = await http.get(url, headers: {
        AppConstants.authorizationHeader: AppConstants.token,
        AppConstants.acceptHeader: AppConstants.acceptHeaderValue
      });
      RecommnedMoviesModel data =
          RecommnedMoviesModel.fromJson(jsonDecode(respose.body));

      return data;
    } catch (e) {
      rethrow;
    }
  }

  static Future<MovieCategoryModel> movieCategory() async {
    try {
      Uri url = Uri.https(
          AppConstants.baseUrl, '3/genre/movie/list', {"language": 'en'});
      var respose = await http.get(url, headers: {
        AppConstants.authorizationHeader: AppConstants.token,
        AppConstants.acceptHeader: AppConstants.acceptHeaderValue
      });
      MovieCategoryModel data =
          MovieCategoryModel.fromJson(jsonDecode(respose.body));
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
