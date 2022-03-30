import 'package:peliculas_app/src/models/models.dart';

import '../../pages/pages.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({Key? key, required this.pMovies}) : super(key: key);

  final List<PopularMovies> pMovies;

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
            MoviePosters(
              size: size,
              color: whiteColor,
              movies: pMovies,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Text('Mas vistas',
                  style: TextStyle(fontSize: 20, color: whiteColor)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: MoviePosters(
                size: size,
                color: whiteColor,
                movies: pMovies,
              ),
            )
          ],
        ));
  }
}

class MoviePosters extends StatelessWidget {
  const MoviePosters({
    Key? key,
    required this.size,
    this.color,
    required this.movies,
  }) : super(key: key);

  final Size size;
  final Color? color;
  final List<PopularMovies> movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: size.width,
          height: size.height * 0.30,
          //color: Colors.red,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (_, int index) {
              final popularMovies = movies[index];

              return Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'detailsPage',
                        arguments: 'movie-instance 2'),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        //color: Colors.amber
                      ),
                      width: 110,
                      margin: const EdgeInsets.only(
                          right: 20, top: 10.0, bottom: 10.0),
                      child:  FadeInImage(
                          image: NetworkImage(popularMovies.fullUrl),
                          placeholder: const AssetImage('assets/images/video-camera.png'),
                          //fadeInDuration: Duration(milliseconds: 2500),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    //color: Colors.amber,
                    margin: const EdgeInsets.only(right: 20, bottom: 5.0),
                    width: size.width * 0.25,
                    child: Text(popularMovies.title,
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
