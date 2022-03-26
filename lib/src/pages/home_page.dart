
import 'pages.dart';

class HomePage extends StatelessWidget {
   
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    //final size = MediaQuery.of(context).size;

    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 32),
      appBar: AppBar(
        title: const Text('Peliculas'),
        leading: IconButton(icon: const Icon(Icons.search), onPressed: () {},)
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            // vertical Swiper...
             CardSwiper(),
            // horizontal slider...
             MovieSlider(), 
          ],
        ),
      )
      
    );
  }




}

