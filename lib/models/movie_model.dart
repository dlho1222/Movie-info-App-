class MovieModel {
  final int page, total_pages, total_results;
  final List<Results> results;

  MovieModel.fromJson(Map<String, dynamic> json)
      : page = json['page'],
        total_pages = json['total_pages'],
        total_results = json['total_results'],
        results =
            (json['results'] as List).map((e) => Results.fromJson(e)).toList();
}

class Results {
  final bool adult, video;
  final String? backdrop_path,
      original_language,
      original_title,
      overview,
      poster_path,
      release_date,
      title;
  final List<int> genre_ids;
  final int id, vote_count;
  final double popularity, vote_average;
  Results.fromJson(Map<String, dynamic> json)
      : adult = json['adult'],
        video = json['video'],
        backdrop_path = json['backdrop_path'],
        original_language = json['original_language'],
        original_title = json['original_title'],
        overview = json['overview'],
        poster_path = json['poster_path'],
        release_date = json['release_date'],
        title = json['title'],
        genre_ids = json['genre_ids'].cast<int>(),
        id = json['id'],
        vote_count = json['vote_count'],
        popularity = json['popularity'].toDouble(),
        vote_average = json['vote_average'].toDouble();
}
