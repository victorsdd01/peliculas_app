
import '../../pages/pages.dart';

import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
   
  const MovieSlider({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final size= MediaQuery.of(context).size;

    return Expanded(
      child: Container(
        width: double.infinity,
        height: size.height* 1,
        color: Colors.amber,
      )
    );
  }
}