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
            _MoviePosters(size: size),
            const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child:  Text('Mas vistas', style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: _MoviePosters(size: size),
            )
          ],
        ));
  }
}

class _MoviePosters extends StatelessWidget {
  const _MoviePosters({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: size.width,
          height: size.height*0.30,
          //color: Colors.red,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 21,
            itemBuilder: (_, int index) => Column(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'detailsPage', arguments:''),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      //color: Colors.amber
                    ),
                    width: 110,
                    margin: const EdgeInsets.only(right: 20, top: 10.0, bottom: 10.0),
                    child: const FadeInImage(
                       image: NetworkImage('https://via.placeholder.com/300x400'),
                       placeholder: AssetImage('assets/images/video-camera.png'),
                       fadeInDuration: Duration(milliseconds: 2500),
                       fit: BoxFit.cover),
                  ),
                ),
                Expanded(
                  child:Container(
                    //color: Colors.amber,
                    margin: const EdgeInsets.only(right: 20,bottom: 5.0),
                    width: size.width*0.25,
                    child: const Text('Ut eiusmod ex esse sunt ad duis enim ad ex.',overflow: TextOverflow.ellipsis,maxLines: 2,),
                  )
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
