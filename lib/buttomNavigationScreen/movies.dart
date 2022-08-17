import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotstarui/buttomNavigationScreen/homeclass.dart';
import 'package:http/http.dart' as http;
import '../Widgets/caroselclass.dart';
import '../Widgets/moviedesign.dart';
import '../Widgets/texttitle.dart';
import '../controler/moviecontroler.dart';
import '../controler/moviecontrolertrending.dart';
import '../main.dart';

class Movies extends StatefulWidget
{
  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {

  var baseurl="https://image.tmdb.org/t/p/original";
  late Map mapresponsetv;
  List listrespomnsetv=[];
  Moviecontroller moviecontroller=Get.put(Moviecontroller());
  final MovieControlerTrending movieControlerTrending=Get.put(MovieControlerTrending());

  fetchdatatv() async
  {

    http.Response response;
    response= await http.get(Uri.parse('https://api.themoviedb.org/3/discover/movie?api_key=b446989950f59feffb9d1867bccc84d0&with_genres=35'));
    if(response.statusCode==200) {
      setState(() {
        mapresponsetv = jsonDecode(response.body);
        listrespomnsetv = mapresponsetv['results'];
        //print();
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
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyHomePage()), (route) => false);
        return true;
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                //      color: Colors.black
              ),
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.18,
              child: CachedNetworkImage(
                imageUrl:
                'https://www.crictracker.com/wp-content/uploads/2020/10/dream11-FINAL-FI-640x400-Match-25.png',
                fit: BoxFit.cover,
              ),
            ),
            Caroselclass(listrespomnsetv,baseurl),
            Texttitle(title: 'Drama Movie'),
            dramaMovie(),
            Texttitle(title: 'Because You Watched'),
            becauseYouWatched(),
            Texttitle(title: 'Comedy Movie'),
            comedyMovie(),
            Texttitle(title: 'Popular Movie'),
            popularMovie(),
            Texttitle(title: 'Dark Movie'),
            darkMovie(),
            Texttitle(title: 'Action Movie'),
            actionMovie(),
            Texttitle(title: 'Movie Related To Magic'),
            movietoMagic(),
            Texttitle(title: 'Exciting Police Drama'),
            excitingPoliceDrama(),
            Texttitle(title: 'Horror Movie'),
            horrorMovie(),


          ],
        ),
      ),
    );
  }

  Widget horrorMovie()
  {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height*0.02,
          vertical: MediaQuery.of(context).size.height*0.01
      ),
      height: MediaQuery.of(context).size.height*0.20,
      width: MediaQuery.of(context).size.width*1,
      child:ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: moviecontroller.fetchMovie.value!.results!.length,
        itemBuilder: (BuildContext context, int index) {
          int reverseIndex=moviecontroller.fetchMovie.value!.results!.length-1-index;
          return MovieDesign(
            baseurl: baseurl,
            imageurl: moviecontroller.fetchMovie.value!.results![index].backdropPath,
            title: moviecontroller.fetchMovie.value!.results![index].title,
            rating:  moviecontroller.fetchMovie.value!.results![index].voteAverage,
            overview:  moviecontroller.fetchMovie.value!.results![index].overview,
            relasedate:  moviecontroller.fetchMovie.value!.results![index].releaseDate,
            index1: index,
          );
        },

      ) ,
    );

  }
  Widget excitingPoliceDrama()
  {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height*0.02,
          vertical: MediaQuery.of(context).size.height*0.01
      ),
      height: MediaQuery.of(context).size.height*0.20,
      width: MediaQuery.of(context).size.width*1,
      child:ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: moviecontroller.fetchMovie.value!.results!.length,
        itemBuilder: (BuildContext context, int index) {
          return MovieDesign(
            baseurl: baseurl,
            imageurl: moviecontroller.fetchMovie.value!.results![index].backdropPath,
            title: moviecontroller.fetchMovie.value!.results![index].title,
            rating:  moviecontroller.fetchMovie.value!.results![index].voteAverage,
            overview:  moviecontroller.fetchMovie.value!.results![index].overview,
            relasedate:  moviecontroller.fetchMovie.value!.results![index].releaseDate,
            index1: index,
          );
        },

      ) ,
    );


  }
  Widget movietoMagic()
  {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height*0.02,
          vertical: MediaQuery.of(context).size.height*0.01
      ),
      height: MediaQuery.of(context).size.height*0.20,
      width: MediaQuery.of(context).size.width*1,
      child:ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: moviecontroller.fetchMovie.value!.results!.length,
        itemBuilder: (BuildContext context, int index) {

          int reverseIndex=moviecontroller.fetchMovie.value!.results!.length-1-index;
          return MovieDesign(
            baseurl: baseurl,
            imageurl: moviecontroller.fetchMovie.value!.results![index].backdropPath,
            title: moviecontroller.fetchMovie.value!.results![index].title,
            rating:  moviecontroller.fetchMovie.value!.results![index].voteAverage,
            overview:  moviecontroller.fetchMovie.value!.results![index].overview,
            relasedate:  moviecontroller.fetchMovie.value!.results![index].releaseDate,
            index1: index,
          );
        },

      ) ,
    );

  }
  Widget actionMovie()
  {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height*0.02,
          vertical: MediaQuery.of(context).size.height*0.01
      ),
      height: MediaQuery.of(context).size.height*0.20,
      width: MediaQuery.of(context).size.width*1,
      child:ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: moviecontroller.fetchMovie.value!.results!.length,
        itemBuilder: (BuildContext context, int index) {
          return MovieDesign(
            baseurl: baseurl,
            imageurl: moviecontroller.fetchMovie.value!.results![index].backdropPath,
            title: moviecontroller.fetchMovie.value!.results![index].title,
            rating:  moviecontroller.fetchMovie.value!.results![index].voteAverage,
            overview:  moviecontroller.fetchMovie.value!.results![index].overview,
            relasedate:  moviecontroller.fetchMovie.value!.results![index].releaseDate,
            index1: index,
          );
        },

      ) ,
    );
  }
  Widget darkMovie()
  {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height*0.02,
          vertical: MediaQuery.of(context).size.height*0.01
      ),
      height: MediaQuery.of(context).size.height*0.20,
      width: MediaQuery.of(context).size.width*1,
      child:ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: moviecontroller.fetchMovie.value!.results!.length,
        itemBuilder: (BuildContext context, int index) {
          return MovieDesign(
            baseurl: baseurl,
            imageurl: moviecontroller.fetchMovie.value!.results![index].backdropPath,
            title: moviecontroller.fetchMovie.value!.results![index].title,
            rating:  moviecontroller.fetchMovie.value!.results![index].voteAverage,
            overview:  moviecontroller.fetchMovie.value!.results![index].overview,
            relasedate:  moviecontroller.fetchMovie.value!.results![index].releaseDate,
            index1: index,
          );
        },

      ) ,
    );
  }
  Widget popularMovie()
  {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height*0.02,
          vertical: MediaQuery.of(context).size.height*0.01
      ),
      height: MediaQuery.of(context).size.height*0.20,
      width: MediaQuery.of(context).size.width*1,
      child:ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: moviecontroller.fetchMovie.value!.results!.length,
        itemBuilder: (BuildContext context, int index) {
          return MovieDesign(
            baseurl: baseurl,
            imageurl: moviecontroller.fetchMovie.value!.results![index].backdropPath,
            title: moviecontroller.fetchMovie.value!.results![index].title,
            rating:  moviecontroller.fetchMovie.value!.results![index].voteAverage,
            overview:  moviecontroller.fetchMovie.value!.results![index].overview,
            relasedate:  moviecontroller.fetchMovie.value!.results![index].releaseDate,
            index1: index,
          );
        },

      ) ,
    );
  }

  Widget comedyMovie()
  {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height*0.02,
          vertical: MediaQuery.of(context).size.height*0.01
      ),
      height: MediaQuery.of(context).size.height*0.20,
      width: MediaQuery.of(context).size.width*1,
      child:ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: moviecontroller.fetchMovie.value!.results!.length,
        itemBuilder: (BuildContext context, int index) {

          int reverseIndex=moviecontroller.fetchMovie.value!.results!.length-1-index;
          return MovieDesign(
            baseurl: baseurl,
            imageurl: moviecontroller.fetchMovie.value!.results![index].backdropPath,
            title: moviecontroller.fetchMovie.value!.results![index].title,
            rating:  moviecontroller.fetchMovie.value!.results![index].voteAverage,
            overview:  moviecontroller.fetchMovie.value!.results![index].overview,
            relasedate:  moviecontroller.fetchMovie.value!.results![index].releaseDate,
            index1: index,
          );
        },

      ) ,
    );
  }
  Widget becauseYouWatched()
  {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height*0.02,
          vertical: MediaQuery.of(context).size.height*0.01

      ),
      height: MediaQuery.of(context).size.height*0.20,
      width: MediaQuery.of(context).size.width*1,
      child:ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: moviecontroller.fetchMovie.value!.results!.length,
        itemBuilder: (BuildContext context, int index) {
          return MovieDesign(
            baseurl: baseurl,
            imageurl: moviecontroller.fetchMovie.value!.results![index].backdropPath,
            title: moviecontroller.fetchMovie.value!.results![index].title,
            rating:  moviecontroller.fetchMovie.value!.results![index].voteAverage,
            overview:  moviecontroller.fetchMovie.value!.results![index].overview,
            relasedate:  moviecontroller.fetchMovie.value!.results![index].releaseDate,
            index1: index,
          );
        },

      ) ,
    );
  }
  Widget dramaMovie()
  {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width*0.02,
          vertical: MediaQuery.of(context).size.height*0.01
      ),
      height: MediaQuery.of(context).size.height*0.20,
      width: MediaQuery.of(context).size.width*1,
      child:ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: moviecontroller.fetchMovie.value!.results!.length,
        itemBuilder: (BuildContext context, int index) {

          int reverseIndex=moviecontroller.fetchMovie.value!.results!.length-1-index;
          return MovieDesign(
            baseurl: baseurl,
            imageurl: moviecontroller.fetchMovie.value!.results![index].backdropPath,
            title: moviecontroller.fetchMovie.value!.results![index].title,
            rating:  moviecontroller.fetchMovie.value!.results![index].voteAverage,
            overview:  moviecontroller.fetchMovie.value!.results![index].overview,
            relasedate:  moviecontroller.fetchMovie.value!.results![index].releaseDate,
            index1: index,
          );
        },

      ) ,
    );
  }

}