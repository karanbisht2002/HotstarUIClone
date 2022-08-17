
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotstarui/Widgets/caroselclass.dart';
import 'package:hotstarui/Widgets/texttitle.dart';
import 'package:hotstarui/controler/moviecontroler.dart';
import 'package:http/http.dart' as http;

import '../Widgets/channellogodesign.dart';
import '../Widgets/moviedesign.dart';
import '../controler/moviecontrolertrending.dart';
class Disneyplush  extends StatefulWidget
{
  @override
  State<Disneyplush> createState() => _DisneyplushState();
}

class _DisneyplushState extends State<Disneyplush> {
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

    return SingleChildScrollView(
      child: Column(
        children: [
          Caroselclass(listrespomnsetv, baseurl),
          ChannelLogoDesign(),
          Texttitle(title: 'Recommended For You'),
          recommendedforyou(),
          Texttitle(title: 'New To Disney+'),
          newtodisney(),
          Texttitle(title: 'Women Lead The Way'),
          womenlead(),
          Texttitle(title: 'Hit Movie'),
          hitmovie(),
          Texttitle(title: 'Disney+ Original'),
          disneyoriginal(),
          Texttitle(title: 'Reimagined Classics'),
          reimaginedclassics(),
          Texttitle(title: 'Beasts and Monsters'),
          beastsmonsters(),
          Texttitle(title: 'Inspired By True Stories'),
          inspiredByTrueStories(),
          Texttitle(title: 'Documentaries'),
          Documentaries(),


        ],
      ),
    );
  }
  Widget Documentaries()
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
   Widget inspiredByTrueStories()
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
  Widget beastsmonsters()
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
   Widget reimaginedclassics()
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
  Widget disneyoriginal()
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
  Widget hitmovie()
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

  Widget womenlead()
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
  Widget newtodisney()
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
  Widget recommendedforyou()
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

