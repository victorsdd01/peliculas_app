import 'package:peliculas_app/src/pages/pages.dart';
import '../../models/models.dart';
import '../../providers/providers.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'buscar';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (query.characters.isNotEmpty)
        IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              final lastSearch = query;
              query = lastSearch;
            })
      else
        Center(child: searchButton())
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final searchMovieProvider = Provider.of<MoviesProvider>(context);
    final searchedMovies = searchMovieProvider.movieSearch;
    final movieName = query;

    return FutureBuilder(
        future: searchMovieProvider.searchMovie(movieName),
        builder: (_, AsyncSnapshot<List<Movie>> snapShot) {
          if (!snapShot.hasData) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else {
            return _GridResults(
              size: size,
              searchedMovies: searchedMovies,
            );
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    moviesProvider.getSuggestionByQuery(query);
    final popularMovies = moviesProvider.popular_movies;

    return StreamBuilder(
        stream: moviesProvider.suggestionStream,
        builder: (_, AsyncSnapshot<List<Movie>> snapShot) {
          //if (!snapShot.hasData) return Container();
          // return Center(child: CircularProgressIndicator.adaptive());
          return _SearchMovie(popularMovies: popularMovies, size: size);
        });
  }

  Center searchButton() {
    return const Center(child: Icon(Icons.search));
  }
}

class _SearchMovie extends StatelessWidget {
  const _SearchMovie({
    Key? key,
    required this.popularMovies,
    required this.size,
  }) : super(key: key);

  final List<Movie> popularMovies;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (_, __) => const Divider(
              color: AppThemes.primary,
              indent: 25,
              endIndent: 25,
            ),
        itemCount: popularMovies.length,
        itemBuilder: (_, index) {
          final movies = popularMovies[index];

          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'detailsPage', arguments: movies),
            child: Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(5.0),
                width: double.infinity,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: size.width * 0.3,
                      height: size.height * 0.2,
                      child: FadeInImage(
                        fit: BoxFit.cover,
                        placeholder:
                            const AssetImage('assets/gif/loading-blocks.gif'),
                        image: NetworkImage(movies.fullImage),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 25.0),
                      width: size.width * 0.50,
                      height: size.height * 0.10,
                      child: Text(
                        movies.originalTitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                )),
          );
        });
  }
}

class _GridResults extends StatelessWidget {
  const _GridResults({
    Key? key,
    required this.size,
    required this.searchedMovies,
  }) : super(key: key);

  final Size size;
  final List<Movie> searchedMovies;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: searchedMovies.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (_, index) {
          final movies = searchedMovies[index];
          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'detailsPage', arguments: movies),
            child: Container(
              margin: const EdgeInsets.all(5.0),
              height: size.height * 0.25,
              child: FadeInImage(
                fit: BoxFit.cover,
                image: NetworkImage(movies.fullImage),
                placeholder: const AssetImage('assets/gif/loading-blocks.gif'),
              ),
            ),
          );
        });
  }
}
