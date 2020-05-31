class MovieDetailsModel {
  bool adult;
  String backdropPath;
  Map belongsToCollection;
  int budget;
  List<GenreWithName> genres;
  String homepage;
  int id;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  List<ProductionCompanies> productionCompanies;
  List<ProductionCountries> productionCountries;
  String releaseDate;
  int revenue;
  int runtime;
  List<SpokenLanguages> spokenLanguages;
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;
  Videos videos;

  MovieDetailsModel(
      {adult,
      backdropPath,
      belongsToCollection,
      budget,
      genres,
      homepage,
      id,
      imdbId,
      originalLanguage,
      originalTitle,
      overview,
      popularity,
      posterPath,
      productionCompanies,
      productionCountries,
      releaseDate,
      revenue,
      runtime,
      spokenLanguages,
      status,
      tagline,
      title,
      video,
      voteAverage,
      voteCount,
      videos});

  MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'];
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = List<GenreWithName>();
      json['genres'].forEach((v) {
        genres.add(GenreWithName.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = List<ProductionCompanies>();
      json['production_companies'].forEach((v) {
        productionCompanies.add(ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = List<ProductionCountries>();
      json['production_countries'].forEach((v) {
        productionCountries.add(ProductionCountries.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = List<SpokenLanguages>();
      json['spoken_languages'].forEach((v) {
        spokenLanguages.add(SpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    videos = json['videos'] != null ? Videos.fromJson(json['videos']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['belongs_to_collection'] = belongsToCollection;
    data['budget'] = budget;
    if (genres != null) {
      data['genres'] = genres.map((v) => v.toJson()).toList();
    }
    data['homepage'] = homepage;
    data['id'] = id;
    data['imdb_id'] = imdbId;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    if (productionCompanies != null) {
      data['production_companies'] =
          productionCompanies.map((v) => v.toJson()).toList();
    }
    if (productionCountries != null) {
      data['production_countries'] =
          productionCountries.map((v) => v.toJson()).toList();
    }
    data['release_date'] = releaseDate;
    data['revenue'] = revenue;
    data['runtime'] = runtime;
    if (spokenLanguages != null) {
      data['spoken_languages'] =
          spokenLanguages.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['tagline'] = tagline;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    if (videos != null) {
      data['videos'] = videos.toJson();
    }
    return data;
  }
}

class GenreWithName {
  int id;
  String name;

  GenreWithName({id, name});

  GenreWithName.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class ProductionCompanies {
  int id;
  String logoPath;
  String name;
  String originCountry;

  ProductionCompanies({id, logoPath, name, originCountry});

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['id'] = id;
    data['logo_path'] = logoPath;
    data['name'] = name;
    data['origin_country'] = originCountry;
    return data;
  }
}

class ProductionCountries {
  String iso31661;
  String name;

  ProductionCountries({iso31661, name});

  ProductionCountries.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['iso_3166_1'] = iso31661;
    data['name'] = name;
    return data;
  }
}

class SpokenLanguages {
  String iso6391;
  String name;

  SpokenLanguages({iso6391, name});

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['iso_639_1'] = iso6391;
    data['name'] = name;
    return data;
  }
}

class Videos {
  List<Video> results;

  Videos({results});

  Videos.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = List<Video>();
      json['results'].forEach((v) {
        results.add(Video.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    if (results != null) {
      data['results'] = results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Video {
  String id;
  String iso6391;
  String iso31661;
  String key;
  String name;
  String site;
  int size;
  String type;

  Video({id, iso6391, iso31661, key, name, site, size, type});

  Video.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    iso6391 = json['iso_639_1'];
    iso31661 = json['iso_3166_1'];
    key = json['key'];
    name = json['name'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['id'] = id;
    data['iso_639_1'] = iso6391;
    data['iso_3166_1'] = iso31661;
    data['key'] = key;
    data['name'] = name;
    data['site'] = site;
    data['size'] = size;
    data['type'] = type;
    return data;
  }
}
