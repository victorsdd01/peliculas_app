// ignore_for_file: use_key_in_widget_constructors

import 'package:peliculas_app/src/providers/movie_provider.dart';
import 'package:provider/provider.dart';
import 'src/pages/pages.dart';

void main() {
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ )=>MoviesProvider(),lazy: false,),
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
        'home': (_) => const HomePage(),
        'detailsPage': (_) => const DetailsPage(),
      },
    );
  }
}
