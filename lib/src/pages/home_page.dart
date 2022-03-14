import 'pages.dart';

class HomePage extends StatelessWidget {
   
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas'),
        leading: IconButton(icon: const Icon(Icons.search), onPressed: () { },)
      ),
      body:Container(
        color: Colors.red,
        child: Column(
          children: const <Widget> [
             CardSwiper(),
             //SliderHorizontal....
                        
          ],
        ),
      )
    );
  }




}

