
import 'package:peliculas_app/src/pages/pages.dart';

class CardSwiper extends StatelessWidget {
   
  const CardSwiper({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
        color:Colors.black87,
        height: size.height/2,
        width: double.infinity,
        child: Swiper(
          itemCount: 5,
          layout: SwiperLayout.STACK,
          itemWidth: size.width*0.5,
          itemHeight: size.height*0.45,
          itemBuilder:(_,index)=> GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'detailsPage', arguments:''),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child:  const FadeInImage(
               placeholder:  AssetImage('assets/gif/loading-colour.gif'), 
               image: NetworkImage('https://via.placeholder.com/300x400'),
               fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
  }
}