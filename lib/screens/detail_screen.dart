import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttterworkfinal/models/detail_movie_model.dart';
import 'package:fluttterworkfinal/services/api_service.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.movieId}) : super(key: key);
  final String movieId;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<DetailMovieModel> movieDetail;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieDetail = ApiService.getDetail(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Back to list'),
      ),
      extendBodyBehindAppBar: true,
      body: FutureBuilder(
        future: movieDetail,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var runTime = snapshot.data!.runtime;

            return Stack(
              children: [
                Container(
                  height: double.infinity,
                  child: Opacity(
                    opacity: 0.9,
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500/${snapshot.data!.poster_path}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 280,
                      ),
                      Text(
                        '${snapshot.data!.title}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RatingBar.builder(
                        itemSize: 22.0,
                        itemCount: 5,
                        allowHalfRating: true,
                        initialRating: (snapshot.data!.vote_average! / 2.0),
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (value) => print(value),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 30,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${(runTime! / 60).toInt()}h ${(runTime % 60)}min | ',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.genres!.length,
                                itemBuilder: (context, index) {
                                  return Text(
                                    '${snapshot.data!.genres![index].name} ',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'StoryLine',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 200,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                '${snapshot.data!.overview}',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 60,
                                width: 300,
                                decoration: BoxDecoration(
                                  color: Colors.amberAccent,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Text(
                                  'Buy ticket',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
