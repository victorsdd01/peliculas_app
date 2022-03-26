
import 'package:peliculas_app/src/pages/pages.dart';


class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
         child:SizedBox(
           width: double.infinity,
           height: 350,
           child:Lottie.asset('assets/json/error.json')
         ),
      ),
    );
  }
}