import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'movie_detail.dart';

class MoviesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MoviesListState();
  }
}

class MoviesListState extends State<MoviesList> {
  var movies;
  Color mainColor = const Color(0xff3C3261);

  void getData() async {
    var data = await getJson();

    setState(() {
      movies = data['results'];
    });
  }

  /*@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
*/
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    getData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.3,
        centerTitle: true,
        title: Text('Movies', style: TextStyle(color: mainColor, fontSize: 24, fontWeight: FontWeight.bold),),
        leading: Icon(Icons.arrow_back, color: mainColor,),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Icon(Icons.menu, color: mainColor,),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          TopRatedWord(),
          Expanded(
            child: ListView.builder(
                itemCount: movies == null ? 0 : movies.length,
                itemBuilder: (context, index) {
                  return FlatButton(
                    child: FlatButtonContents(movies, index),
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) {
                        return MovieDetail(movies[index]);
                      }));
                      //color: Colors.white,

                    });

                  //FlatButton(
                  //child:FlatBattonContents(movies, index));
                }),
          )
        ],
      ),
    );
  }
}

class TopRatedWord extends StatelessWidget {
  Color mainColor = const Color(0xff3C3261);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        child: Text(
          'Top Rated',
          style: TextStyle(
              fontSize: 40,
              color: mainColor,
              fontFamily: 'Arvo',
              fontWeight: FontWeight.bold),
        ));
  }
}

Future<Map> getJson() async {
  var url =
      'http://api.themoviedb.org/3/discover/movie?api_key=310e2ef8d44e911293fa5437f251d6c3';
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

class FlatButtonContents extends StatelessWidget {
  final movies;
  final index;
  Color mainColor = const Color(0xff3C3261);
  var image_url = 'https://image.tmdb.org/t/p/w500/';

  FlatButtonContents(this.movies, this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(16.0),
              child: Container(
                width: 70.0,
                height: 70.0,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        NetworkImage(image_url + movies[index]['poster_path']),
                    fit: BoxFit.cover),

                borderRadius: BorderRadius.circular(10.0),
                //color: Colors.grey,

                boxShadow: [
                  BoxShadow(
                      color: mainColor,
                      blurRadius: 5.0,
                      offset: new Offset(2.0, 5.0))
                ],
              ),
            ),
            Expanded(
                child: Container(
              margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                children: [
                  Text(
                    movies[index]['title'],
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Arvo',
                        fontWeight: FontWeight.bold,
                        color: mainColor),
                  ),
                  Padding(padding: const EdgeInsets.all(2.0)),
                  Text(
                    movies[index]['overview'],
                    maxLines: 3,
                    style: TextStyle(
                        color: const Color(0xff8785A4), fontFamily: 'Arvo'),
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            )),
          ],
        ),
        Container(
          width: 300.0,
          height: 0.5,
          color: const Color(0xD2D2E1ff),
          margin: const EdgeInsets.all(16.0),
        )
      ],
    );
  }
}
