import 'package:cinema_app/models/cast.dart';
import 'package:cinema_app/models/genres.dart';
import 'package:cinema_app/models/movie_details_model.dart';
import 'package:cinema_app/models/now_playing_movies_list.dart';
import 'package:cinema_app/models/popular_movies_list.dart';
import 'package:dio/dio.dart';

BaseOptions options = new BaseOptions(
  baseUrl: "https://api.themoviedb.org",
  connectTimeout: 5000,
  receiveTimeout: 3000,
  headers: {
    'Authorization': 'Bearer ${MoviesApi.API_KEY}',
  },
);

class MoviesApi {
  Dio dio = Dio(options);
  static const String API_KEY =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNWM5NDNmYjNjNTNlMzFkODEzN2Q2ZjNhNGVlNzhmOSIsInN1YiI6IjVlMGJkMzljODU4Njc4MDAxOGJkZGVjMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.WX7xg2aVGFUSto3KCGwkpnLkBADtYNszLWwVr4OC1Ro';

  Future<PopularMoviesList> getPopularMovies() async {
    try {
      Response response = await dio.get(
        '/3/movie/popular',
      );
      return PopularMoviesList.fromJson(response.data);
    } catch (error) {
      throw error;
    }
  }

  Future<GenresList> getGenresList({
    String language = 'en-US',
  }) async {
    try {
      Response response = await dio.get(
        '/3/genre/movie/list',
        queryParameters: {
          "language": language,
        },
      );
      return GenresList.fromJson(response.data);
    } catch (error) {
      throw error;
    }
  }

  Future<NowPlayingMoviesList> getNowPlayingList({
    String language = 'en-US',
    int page = 1,
    String region = '',
  }) async {
    try {
      Response response = await dio.get(
        '/3/movie/now_playing',
        queryParameters: {
          "language": language,
          "page": page,
          "region": region,
        },
      );
      return NowPlayingMoviesList.fromJson(response.data);
    } catch (error) {
      throw error;
    }
  }

  Future<CastList> getCast(
    int movieId,
  ) async {
    try {
      Response response = await dio.get(
        '/3/movie/$movieId/credits',
      );
      return CastList.fromJson(response.data);
    } catch (error) {
      throw error;
    }
  }

  Future<MovieDetailsModel> getMovie(
    int movieId, {
    String language,
    String appendToResponse = 'videos',
  }) async {
    try {
      Response response = await dio.get(
        '/3/movie/$movieId',
        queryParameters: {
          "language": language,
          "append_to_response": appendToResponse,
        },
      );
      return MovieDetailsModel.fromJson(response.data);
    } catch (error) {
      throw error;
    }
  }
}

MoviesApi api = MoviesApi();
