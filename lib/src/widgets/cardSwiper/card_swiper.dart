import 'package:peliculas_app/src/models/movie.dart';
import 'package:peliculas_app/src/pages/pages.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key, required this.movies}) : super(key: key);

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      //color:Colors.black87,
      height: size.height / 2,
      width: double.infinity,
      child: Swiper(
          itemCount: movies.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.5,
          itemHeight: size.height * 0.45,
          itemBuilder: (_, index) {
            final movie = movies[index];
            
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'detailsPage',
                  arguments: 'movie-instance'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child:  FadeInImage(
                  placeholder: const AssetImage('assets/gif/loading-colour.gif'),
                  image: NetworkImage(movie.fullImage),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
    );
  }
}
