import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotstarui/Widgets/moviedesign.dart';
import 'package:hotstarui/controler/moviecontrolercomedy.dart';
import 'package:hotstarui/buttomNavigationScreen/homeclass.dart';
import 'package:http/http.dart' as http;
import '../Widgets/caroselclass.dart';
import '../Widgets/texttitle.dart';
import '../controler/moviecontroler.dart';
import '../controler/moviecontrolertrending.dart';
import '../seemorescreen.dart';



class Tv extends StatefulWidget
{
  @override
  State<Tv> createState() => _TvState();
}

class _TvState extends State<Tv> {

  var baseurl='https://image.tmdb.org/t/p/original';
  late Map mapresponsetv;
  List listrespomnsetv=[];
  final MovieControlerComedy movieControlerComedy=Get.put(MovieControlerComedy());
  final MovieControlerTrending movieControlerTrending=Get.put(MovieControlerTrending());
  Moviecontroller moviecontroller=Get.put(Moviecontroller());



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
          //Texttitle(title:'Show You Watch'),
          showyouwatch(),
          //Texttitle(title: 'Because You Watched Criminal Justics'),
          criminaljustics(),
          //Texttitle(title: 'Family Friendly Shows'),
          familyfriendly(),
          //Texttitle(title: 'Hindi Drama'),
         hindidrama(),
          //Texttitle(title: 'Popular show'),
          popularshow(),
          //Texttitle(title: 'Popular Channel'),
          popularchannel(),
         // Texttitle(title: 'English Kid Show'),
          englishkidshow(),
         // Texttitle(title: 'English Super Hero Show'),
          englishsuperheroshow(),
        ],
      ),
    );
  }


  Widget englishsuperheroshow()
  {
    return Column(
      children: [

        InkWell(
            onTap: ()
            {
              Get.to(
                  SeeMoreScreen(
                    length:moviecontroller.fetchMovie.value!.results!.length,
                    baseurl: baseurl,
                    imageurl: moviecontroller.fetchMovie.value!,
                    title: moviecontroller.fetchMovie.value!,
                    rating:  moviecontroller.fetchMovie.value!,
                    overview:  moviecontroller.fetchMovie.value!,
                    relasedate:  moviecontroller.fetchMovie.value!, titleapp: 'English Super Hero',
                  ));
            },
            child: Texttitle(title:'English Super Hero')
        ),


        Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height*0.02
          ),
          height: MediaQuery.of(context).size.height*0.20,
          width: MediaQuery.of(context).size.width*1,
          child:ListView.builder(
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemCount: movieControlerComedy.fetchmoviecomedy.value!.results!.length,
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
        ),
      ],
    );

  }

  Widget popularchannel()
  {

    return  Column(
      children: [

        InkWell(
            onTap: ()
            {
              Get.to(
                  SeeMoreScreen(
                    length:movieControlerComedy.fetchmoviecomedy.value!.results!.length,
                    imageurl: movieControlerComedy.fetchmoviecomedy.value!,
                    title: moviecontroller.fetchMovie.value!.results!,
                    rating:  moviecontroller.fetchMovie.value!.results!,
                    overview:  moviecontroller.fetchMovie.value!.results!,
                    relasedate:  moviecontroller.fetchMovie.value!.results!,
                    baseurl:baseurl,
                      titleapp: 'Popular Channel'
                  ));
            },
            child: Texttitle(title:'Popular Channel')
        ),


        Container(
          //color: Colors.white,
          height: MediaQuery.of(context).size.height*0.18,
          width: MediaQuery.of(context).size.width*1,
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height*0.02
          ),
          child: ListView.builder(
            itemCount: movieControlerComedy.fetchmoviecomedy.value!.results!.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                  children:[ Container(
                    //color: Colors.lightGreen,
                     width: MediaQuery.of(context).size.width*0.52,
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width*0.02,
                      top: MediaQuery.of(context).size.height*0.02,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        baseurl+'${movieControlerComedy.fetchmoviecomedy.value!.results![index].posterPath}',
                        fit: BoxFit.cover,
                        // width: MediaQuery
                        //     .of(context)
                        //     .size
                        //     .width * 1,
                      ),
                    ),

                  ),
                    Positioned(
                        top: MediaQuery.of(context).size.height*0.02,
                        left: MediaQuery.of(context).size.width*0.45,
                        child:threedot())
                  ]
              );

            },
          ),
        ),
      ],
    );


  }

  Widget  englishkidshow()
  {
    return Column(
      children: [
        InkWell(
            onTap: ()
            {
              Get.to(
                  SeeMoreScreen(
                    length:moviecontroller.fetchMovie.value!.results!.length,
                    baseurl: baseurl,
                    imageurl: moviecontroller.fetchMovie.value!,
                    title: moviecontroller.fetchMovie.value!,
                    rating:  moviecontroller.fetchMovie.value!,
                    overview:  moviecontroller.fetchMovie.value!,
                    relasedate:  moviecontroller.fetchMovie.value!,
                      titleapp: 'English Kid Show'
                  ));
            },
            child: Texttitle(title:'English Kid Show')
        ),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height*0.02
          ),
          height: MediaQuery.of(context).size.height*0.20,
          width: MediaQuery.of(context).size.width*1,
          child:ListView.builder(
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemCount: movieControlerComedy.fetchmoviecomedy.value!.results!.length,
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
        ),
      ],
    );
  }


  Widget  popularshow()
  {
    return Column(
      children: [

        InkWell(
            onTap: ()
            {
              Get.to(
                  SeeMoreScreen(
                    length:moviecontroller.fetchMovie.value!.results!.length,
                    baseurl: baseurl,
                    imageurl: moviecontroller.fetchMovie.value!,
                    title: moviecontroller.fetchMovie.value!,
                    rating:  moviecontroller.fetchMovie.value!,
                    overview:  moviecontroller.fetchMovie.value!,
                    relasedate:  moviecontroller.fetchMovie.value!,
                      titleapp: 'Popular Show'
                  ));
            },
            child: Texttitle(title:'Popular Show')
        ),


        Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height*0.02
          ),
          height: MediaQuery.of(context).size.height*0.20,
          width: MediaQuery.of(context).size.width*1,
          child:ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movieControlerComedy.fetchmoviecomedy.value!.results!.length,
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
        ),
      ],
    );
  }

  Widget  hindidrama()
  {
     return Column(
       children: [

         InkWell(
             onTap: ()
             {
               Get.to(
                   SeeMoreScreen(
                     length:moviecontroller.fetchMovie.value!.results!.length,
                     baseurl: baseurl,
                     imageurl: moviecontroller.fetchMovie.value!,
                     title: moviecontroller.fetchMovie.value!,
                     rating:  moviecontroller.fetchMovie.value!,
                     overview:  moviecontroller.fetchMovie.value!,
                     relasedate:  moviecontroller.fetchMovie.value!,
                       titleapp: 'Hindi Drama'
                   ));
             },
             child: Texttitle(title:'Hindi Drama')
         ),


         Container(
           margin: EdgeInsets.symmetric(
               horizontal: MediaQuery.of(context).size.height*0.02
           ),
           height: MediaQuery.of(context).size.height*0.20,
           width: MediaQuery.of(context).size.width*1,
           child:ListView.builder(
             reverse: true,
             scrollDirection: Axis.horizontal,
             itemCount: movieControlerComedy.fetchmoviecomedy.value!.results!.length,
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
         ),
       ],
     );
  }

  Widget  familyfriendly()
  {
    return Column(
      children: [

        InkWell(
            onTap: ()
            {
              Get.to(
                  SeeMoreScreen(
                    length:moviecontroller.fetchMovie.value!.results!.length,
                    baseurl: baseurl,
                    imageurl: moviecontroller.fetchMovie.value!,
                    title: moviecontroller.fetchMovie.value!,
                    rating:  moviecontroller.fetchMovie.value!,
                    overview:  moviecontroller.fetchMovie.value!,
                    relasedate:  moviecontroller.fetchMovie.value!,
                      titleapp: 'Family and Friendly Show'
                  ));
            },
            child: Texttitle(title:'Family and Friendly Show')
        ),


        Container(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.height*0.02
          ),
          height: MediaQuery.of(context).size.height*0.20,
          width: MediaQuery.of(context).size.width*1,
          child:ListView.builder(
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemCount: movieControlerComedy.fetchmoviecomedy.value!.results!.length,
            itemBuilder: (BuildContext context, int index) {

              //int reverseIndex= movieControlerComedy.fetchmoviecomedy.value!.results!.length-1-index;
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
        ),
      ],
    );
  }



  showyouwatch()
  {
    return Column(
      children: [

        InkWell(
            onTap: ()
            {
              Get.to(
                  SeeMoreScreen(
                    length:moviecontroller.fetchMovie.value!.results!.length,
                    baseurl: baseurl,
                    imageurl: moviecontroller.fetchMovie.value!,
                    title: moviecontroller.fetchMovie.value!,
                    rating:  moviecontroller.fetchMovie.value!,
                    overview:  moviecontroller.fetchMovie.value!,
                    relasedate:  moviecontroller.fetchMovie.value!,
                      titleapp: 'Show You Watch'
                  ));
            },
            child: Texttitle(title:'Show You Watch')
        ),



        Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height*0.02,

          ),
          height: MediaQuery.of(context).size.height*0.20,
          width: MediaQuery.of(context).size.width*1,

          // color: Colors.yellow,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movieControlerComedy.fetchmoviecomedy.value!.results!.length,
            itemBuilder: (BuildContext context, int index) {

              int reverseIndex=movieControlerComedy.fetchmoviecomedy.value!.results!.length-1-index;
              return  MovieDesign(
                baseurl: baseurl,
                imageurl: moviecontroller.fetchMovie.value!.results![index].backdropPath,
                title: moviecontroller.fetchMovie.value!.results![index].title,
                rating:  moviecontroller.fetchMovie.value!.results![index].voteAverage,
                overview:  moviecontroller.fetchMovie.value!.results![index].overview,
                relasedate:  moviecontroller.fetchMovie.value!.results![index].releaseDate,
                index1: index,
              );
            },
          ),
        ),
      ],
    );
  }
  Widget criminaljustics()
  {

    return Column(
      children: [

        InkWell(
            onTap: ()
            {
              Get.to(
                  SeeMoreScreen(
                    length:moviecontroller.fetchMovie.value!.results!.length,
                    baseurl: baseurl,
                    imageurl: moviecontroller.fetchMovie.value!,
                    title: moviecontroller.fetchMovie.value!,
                    rating:  moviecontroller.fetchMovie.value!,
                    overview:  moviecontroller.fetchMovie.value!,
                    relasedate:  moviecontroller.fetchMovie.value!,
                      titleapp: 'Criminal Justice'
                  ));
            },
            child: Texttitle(title:'Criminal Justice')
        ),


        Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height*0.02
          ),
          width: MediaQuery.of(context).size.width*1,
          height: MediaQuery.of(context).size.height*0.20,
          child: ListView.builder(
            reverse: true,
            itemCount: movieControlerComedy.fetchmoviecomedy.value!.results!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder:(BuildContext context,int index)
              {
                return MovieDesign(
                    baseurl: baseurl,
                    imageurl: moviecontroller.fetchMovie.value!.results![index].backdropPath,
                    title: moviecontroller.fetchMovie.value!.results![index].title,
                    rating:  moviecontroller.fetchMovie.value!.results![index].voteAverage,
                    overview:  moviecontroller.fetchMovie.value!.results![index].overview,
                    relasedate:  moviecontroller.fetchMovie.value!.results![index].releaseDate,
                    index1: index,);
                }
          ),
        ),
      ],
    );
  }

}


