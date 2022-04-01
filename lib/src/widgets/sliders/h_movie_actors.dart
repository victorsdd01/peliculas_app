import 'package:flutter/material.dart';

class MovieActors extends StatefulWidget {
  const MovieActors({
    Key? key, 
    required this.size, 
    this.color
    }) : super(key: key);
  @override
  State<MovieActors> createState() => _MovieActorsState();

  final Size size;
  final Color? color;
}

class _MovieActorsState extends State<MovieActors> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      width: widget.size.width,
      height: widget.size.height*0.30 ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text('Reparto', 
          //textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 20,
            color: widget.color ?? Colors.red,
            ),
          ),
          SizedBox(
            width: widget.size.width,
            height: widget.size.height*0.3,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (_, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: widget.size.height*0.28,
                    width: widget.size.width*0.40,
                    margin: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color:  Colors.blue,
                          ),
                          width: widget.size.width,
                          height: widget.size.height *0.25,
                          child: const FadeInImage(
                            placeholderFit: BoxFit.cover,
                            fit: BoxFit.cover,
                            image: NetworkImage('https://image.tmdb.org/t/p/original/A4jt7Gqa7dRT2ZIo3hNHc4esw3d.jpg'), 
                            placeholder: AssetImage('assets/gif/loading-blocks.gif'),
                          ),
                        ),
                         Text('nombre',style: TextStyle(
                          color: widget.color ?? Colors.red
                         ),
                         maxLines: 1,
                         overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
          
        ],
      ),
    );
  }
}
