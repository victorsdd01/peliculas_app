
import '../../pages/pages.dart';
class MovieSlider extends StatelessWidget {
   
  const MovieSlider({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final size= MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height* 1,
      color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Text('populares'),
          )
        ],
      )
    );
  }
}