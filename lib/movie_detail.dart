import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'movies_list.dart';

class MovieDetail extends StatelessWidget {
  var movie;
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  Color mainColor = const Color(0xff3C3261);

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.network(
          image_url + movie['poster_path'],
          fit: BoxFit.cover,
        ),
        BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 0.5, sigmaY: 5.0),
          child: Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 0.0),
                  child: Container(
                    width: 400,
                    height: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: NetworkImage(image_url + movie['poster_path']),
                          fit: BoxFit.cover),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 20.0,
                            offset: Offset(0.0, 10.0))
                      ])),
                ),),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      movie['title'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    )),
                    Text(
                      '${movie['vote_average']}/10',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
              child: Text(
                movie['overview'],
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 24, 16.0, 16.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: 150,
                      height: 60,
                      child: Center(
                        child: Text(
                          'Rate Movie',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: mainColor
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 0.0),
                    child: Container(
                      width: 60,
                      height: 60,
                      child: Icon(Icons.share, color: Colors.white,),
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    child: Icon(Icons.bookmark, color: Colors.white,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: mainColor
                    ),
                  )
                ],
              ),
            )
          ]),
        )
      ],
    ));
  }
}
