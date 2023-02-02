import 'package:flutter/material.dart';
import 'package:flutter_netflex/model/model_movie.dart';
import 'package:flutter_netflex/widget/box_slider.dart';
import 'package:flutter_netflex/widget/carousel_slider.dart';
import 'package:flutter_netflex/widget/circle_slider.dart';


class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  List<Movie> movies = [
    Movie.fromMap({
      'title' : '영구와 땡칠이',
      'keyword' : '코믹/판타지/고전',
      'poster' : 'ygddengcilE.jpg',
      'like' : false
    }),
    Movie.fromMap({
      'title' : '영구 홀로 집에',
      'keyword' : '코믹/판타지/고전',
      'poster' : 'yghouseAlone.jpg',
      'like' : false
    }),
    Movie.fromMap({
      'title' : '영구 소림사가다',
      'keyword' : '코믹/판타지/고전',
      'poster' : 'ygSorimsa.jpg',
      'like' : false
    }),
    Movie.fromMap({
      'title' : '영구와 우주괴물 불괴리',
      'keyword' : '코믹/판타지/고전',
      'poster' : 'younggu.jpg',
      'like' : false
    }),
    Movie.fromMap({
      'title' : '영구 람보',
      'keyword' : '코믹/판타지/고전',
      'poster' : 'youngguRambo.jpg',
      'like' : false
    })
  ];

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Stack(
          children: [
            CarouselImage(movies: movies,),
            TopBar(),
          ],
        ),
        CircleSlider(movies: movies),
        BoxSlider(movies: movies)
      ],
    );
  }
}

class TopBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            'assets/images/netflix.png',
            fit: BoxFit.contain,
            height: 50,
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              'TV 프로그램',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '영화',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '내가 찜한 콘텐츠',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      )
    );
  }
}
