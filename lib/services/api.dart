import 'package:cinema_app/models/PopularMoviesList.dart';
import 'package:dio/dio.dart';

class MoviesApi {
  Dio dio = Dio();
  static const String API_KEY =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNWM5NDNmYjNjNTNlMzFkODEzN2Q2ZjNhNGVlNzhmOSIsInN1YiI6IjVlMGJkMzljODU4Njc4MDAxOGJkZGVjMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.WX7xg2aVGFUSto3KCGwkpnLkBADtYNszLWwVr4OC1Ro';

  Future<PopularMoviesList> getPopularMovies() async {
    try {
      Response response = await dio.get(
        'https://api.themoviedb.org/3/movie/popular',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${MoviesApi.API_KEY}',
          },
        ),
      );
      return PopularMoviesList.fromJson(response.data);
    } catch (error) {
      throw error;
    }
  }
}

MoviesApi api = MoviesApi();
