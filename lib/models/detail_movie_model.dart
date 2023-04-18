class DetailMovieModel {
  final bool? adult, video;
  final String? backdrop_path,
      homepage,
      imdb_id,
      original_language,
      original_title,
      overview,
      poster_path,
      release_date,
      status,
      tagline,
      title;
  final BelongsToCollection? belongs_to_collection;
  final int? budget, revenue, runtime, vote_count;
  final List<Genres>? genres;
  final double? popularity, vote_average;
  final List<ProductionCompanies>? production_companies;
  final List<ProductionCountries>? production_countries;
  final List<SpokenLanguages>? spoken_languages;
  DetailMovieModel.fromJson(Map<String, dynamic> json)
      : adult = json['adult'],
        video = json['video'],
        backdrop_path = json['backdrop_path'],
        homepage = json['homepage'],
        imdb_id = json['imdb_id'],
        original_language = json['original_language'],
        original_title = json['original_title'],
        overview = json['overview'],
        poster_path = json['poster_path'],
        release_date = json['release_date'],
        status = json['status'],
        tagline = json['tagline'],
        title = json['title'],
        belongs_to_collection = json["belongs_to_collection"] == null
            ? null
            : BelongsToCollection.fromJson(json["belongs_to_collection"]),
        budget = json['budget'],
        revenue = json['revenue'],
        runtime = json['runtime'],
        vote_count = json['vote_count'],
        genres =
            (json['genres'] as List).map((e) => Genres.fromJson(e)).toList(),
        popularity = json['popularity'].toDouble(),
        vote_average = json['vote_average'].toDouble(),
        production_companies = (json['production_companies'] as List)
            .map((e) => ProductionCompanies.fromJson(e))
            .toList(),
        production_countries = (json['production_countries'] as List)
            .map((e) => ProductionCountries.fromJson(e))
            .toList(),
        spoken_languages = (json['spoken_languages'] as List)
            .map((e) => SpokenLanguages.fromJson(e))
            .toList();
}

class BelongsToCollection {
  final int? id;
  final String? name, poster_path, backdrop_path;
  BelongsToCollection.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        poster_path = json['poster_path'],
        backdrop_path = json['backdrop_path'];
}

class Genres {
  final int? id;
  final String? name;
  Genres.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}

class ProductionCompanies {
  final int? id;
  final String? logo_path, name, origin_country;
  ProductionCompanies.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        logo_path = json['logo_path'],
        name = json['name'],
        origin_country = json['origin_country'];
}

class ProductionCountries {
  final String? release_date;
  final int? revenue, runtime;
  ProductionCountries.fromJson(Map<String, dynamic> json)
      : release_date = json['release_date'],
        revenue = json['revenue'],
        runtime = json['runtime'];
}

class SpokenLanguages {
  final String? english_name, iso_639_1, name;
  SpokenLanguages.fromJson(Map<String, dynamic> json)
      : english_name = json['english_name'],
        iso_639_1 = json['iso_639_1'],
        name = json['name'];
}
