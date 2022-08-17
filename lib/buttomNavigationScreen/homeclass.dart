import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotstarui/controler/moviecontroler.dart';
import 'package:hotstarui/controler/moviecontrolercomedy.dart';
import 'package:hotstarui/controler/moviecontrolertrending.dart';
import 'package:http/http.dart' as http;

import '../Widgets/caroselclass.dart';
import '../Widgets/moviedesign.dart';
import '../Widgets/texttitle.dart';
import '../seemorescreen.dart';

class HomeClass extends StatefulWidget {
  @override
  State<HomeClass> createState() => _HomeClassState();
}
class _HomeClassState extends State<HomeClass> {
  List listresponse=[];
  late Map mapresponse;

  List listresponsepop=[];
  late Map mapresponsepop;

  List listresponseAction=[];
  late Map mapresponseAction;

  List listresponseComedy=[];
  late Map mapresponseComedy;

  List listresponseToprated=[];
  late Map mapresponseToprated;


  var baseurl = 'https://image.tmdb.org/t/p/original';
  final Moviecontroller moviecontroller=Get.put(Moviecontroller());
  final MovieControlerComedy movieControlerComedy=Get.put(MovieControlerComedy());
  final MovieControlerTrending movieControlerTrending=Get.put(MovieControlerTrending());

  @override
  Widget build(BuildContext context) {
    return Obx(
            () => moviecontroller.isLoading.value.toString() == "true" || movieControlerTrending.isloading.value.toString() == "true"
            ? const Center(child: CircularProgressIndicator()): SingleChildScrollView(
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
              //carosel(),
              Caroselclass(listresponse,baseurl),
              Texttitle(title:'Continue Watching'),
              Continue(),
              latest(),
             // Texttitle(title:'Because you Watched This'),
              youwatched(),
              //Texttitle(title:'Top Rated'),
              toprated(),
             // Texttitle(title:'Action Movie'),
              actionmovie(),
              //Texttitle(title:'Drama'),
              drama(),
             // Texttitle(title:'Loved By People'),
              lovedbypeople(),
             // Texttitle(title:'Comedy Movie'),
              comedymovie(),
              //Texttitle(title:'Supernatural Movies'),
              supernaturalmovie(),
              //Texttitle(title:'Top Rated'),
              toprated(),

            ],
          ),
        )
    );

  }
  // Widget threedot()
  // {
  //    return Image.asset(
  //      'assets/images/thredot.png',
  //      height: 30,
  //      width: 30,
  //      color: Colors.white,
  //    );
  // }
  Widget Continue()
  {
    return  Container(
      //color: Colors.white,
      height: MediaQuery.of(context).size.height*0.15,
      width: MediaQuery.of(context).size.width*1,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height*0.02
      ),
      child: ListView.builder(
        reverse: true,
        itemCount: listresponse.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Stack(
              children:[
                InkWell(
                  onTap: ()
                  {
                    showModalBottomSheet(
                        backgroundColor: Colors.black,
                        context: context,
                        builder: (context)
                        {
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Stack(
                                  children:[
                                    Container(
                                      height: MediaQuery.of(context).size.height*0.30,
                                      color: Colors.green,
                                      child: CachedNetworkImage(
                                        imageUrl:baseurl+'${listresponse[index]['backdrop_path']}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width*1,
                                      //color: Colors.green,
                                      margin: EdgeInsets.only(
                                        top: MediaQuery.of(context).size.height*0.27,
                                        //left: MediaQuery.of(context).size.width*0.25,
                                      ),
                                      child: Text(
                                        moviecontroller.fetchMovie.value!.results![index].title.toString(),
                                        maxLines:1,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 23,
                                            fontStyle:FontStyle.italic,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    )
                                  ]
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height*0.01,
                                ),
                                //color: Colors.green,
                                width: MediaQuery.of(context).size.width*1,
                                height: MediaQuery.of(context).size.height*0.03,
                                child: Text(
                                  'Release Date-'+moviecontroller.fetchMovie.value!.results![index].releaseDate.toString().replaceAll('00:00:00.000',"")+'||'+' Rating - '+moviecontroller.fetchMovie.value!.results![index].voteAverage.toString().toUpperCase()+'/10',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white70
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height*0.01,
                                ),

                                width: MediaQuery.of(context).size.width*1,
                                height: MediaQuery.of(context).size.height*0.06,
                                //color:Colors.green,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [

                                    Column(
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                        Text(
                                          'Watchlist',
                                          style: TextStyle(
                                              color: Colors.white
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      height: MediaQuery.of(context).size.height*0.05,
                                      width: MediaQuery.of(context).size.width*0.30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(17),
                                        color: Colors.indigo,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.play_arrow,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          Text(
                                            'Watch',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color:Colors.white
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.info_outline,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                        Text(
                                          'Info',
                                          style: TextStyle(
                                              color: Colors.white
                                          ),
                                        )
                                      ],
                                    ),

                                  ],
                                ),

                              ),

                              Padding(

                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height*0.03,
                                  left: MediaQuery.of(context).size.width*0.03,
                                  right: MediaQuery.of(context).size.width*0.03,
                                ),
                                child: Text(
                                  moviecontroller.fetchMovie.value!.results![index].overview.toString(),
                                  textAlign: TextAlign.justify,
                                  maxLines: 5,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15,
                                    //fontWeight: FontWeight.bold
                                  ),

                                ),
                              )

                            ],
                          );
                        }
                    );
                  },

                  child: Container(
                    //color: Colors.lightGreen,
                    //  width: MediaQuery.of(context).size.width*0.50,
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width*0.02,
                      top: MediaQuery.of(context).size.height*0.02,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl:baseurl+'${listresponse[index]['backdrop_path']}',
                        fit: BoxFit.fitHeight,
                        // width: MediaQuery
                        //     .of(context)
                        //     .size
                        //     .width * 1,
                      ),
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
    );
  }
  Widget latest()
  {
    dynamic?imageurl;
    //dynamic?baseurl;
    dynamic?index1;
    //dynamic?listresponse;
    dynamic?title;
    dynamic?relasedate;
    dynamic?overview;
    dynamic?rating;
   // dynamic?index1;

    return Column(
      children:[

        InkWell(
          onTap: ()
            {
                Get.to(
                SeeMoreScreen(

                  length:movieControlerTrending.fetchdatatr.value!.results!.length,
                  baseurl: baseurl,
                imageurl: movieControlerTrending.fetchdatatr.value!,
                title: movieControlerTrending.fetchdatatr.value!,
                rating:  moviecontroller.fetchMovie.value!,
                overview:  moviecontroller.fetchMovie.value!,
                relasedate:  moviecontroller.fetchMovie.value!, titleapp: 'Latest & Trending',
                ));
            },
            child: Texttitle(title:'Latest & Trending')
        ),

        Container(
        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height*0.02,

        ),
        height: MediaQuery.of(context).size.height*0.20,
        width: MediaQuery.of(context).size.width*1,

        // color: Colors.yellow,
        child: ListView.builder(
          reverse:false,
          scrollDirection: Axis.horizontal,
          itemCount: movieControlerTrending.fetchdatatr.value!.results!.length,
          itemBuilder: (BuildContext context, int index) {

            return  MovieDesign(
              baseurl: baseurl,
              imageurl: movieControlerTrending.fetchdatatr.value!.results![index].backdropPath,
              title: movieControlerTrending.fetchdatatr.value!.results![index].title==null?movieControlerTrending.fetchdatatr.value!.results![index].originalName
                  :movieControlerTrending.fetchdatatr.value!.results![index].title,
              rating:  moviecontroller.fetchMovie.value!.results![index].voteAverage,
              overview:  moviecontroller.fetchMovie.value!.results![index].overview,
              relasedate:  moviecontroller.fetchMovie.value!.results![index].releaseDate,
              index1: index,
            );
          },

        ),
      ),
    ]
    );
  }

  Widget youwatched()
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
                    relasedate:  moviecontroller.fetchMovie.value!, titleapp: "Becasue You Have Watched",
                  ));
            },
            child: Texttitle(title:'Becasue you have watched')
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height*0.02,

          ),
          height: MediaQuery.of(context).size.height*0.20,
          width: MediaQuery.of(context).size.width*1,

          // color: Colors.yellow,
          child: ListView.builder(
            //reverse: true,
            scrollDirection: Axis.horizontal,
            itemCount: moviecontroller.fetchMovie.value!.results!.length,
            itemBuilder: (BuildContext context, int index) {

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
  Widget actionmovie() {

    return Column(
      children: [


        InkWell(
            onTap: ()
            {
              Get.to(
                  SeeMoreScreen(
                    length:movieControlerComedy.fetchmoviecomedy.value!.results!.length,
                    imageurl: movieControlerComedy.fetchmoviecomedy.value!,
                    title: moviecontroller.fetchMovie.value!,
                    rating:  moviecontroller.fetchMovie.value!,
                    overview:  moviecontroller.fetchMovie.value!,
                    relasedate:  moviecontroller.fetchMovie.value!,
                    baseurl:baseurl, titleapp: 'Action Movie',
                  ));
            },
            child: Texttitle(title:'Action Movie')
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
              return  MovieDesign(
                baseurl: baseurl,
                imageurl: movieControlerComedy.fetchmoviecomedy.value!.results![index].backdropPath,
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
  Widget drama()
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
                    relasedate:  moviecontroller.fetchMovie.value!, titleapp: 'Drama',
                  ));
            },
            child: Texttitle(title:'Drama')
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height*0.02,

          ),
          height: MediaQuery.of(context).size.height*0.20,
          width: MediaQuery.of(context).size.width*1,

          // color: Colors.yellow,
          child: ListView.builder(
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemCount: moviecontroller.fetchMovie.value!.results!.length,
            itemBuilder: (BuildContext context, int index) {

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
  Widget comedymovie()
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
                    relasedate:  moviecontroller.fetchMovie.value!, titleapp: 'Comedy Movie',
                  ));
            },
            child: Texttitle(title:'Comedy Movie')
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height*0.02,

          ),
          height: MediaQuery.of(context).size.height*0.20,
          width: MediaQuery.of(context).size.width*1,

          // color: Colors.yellow,
          child: ListView.builder(
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemCount: moviecontroller.fetchMovie.value!.results!.length,
            itemBuilder: (BuildContext context, int index) {

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

  Widget supernaturalmovie()
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
                    relasedate:  moviecontroller.fetchMovie.value!, titleapp: 'Super Natural Movie',
                  ));
            },
            child: Texttitle(title:'Super Natural Movie')
        ),



        Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height*0.02,

          ),
          height: MediaQuery.of(context).size.height*0.20,
          width: MediaQuery.of(context).size.width*1,

          // color: Colors.yellow,
          child: ListView.builder(
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemCount: moviecontroller.fetchMovie.value!.results!.length,
            itemBuilder: (BuildContext context, int index) {

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

  Widget toprated()
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
                    relasedate:  moviecontroller.fetchMovie.value!, titleapp: 'Top Rated',
                  ));
            },
            child: Texttitle(title:'Top Rated')
        ),



        Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height*0.02,

          ),
          height: MediaQuery.of(context).size.height*0.20,
          width: MediaQuery.of(context).size.width*1,

          // color: Colors.yellow,
          child: ListView.builder(
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemCount: moviecontroller.fetchMovie.value!.results!.length,
            itemBuilder: (BuildContext context, int index) {

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
  Widget lovedbypeople()
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
                    relasedate:  moviecontroller.fetchMovie.value!, titleapp: 'Loved By People',
                  ));
            },
            child: Texttitle(title:'Loved By People')
        ),

        Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height*0.02,

          ),
          height: MediaQuery.of(context).size.height*0.20,
          width: MediaQuery.of(context).size.width*1,

          // color: Colors.yellow,
          child: ListView.builder(
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemCount: moviecontroller.fetchMovie.value!.results!.length,
            itemBuilder: (BuildContext context, int index) {

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

  void fetchdata() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/trending/all/week?api_key=b446989950f59feffb9d1867bccc84d0'));
    if (response.statusCode == 200) {
      setState(() {
        mapresponse = jsonDecode(response.body);
        listresponse = mapresponse['results'];
        // print('karan1' + "${listresponse[0]['original_Texttitle']}");
      });
    }
  }

  void fetchdataPopular() async
  {
    http.Response response;
    response= await http.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=b446989950f59feffb9d1867bccc84d0&language=en-US&page=1'));
    if(response.statusCode==200)
    {
      setState(() {
        mapresponsepop=jsonDecode(response.body);
        listresponsepop=mapresponsepop['results'];
        // print('karan' + "${listresponsepop[0]['original_Texttitle']}");
      });
    }
  }
  void fetchdataAction ()async
  {
    http.Response response;
    response=await http.get(Uri.parse('https://api.themoviedb.org/3/discover/movie?api_key=b446989950f59feffb9d1867bccc84d0&with_genres=28'));
    if(response.statusCode==200)
    {
      setState(() {
        mapresponseAction=jsonDecode(response.body);
        listresponseAction=mapresponseAction['results'];
      });
    }
  }
  void fetchdatacomedy() async
  {
    http.Response response;
    response=await http.get(Uri.parse('https://api.themoviedb.org/3/discover/movie?api_key=b446989950f59feffb9d1867bccc84d0&with_genres=28')) ;
    if(response.statusCode==200)
    {
      setState(() {
        mapresponseComedy=jsonDecode(response.body);
        listresponseComedy=mapresponseComedy['results'];
      });
    }
  }
  void fetchdatatoprated() async
  {
    http.Response response;
    response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/top_rated?api_key=b446989950f59feffb9d1867bccc84d0&language=en-US&page=1'));
    if(response.statusCode==200)
    {
      setState(() {
        mapresponseToprated=jsonDecode(response.body);
        listresponseToprated=mapresponseToprated['results'];
      });
    }

  }

  @override
  void initState() {
    fetchdata();
    fetchdataPopular();
    fetchdataAction();
    fetchdatacomedy();
    fetchdatatoprated();
    super.initState();
  }
  var image = [
    'assets/images/dream.png',
    'assets/images/dream.png',
    'assets/images/dream.png',
    'assets/images/dream.png',
    'assets/images/dream.png',
  ];
}
Widget threedot()
{
  return Image.asset(
    'assets/images/thredot.png',
    height: 30,
    width: 30,
    color: Colors.white,
  );
}
