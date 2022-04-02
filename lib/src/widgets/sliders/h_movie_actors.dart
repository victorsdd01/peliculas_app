import 'package:flutter/material.dart';
import '../../models/models.dart';

class MovieActors extends StatefulWidget {
  const MovieActors(
      {Key? key,
      required this.size,
      this.color,
      required this.actors,
      required this.getActors})
      : super(key: key);
  @override
  State<MovieActors> createState() => _MovieActorsState();

  final Size size;
  final Color? color;
  final List<Actors> actors;
  final Function getActors;
}

class _MovieActorsState extends State<MovieActors> {
  @override
  void initState() {
    widget.getActors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //color: Colors.amber,
      width: widget.size.width,
      height: widget.size.height * 0.30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom:10.0),
            child: Text(
              'Reparto',
              //textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
                color: widget.color ?? Colors.red,
              ),
            ),
          ),
          SizedBox(
            width: widget.size.width,
            height: widget.size.height * 0.3,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.actors.length,
                itemBuilder: (_, index) {

                  final movieActors = widget.actors[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: widget.size.height * 0.28,
                        width: widget.size.width * 0.40,
                        margin: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              width: widget.size.width,
                              height: widget.size.height * 0.25,
                              child:  FadeInImage(
                                placeholderFit: BoxFit.cover,
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  movieActors.fullActorImage
                                ),
                                placeholder:
                                    const AssetImage('assets/gif/loading-blocks.gif'),
                              ),
                            ),
                            Text(
                              movieActors.originalName,
                              style:
                                  TextStyle(color: widget.color ?? Colors.red),
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
