class GenresList {
  List<Genres> _genres;

  GenresList({List<Genres> genres}) {
    this._genres = genres;
  }

  List<Genres> get genres => _genres;
  set genres(List<Genres> genres) => _genres = genres;

  GenresList.fromJson(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      _genres = new List<Genres>();
      json['genres'].forEach((v) {
        _genres.add(new Genres.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._genres != null) {
      data['genres'] = this._genres.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Genres {
  int _id;
  String _name;

  Genres({int id, String name}) {
    this._id = id;
    this._name = name;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;

  Genres.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    return data;
  }
}
