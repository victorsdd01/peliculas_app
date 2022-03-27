import 'package:peliculas_app/src/providers/movie_provider.dart';
import 'package:provider/provider.dart';

import 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 32, 32, 32),
        appBar: AppBar(
            title: const Text('Peliculas'),
            leading: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            )),
        body: SingleChildScrollView(
          child: Column(
            children:  <Widget>[
              // vertical Swiper...
              CardSwiper(movies: moviesProvider.onDisplaymovies,),
              // horizontal slider...
              const MovieSlider(),
            ],
          ),
        ));
  }
}
