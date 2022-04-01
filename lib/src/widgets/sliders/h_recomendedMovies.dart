import 'package:flutter/material.dart';
import '../../models/models.dart';

class SimilarMovies extends StatefulWidget {
  const SimilarMovies({
    Key? key,
    required this.size,
    required this.movies,
    required this.getRecomendedMovies,
  }) : super(key: key);

  final Size size;
  final List<Movie> movies;
  final Function getRecomendedMovies;

  @override
  State<SimilarMovies> createState() => _SimilarMoviesState();
}

class _SimilarMoviesState extends State<SimilarMovies> {
  @override
  void initState() {
    widget.getRecomendedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10.0),
        width: widget.size.width,
        height: widget.size.height * 0.25,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.movies.length,
            itemBuilder: (_, index) {
              final movie = widget.movies[index];
              return GestureDetector(
                onTap: ()=>Navigator.pushNamed(context, 'detailsPage',
                 arguments: movie
                ),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: widget.size.width * 0.35,
                    clipBehavior: Clip.antiAlias,
                    margin: const EdgeInsets.all(10),
                    child: FadeInImage(
                      image: NetworkImage(movie.fullImage),
                      placeholder:
                          const AssetImage('assets/gif/loading-colour.gif'),
                      fit: BoxFit.cover,
                    )),
              );
            }));
  }
}
