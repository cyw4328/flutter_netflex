import 'package:flutter/material.dart';
import 'package:flutter_netflex/model/model_movie.dart';
import 'package:flutter_netflex/screen/detail_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselImage extends StatefulWidget {
  final List<Movie> movies;

  CarouselImage({required this.movies});
  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  late List<Movie> movies;
  late List<Widget> images;
  late List<String> keywords;
  late List<bool> likes;
  late int _currentPage = 0;
  late String _currentKeyword;

  @override
  void initState(){
    super.initState();
    movies = widget.movies;
    images = movies.map((e) => Image.asset('./assets/images/${e.poster}',)).toList();
    keywords = movies.map((e) => e.keyword).toList();
    likes = movies.map((e) => e.like).toList();
    _currentKeyword = keywords[0];
  }

  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(30),
          ),
          Container(
            // child: Image.asset('assets/images/younggu.jpg'),
            child: CarouselSlider(
                items: images,
                options: CarouselOptions(
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentPage = index;
                      _currentKeyword = keywords[_currentPage];
                    });
                  },
                  height: 300
                )
            ),
            height: 300,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
            child: Text(_currentKeyword,style: TextStyle(fontSize: 13)),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      likes[_currentPage]
                      ? IconButton(onPressed: (){}, icon: Icon(Icons.check))
                      : IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                      Text('내가 찜한 콘텐츠',style: TextStyle(fontSize: 11),)
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xffFAF7F7FF))),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                        ),
                        Padding(padding: EdgeInsets.all(3)),
                        Text(
                          '재생',
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  )
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Column(
                    children: <Widget>[
                      IconButton(
                          onPressed: (){
                            Navigator.of(context).push(
                              MaterialPageRoute<Null>(
                                fullscreenDialog: true,
                                builder: (BuildContext context){
                                  return DetailScreen(
                                    movie: movies[_currentPage],
                                  );
                                }
                              )
                            );
                          },
                          icon: Icon(Icons.info)),
                      Text('정보',style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: makeIndicator(likes, _currentPage),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeIndicator(List list,int _currentPage){
  List<Widget> results =[];
  for (var i = 0; i<list.length;i++){
    results.add(
      Container(
        width: 8,
        height: 8,
        margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 2.0),
        decoration: BoxDecoration(shape: BoxShape.circle,color: _currentPage == i ? Color.fromRGBO(255, 255, 255, 0.9): Color.fromRGBO(255, 255, 255, 0.4))
      )
    );
  }
  return results;
}
