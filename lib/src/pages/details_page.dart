import 'package:peliculas_app/src/models/arguments/arguments.dart';
import 'package:peliculas_app/src/pages/pages.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(slivers: [
        _SliverAppBar(
          size: size,
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
                        _MovieTitle(size: size),
                        _MovieCategory(size: size),
                        const SizedBox(
                          height: 30,
                        ),
                        _MovieDesription(
                          size: size,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          //color: Colors.blueAccent,
                          width: size.width,
                          child: const Text(
                            'Mas contenido como este',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                        _SimilarMovies(size: size)
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

class _SimilarMovies extends StatelessWidget {
  const _SimilarMovies({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10.0),
        width: size.width,
        height: size.height * 0.25,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                width: size.width * 0.35,
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.all(10),
                child: const FadeInImage(
                  image: NetworkImage('https://via.placeholder.com/300x400'),
                  placeholder: AssetImage('assets/gif/loading-colour.gif'),
                  fit: BoxFit.cover,
                ))));
  }
}

class _MovieDesription extends StatelessWidget {
  const _MovieDesription({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: const Text(
        'Lorem irure aliquip reprehenderit occaecat esse aliqua fugiat officia elit dolor elit dolor aliquip. Duis fugiat labore dolore minim ut sunt do ex irure enim ex ea nostrud excepteur. In amet officia ad pariatur ut incididunt nostrud.',
        style: TextStyle(color: Colors.white, fontSize: 20),
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
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.05,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: size.width / 5,
            child: const Text('2HR 10MIN',
                style: TextStyle(fontSize: 15, color: Colors.white),
                textAlign: TextAlign.center),
          ),
          SizedBox(
            width: size.width / 5,
            child: const Text('13+',
                style: TextStyle(fontSize: 15, color: Colors.white),
                textAlign: TextAlign.center),
          ),
          SizedBox(
            width: size.width / 5,
            child: const Text('2013',
                style: TextStyle(fontSize: 15, color: Colors.white),
                textAlign: TextAlign.center),
          ),
          SizedBox(
            width: size.width / 5,
            child: const Text('HD',
                style: TextStyle(fontSize: 15, color: Colors.white),
                textAlign: TextAlign.center),
          ),
          SizedBox(
            width: size.width / 5,
            child: const Text('5.1',
                style: TextStyle(fontSize: 15, color: Colors.white),
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
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    
    return Container(
        color: Colors.black,
        width: size.width,
        height: size.height * 0.06,
        child: Text('movie.title',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 30, color: Colors.white)));
  }
}

class _SliverAppBar extends StatelessWidget {
  const _SliverAppBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: size.height * 0.6,
      pinned: true,
      //title:const  Text('batman'),
      backgroundColor: AppThemes.transparentColor,
      flexibleSpace: const FlexibleSpaceBar(
          background: FadeInImage(
        fit: BoxFit.cover,
        placeholder: AssetImage('assets/gif/loading-colour.gif'),
        image: NetworkImage('https://cdn.wallpapersafari.com/63/91/EGjUcK.jpg'),
      )),
    );
  }
}
