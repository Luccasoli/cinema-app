class GenresList {
  List<Genres> genres;

  GenresList({genres});

  GenresList.fromJson(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      genres = List<Genres>();
      json['genres'].forEach((v) {
        genres.add(Genres.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    if (genres != null) {
      data['genres'] = genres.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Genres {
  int id;
  String name;

  Genres({int id, String name}) {
    id = id;
    name = name;
  }

  Genres.fromJson(Map<String, dynamic> json) {
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
