

import 'package:peliculas_app/src/providers/providers.dart';
import 'src/pages/pages.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => MoviesProvider(),lazy: false,),
        ChangeNotifierProvider(create: ( _ ) => ActorsProvider(),lazy: false,),
      ],
      child:const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peliculas',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      initialRoute: 'home',
      routes: {
        'home'       : (_) => const HomePage(),
        'detailsPage': (_) => const DetailsPage(),
      },
    );
  }
}
