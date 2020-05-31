import 'movie.dart';

class PopularMoviesList {
  int page;
  int totalResults;
  int totalPages;
  List<Movie> results;

  PopularMoviesList({page, totalResults, totalPages, results});

  PopularMoviesList.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      results = List<Movie>();
      json['results'].forEach((v) {
        results.add(Movie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['page'] = page;
    data['total_results'] = totalResults;
    data['total_pages'] = totalPages;
    if (results != null) {
      data['results'] = results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
