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
        cancelButton(query)
      else
        searchButton(query)
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Center(
      child: IconButton(
        icon: const Icon(
          Icons.keyboard_arrow_left,
          size: 30.0,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
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
            return const Center(child: Text('No se encontraron resultados'));
          } else {
            return _GridResults(size: size, searchedMovies: searchedMovies,);
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('build suggestions: $query');
  }

  Center cancelButton(query) {
    return Center(
      child: IconButton(
        icon: const Icon(Icons.cancel),
        onPressed: () {},
      ),
    );
  }

  Center searchButton(query) {
    return const Center(child: Icon(Icons.search));
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
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, index) {
          final movies = searchedMovies[index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'detailsPage',arguments:movies),
            child: Container(
                margin: const EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      height: size.height * 0.20,
                      child: FadeInImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(movies.fullImage),
                        placeholder: const AssetImage('assets/gif/loading-blocks.gif'),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 20,
                      child:  Text(
                        movies.originalTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
          );
        });
  }
}
