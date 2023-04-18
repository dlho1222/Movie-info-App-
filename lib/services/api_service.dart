import 'dart:convert';

import 'package:fluttterworkfinal/models/coming_soon.movie.dart';
import 'package:fluttterworkfinal/models/detail_movie_model.dart';
import 'package:fluttterworkfinal/models/movie_model.dart';
import 'package:fluttterworkfinal/models/playinng_movie_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baserUrl = "https://movies-api.nomadcoders.workers.dev";
  static Future<MovieModel> getPopualr() async {
    final url = Uri.parse('$baserUrl/popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final popularMovies = jsonDecode(response.body);

      return MovieModel.fromJson(popularMovies);
    }
    throw Error();
  }

  static Future<PlayingMovieModel> getPlaying() async {
    final url = Uri.parse('$baserUrl/now-playing');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final playingMovies = jsonDecode(response.body);

      return PlayingMovieModel.fromJson(playingMovies);
    }
    throw Error();
  }

  static Future<ComingSoonMovieModel> getCommingSoon() async {
    final url = Uri.parse('$baserUrl/coming-soon');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final playingMovies = jsonDecode(response.body);

      return ComingSoonMovieModel.fromJson(playingMovies);
    }
    throw Error();
  }

  static Future<DetailMovieModel> getDetail(String movieId) async {
    final url = Uri.parse('$baserUrl/movie?id=$movieId');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final playingMovies = jsonDecode(response.body);
      print(DetailMovieModel.fromJson(playingMovies));
      return DetailMovieModel.fromJson(playingMovies);
    }
    throw Error();
  }
}
