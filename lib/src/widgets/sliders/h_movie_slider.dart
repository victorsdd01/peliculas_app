// ignore_for_file: non_constant_identifier_names
import 'package:peliculas_app/src/models/models.dart';
import '../../pages/pages.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({
    Key? key,
    required this.popularMovies,
    required this.mostViewedMovies, 
    required this.onNextPage,
  }) : super(key: key);

  final List<Movie> popularMovies;
  final List<Movie> mostViewedMovies;
  final Function onNextPage;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    const color = Color.fromARGB(255, 24, 24, 24);
    const whiteColor = AppThemes.white;

    return Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0)),
            color: color),
        width: double.infinity,
        height: size.height * 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                'populares',
                style: TextStyle(fontSize: 20, color: whiteColor),
              ),
            ),
            PopularMovies(
              size: size,
              color: whiteColor,
              movies: popularMovies,
              onNextPage: onNextPage,
            ),

            // aqui van las peliculas mas vistas!!!
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Text('Mas vistas',
                  style: TextStyle(fontSize: 20, color: whiteColor)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: MostViewedMovies(
                size: size,
                mostViewedMovies: mostViewedMovies,
                color: whiteColor,
              ),
            )
          ],
        ));
  }
}

class PopularMovies extends StatefulWidget {
  const PopularMovies({
    Key? key,
    required this.size,
    this.color,
    required this.movies,
    required this.onNextPage,
  }) : super(key: key);

  final Size size;
  final Color? color;
  final List<Movie> movies;
  final Function onNextPage;

  @override
  State<PopularMovies> createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.position.pixels >= controller.position.maxScrollExtent-500) {
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: widget.size.width,
          height: widget.size.height * 0.30,
          child: ListView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemCount: widget.movies.length,
            itemBuilder: (_, int index) {
              final popularMovies = widget.movies[index];

              return Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'detailsPage',
                        arguments: popularMovies
                    ),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        //color: Colors.amber
                      ),
                      width: 110,
                      margin: const EdgeInsets.only(
                          right: 20, top: 10.0, bottom: 10.0),
                      child: FadeInImage(
                          image: NetworkImage(popularMovies.fullImage),
                          placeholder: const AssetImage(
                              'assets/gif/loading-blocks.gif'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    margin: const EdgeInsets.only(right: 20, bottom: 5.0),
                    width: widget.size.width * 0.25,
                    child: Text(
                      popularMovies.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(color: widget.color),
                    ),
                  ))
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class MostViewedMovies extends StatelessWidget {
  const MostViewedMovies({
    Key? key,
    required this.size,
    this.color,
    required this.mostViewedMovies,
  }) : super(key: key);

  final Size size;
  final Color? color;
  final List<Movie> mostViewedMovies;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: size.width,
          height: size.height * 0.30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: mostViewedMovies.length,
            itemBuilder: (_, int index) {
              final MostViewedMovies = mostViewedMovies[index];
              return Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'detailsPage',
                        arguments: mostViewedMovies
                    ),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        //color: Colors.amber
                      ),
                      width: 110,
                      margin: const EdgeInsets.only(
                          right: 20, top: 10.0, bottom: 10.0),
                      child: FadeInImage(
                          image: NetworkImage(MostViewedMovies.fullImage),
                          placeholder: const AssetImage(
                              'assets/images/video-camera.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    margin: const EdgeInsets.only(right: 20, bottom: 5.0),
                    width: size.width * 0.25,
                    child: Text(
                      MostViewedMovies.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(color: color),
                    ),
                  ))
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
