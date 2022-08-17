import 'dart:convert';


import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotstarui/Widgets/texttitle.dart';
import 'package:hotstarui/controler/moviecontroler.dart';
import 'package:http/http.dart' as http;
import '../Widgets/addClass.dart';
import '../Widgets/caroselclass.dart';
import '../Widgets/designWithText.dart';

import '../controler/moviecontrolercomedy.dart';
import '../seemorescreen.dart';

class SportsScreen extends StatefulWidget
{
  @override
  State<SportsScreen> createState() => _SportsScreenState();
}

class _SportsScreenState extends State<SportsScreen> {

  var baseurl='https://image.tmdb.org/t/p/original';
  late Map mapresponsetv;
  List listrespomnsetv=[];
  final MovieControlerComedy movieControlerComedy=Get.put(MovieControlerComedy());
  final Moviecontroller moviecontroller=Get.put(Moviecontroller());

  fetchdatatv() async
  {
    http.Response response;
    response= await http.get(Uri.parse('https://api.themoviedb.org/3/discover/movie?api_key=b446989950f59feffb9d1867bccc84d0&with_genres=35'));
    if(response.statusCode==200) {
      setState(() {
        mapresponsetv = jsonDecode(response.body);
        listrespomnsetv = mapresponsetv['results'];//print();
      });
    }
  }
  @override
  void initState() {
    fetchdatatv();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width*1,
          height: MediaQuery.of(context).size.height*0.23,
          //color: Colors.green,
          child: Image.asset(
            'assets/images/dream.png',
            fit: BoxFit.cover,
          ),
        ),
        Caroselclass(listrespomnsetv,baseurl),
        ads(),
        popularSports(),
        Texttitle(title: 'TATA IPL:Highlights'),
        tataIplHighlights(),
        Texttitle(title: 'Tata IPL'),
        tatIpl(),
        Texttitle(title: 'HOTM BY TATA NEU'),
        hotmbyTata(),
        Texttitle(title: 'Fall Of Wickets By Cred'),
        fallOfWickets(),
        Texttitle(title: 'TATA IPL:TOP KNOCKS'),
        topknocks(),
        Texttitle(title: 'Top Spells by Car Deko'),
        carDeko(),
        Texttitle(title: 'TATA IPL:Game-Changing Moments'),
        gameChanging(),

      ],
    ),
  );
  }

  Widget gameChanging()
  {
    return Container(

      // width: MediaQuery.of(context).size.width*1,
      height: MediaQuery.of(context).size.height*0.15,
      //color: Colors.blue,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height*0.02,
          bottom: MediaQuery.of(context).size.height*0.02
      ),
      child: ListView.builder(
   reverse: true,
        scrollDirection: Axis.horizontal,
        itemCount: moviecontroller.fetchMovie.value!.results!.length,
        itemBuilder: (BuildContext context, int index){
          return  DesignWithText(
              moviecontroller.fetchMovie.value!.results![index].backdropPath.toString(),
              moviecontroller.fetchMovie.value!.results![index].originalTitle,
              baseurl);
        },
      ),
    );

  }

  Widget carDeko()
  {
    return Container(

      // width: MediaQuery.of(context).size.width*1,
      height: MediaQuery.of(context).size.height*0.15,
      //color: Colors.blue,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height*0.02,
          bottom: MediaQuery.of(context).size.height*0.02
      ),
      child: ListView.builder(

        scrollDirection: Axis.horizontal,
        itemCount: moviecontroller.fetchMovie.value!.results!.length,
        itemBuilder: (BuildContext context, int index){
          return  DesignWithText(
              moviecontroller.fetchMovie.value!.results![index].backdropPath.toString(),
              moviecontroller.fetchMovie.value!.results![index].originalTitle,
              baseurl);
        },
      ),
    );

  }

  Widget topknocks()
  {

    return Container(

      // width: MediaQuery.of(context).size.width*1,
      height: MediaQuery.of(context).size.height*0.15,
      //color: Colors.blue,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height*0.02,
          bottom: MediaQuery.of(context).size.height*0.02
      ),
      child: ListView.builder(
        reverse: true,

        scrollDirection: Axis.horizontal,
        itemCount: moviecontroller.fetchMovie.value!.results!.length,
        itemBuilder: (BuildContext context, int index){
          return  DesignWithText(
              moviecontroller.fetchMovie.value!.results![index].backdropPath.toString(),
              moviecontroller.fetchMovie.value!.results![index].originalTitle,
              baseurl);
        },
      ),
    );
  }

  Widget fallOfWickets()
  {
    return Container(

    // width: MediaQuery.of(context).size.width*1,
    height: MediaQuery.of(context).size.height*0.15,
    //color: Colors.blue,
    margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height*0.02,
        bottom: MediaQuery.of(context).size.height*0.02
    ),
    child: ListView.builder(

      scrollDirection: Axis.horizontal,
      itemCount: moviecontroller.fetchMovie.value!.results!.length,
      itemBuilder: (BuildContext context, int index){
        return  DesignWithText(
            moviecontroller.fetchMovie.value!.results![index].backdropPath.toString(),
            moviecontroller.fetchMovie.value!.results![index].originalTitle,
            baseurl);
      },
    ),
  );


  }

  Widget hotmbyTata()
  {
    return Container(

      // width: MediaQuery.of(context).size.width*1,
      height: MediaQuery.of(context).size.height*0.15,
      //color: Colors.blue,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height*0.02,
          bottom: MediaQuery.of(context).size.height*0.02
      ),
      child: ListView.builder(
reverse: true,
        scrollDirection: Axis.horizontal,
        itemCount: moviecontroller.fetchMovie.value!.results!.length,
        itemBuilder: (BuildContext context, int index){
          return  DesignWithText(
              moviecontroller.fetchMovie.value!.results![index].posterPath.toString(),
              moviecontroller.fetchMovie.value!.results![index].title,
              baseurl);
        },
      ),
    );

  }

  Widget tatIpl()
  {
    return Container(

      // width: MediaQuery.of(context).size.width*1,
      height: MediaQuery.of(context).size.height*0.15,
      //color: Colors.blue,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height*0.02,
          bottom: MediaQuery.of(context).size.height*0.02
      ),
      child: ListView.builder(
        reverse: true,
        scrollDirection: Axis.horizontal,
        itemCount: moviecontroller.fetchMovie.value!.results!.length,
        itemBuilder: (BuildContext context, int index){
          return  DesignWithText(
              moviecontroller.fetchMovie.value!.results![index].posterPath.toString(),
              moviecontroller.fetchMovie.value!.results![index].title,
              baseurl);
        },
      ),

    );
  }



  Widget tataIplHighlights()
  {
    return Container(
      // width: MediaQuery.of(context).size.width*1,
      height: MediaQuery.of(context).size.height*0.15,
      //color: Colors.blue,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height*0.02,
          bottom: MediaQuery.of(context).size.height*0.02
      ),
      child: ListView.builder(
        reverse: true,
        scrollDirection: Axis.horizontal,
        itemCount: moviecontroller.fetchMovie.value!.results!.length,
        itemBuilder: (BuildContext context, int index){
          return  DesignWithText(
            moviecontroller.fetchMovie.value!.results![index].backdropPath.toString(),
              moviecontroller.fetchMovie.value!.results![index].title,
          baseurl);
        },
      ),

    );
  }
  Widget popularSports()
  {

    var names=[
      'CRICKET',
      'FOOTBALL',
      'FORMULA1',
      'HOCKEY',
      'KABADI',
      'TENNIS',
      'AMERICAN FOOTBALL',
      'MARTIAL ARTS',
    ];
    var imageurl=[
      "assets/images/cricket.jpg",
      "assets/images/football.jpg",
      "assets/images/formula1.jpg",
      "assets/images/hockey.jpg",
      "assets/images/kabadi.gif",
      "assets/images/tennis.jpg",
      "assets/images/americanfootball.jpg",
      "assets/images/martialarts.jpeg"
    ];

    return Container(
      width: MediaQuery.of(context).size.width*1,
      height: MediaQuery.of(context).size.height*0.15,
      //color: Colors.blue,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height*0.02,
        bottom: MediaQuery.of(context).size.width*0.02,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageurl.length,
        itemBuilder: (BuildContext context, int index)
        {
          return InkWell(
            onTap: ()
            {
              Get.to( SeeMoreScreen(
                titleapp:names[index],
                length:moviecontroller.fetchMovie.value!.results!.length,
                baseurl: baseurl,
                imageurl: moviecontroller.fetchMovie.value!,
                title: moviecontroller.fetchMovie.value!,
                rating:  moviecontroller.fetchMovie.value!,
                overview:  moviecontroller.fetchMovie.value!,
                relasedate:  moviecontroller.fetchMovie.value!,
              ));
            },
            child: Stack(

              children:[
                Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width*0.02
                ),
                width: MediaQuery.of(context).size.width* 0.47,
                height: MediaQuery.of(context).size.height*1,
                color: Colors.green,
                child: Image.asset(imageurl[index],
                fit: BoxFit.cover,
                ),
              ),
                Positioned(
                    child:Container(
                        width: MediaQuery.of(context).size.width* 0.50,
                        height: MediaQuery.of(context).size.height*1,

                        decoration: BoxDecoration(
                        color: Colors.black54
                      ),

                    )
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height*0.06,
               left: MediaQuery.of(context).size.width*0.15,
                child: Text(
                    names[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                      fontSize: 22,
                    fontWeight: FontWeight.bold,
                  //  letterSpacing: 1
                  ),
                  //textAlign:TextAlign.center
                ),
              )
            ]
            ),
          );
        },
      ),

    );
  }
  Widget ads()
  {
    return Container(
      width: MediaQuery.of(context).size.width*1,
      height: MediaQuery.of(context).size.height*0.10,
      decoration: BoxDecoration(
        //color: Colors.blue,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: CarouselSlider.builder(
          itemCount: movieControlerComedy.fetchmoviecomedy.value!.results!.length,
          itemBuilder: (BuildContext context, int index, _)
          {
            return  AddClass(baseurl+movieControlerComedy.fetchmoviecomedy.value!.results![index].posterPath.toString());
          },
          options:CarouselOptions(
            enableInfiniteScroll: false,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayCurve: Curves.easeInCirc
          ),
        ),
      ),
    );
  }
}

