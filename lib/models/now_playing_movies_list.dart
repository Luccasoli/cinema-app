import 'package:cinema_app/models/movies_list.dart';

class NowPlayingMoviesList extends MoviesList {
  Dates dates;

  NowPlayingMoviesList({page, results, dates, totalPages, totalResults});

  @override
  NowPlayingMoviesList.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    dates = json['dates'] != null ? Dates.fromJson(json['dates']) : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['page'] = page;
    if (results != null) {
      data['results'] = results.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    if (dates != null) {
      data['dates'] = dates.toJson();
    }
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
