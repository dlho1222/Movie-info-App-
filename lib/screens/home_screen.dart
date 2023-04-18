import 'package:flutter/material.dart';
import 'package:fluttterworkfinal/models/coming_soon.movie.dart';
import 'package:fluttterworkfinal/models/movie_model.dart';
import 'package:fluttterworkfinal/models/playinng_movie_model.dart';
import 'package:fluttterworkfinal/screens/detail_screen.dart';
import 'package:fluttterworkfinal/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<MovieModel> popularMovies = ApiService.getPopualr();
  Future<PlayingMovieModel> playingMovies = ApiService.getPlaying();
  Future<ComingSoonMovieModel> comingSoonMovies = ApiService.getCommingSoon();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
              ),
              Text(
                'Popular Movies',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 220,
                child: FutureBuilder(
                  future: popularMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              var popular = snapshot.data!.results[index];
                              return Container(
                                width: 320,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                          movieId:
                                              '${snapshot.data!.results[index].id}',
                                        ),
                                      ),
                                    );
                                  },
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w500/${popular.backdrop_path}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 10,
                                ),
                            itemCount: snapshot.data!.results.length),
                      );
                    }

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Now in Cinemas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 175,
                child: FutureBuilder(
                  future: playingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    width: 150,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DetailScreen(
                                              movieId: snapshot
                                                  .data!.results[index].id
                                                  .toString(),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Image.network(
                                        'https://image.tmdb.org/t/p/w500/${snapshot.data!.results[index].backdrop_path}',
                                        fit: BoxFit.cover,
                                        height: 150,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${snapshot.data!.results[index].title}',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 10,
                                ),
                            itemCount: snapshot.data!.results.length),
                      );
                    }
                    return Text('...');
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Coming soon',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 100,
                child: FutureBuilder(
                  future: comingSoonMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                          movieId:
                                              '${snapshot.data!.results[index].id}',
                                        ),
                                      ),
                                    );
                                  },
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w500/${snapshot.data!.results[index].backdrop_path}',
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 10,
                                ),
                            itemCount: snapshot.data!.results.length),
                      );
                    }
                    return Text('...');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
