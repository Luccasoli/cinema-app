import 'movie.dart';

class NowPlayingMoviesList {
  int page;
  List<Movie> results;
  Dates dates;
  int totalPages;
  int totalResults;

  NowPlayingMoviesList({page, results, dates, totalPages, totalResults});

  NowPlayingMoviesList.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = List<Movie>();
      json['results'].forEach((v) {
        results.add(Movie.fromJson(v));
      });
    }
    dates = json['dates'] != null ? Dates.fromJson(json['dates']) : null;
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['page'] = page;
    if (results != null) {
      data['results'] = results.map((v) => v.toJson()).toList();
    }
    if (dates != null) {
      data['dates'] = dates.toJson();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}

class Dates {
  String maximum;
  String minimum;

  Dates({maximum, minimum});

  Dates.fromJson(Map<String, dynamic> json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['maximum'] = maximum;
    data['minimum'] = minimum;
    return data;
  }
}
