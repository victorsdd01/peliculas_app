import 'package:peliculas_app/src/pages/pages.dart';
import '../models/models.dart';
import '../providers/providers.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    final lastId = movie.id;

    final movieProvider = Provider.of<MoviesProvider>(context);

    final Color color = AppThemes.white;

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(slivers: [
        _SliverAppBar(
          size: size,
          movie: movie,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    width: size.width,
                    height: size.height,
                    child: Column(
                      children: <Widget>[
                        _MovieTitle(
                          size: size,
                          movie: movie,
                        ),
                        _MovieCategory(
                          size: size,
                          movie: movie,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        _MovieDesription(
                          size: size,
                          movie: movie,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          //color: Colors.blueAccent,
                          width: size.width,
                          child: const Text(
                            'Mas contenido como este',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        SimilarMovies(
                          size: size,
                          movies: movieProvider.onRecomendedMovies,
                          getRecomendedMovies: () =>
                              movieProvider.getRecomendedMovies(lastId),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(child: MovieActors(size: size,color: color,))
                      ],
                    ),
                  ),
                ],
              )
            ],
          )
        ]))
      ]),
    );
  }
}

class _MovieDesription extends StatelessWidget {
  const _MovieDesription({
    Key? key,
    required this.size,
    required this.movie,
  }) : super(key: key);

  final Size size;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: Text(
        movie.overview,
        style: const TextStyle(color: Colors.white, fontSize: 15),
        overflow: TextOverflow.clip,
        maxLines: 6,
      ),
    );
  }
}

class _MovieCategory extends StatelessWidget {
  const _MovieCategory({
    Key? key,
    required this.size,
    required this.movie,
  }) : super(key: key);

  final Size size;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.03,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: size.width / 5,
            child: const Text('2HR 10MIN',
                style: TextStyle(fontSize: 12, color: Colors.white),
                textAlign: TextAlign.center),
          ),
          SizedBox(
            width: size.width / 5,
            child: const Text('13+',
                style: TextStyle(fontSize: 12, color: Colors.white),
                textAlign: TextAlign.center),
          ),
          SizedBox(
            width: size.width / 5,
            child: const Text('2013',
                style: TextStyle(fontSize: 12, color: Colors.white),
                textAlign: TextAlign.center),
          ),
          SizedBox(
            width: size.width / 5,
            child: const Text('HD',
                style: TextStyle(fontSize: 12, color: Colors.white),
                textAlign: TextAlign.center),
          ),
          SizedBox(
            width: size.width / 5,
            child: const Text('5.1',
                style: TextStyle(fontSize: 12, color: Colors.white),
                textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}

class _MovieTitle extends StatelessWidget {
  const _MovieTitle({
    Key? key,
    required this.size,
    required this.movie,
  }) : super(key: key);

  final Size size;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        width: size.width,
        height: size.height * 0.06,
        child: Text(movie.title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 25, color: Colors.white)));
  }
}

class _SliverAppBar extends StatelessWidget {
  const _SliverAppBar({
    Key? key,
    required this.size,
    required this.movie,
  }) : super(key: key);

  final Size size;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: size.height * 0.4,
      pinned: true,
      //title:const  Text('batman'),
      backgroundColor: AppThemes.transparentColor,
      flexibleSpace: FlexibleSpaceBar(
          background: FadeInImage(
        fit: BoxFit.cover,
        placeholder: const AssetImage('assets/gif/loading-blocks.gif'),
        image: NetworkImage(movie.fullBackdropPath),
      )),
    );
  }
}
