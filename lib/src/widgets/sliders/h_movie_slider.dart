import '../../pages/pages.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0)),
            color: Colors.blueGrey[100]),
        width: double.infinity,
        height: size.height * 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                'populares',
                style: TextStyle(fontSize: 20),
              ),
            ),
            _moviePosters(size: size),
          ],
        ));
  }
}

class _moviePosters extends StatelessWidget {
  const _moviePosters({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.20,
      //color: Colors.red[200],
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 21,
        itemBuilder: (_, int index) => Column(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
              ),
              width: 110,
              margin: const EdgeInsets.only(right: 20, top: 10.0, bottom: 10.0),
              child: const FadeInImage(
                  image: NetworkImage('https://via.placeholder.com/300x400'),
                  placeholder: AssetImage('assets/images/video-camera.png'),
                  fadeInDuration: Duration(milliseconds: 2500),
                  fit: BoxFit.cover),
            ),
            const Text('movie name')
          ],
        ),
      ),
    );
  }
}
