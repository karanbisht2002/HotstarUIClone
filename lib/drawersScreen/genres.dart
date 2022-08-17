import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controler/moviecontroler.dart';
import '../controler/moviecontrolercomedy.dart';
import '../controler/moviecontrolertrending.dart';

class GenresScreen extends StatelessWidget
{
  var baseurl = 'https://image.tmdb.org/t/p/original';
  final Moviecontroller moviecontroller=Get.put(Moviecontroller());
  final MovieControlerComedy movieControlerComedy=Get.put(MovieControlerComedy());
  final MovieControlerTrending movieControlerTrending=Get.put(MovieControlerTrending());
  var imageurl=[
    'https://upload.wikimedia.org/wikipedia/en/9/94/Romantic_2021_poster.jpg',
    'https://static.digit.in/default/7dee981885bc58696d611e9e88679e3f691b0a43.jpeg?tr=w-1200',
    'https://upload.wikimedia.org/wikipedia/en/e/ef/Family_%282006_film%29.jpg',
   'https://upload.wikimedia.org/wikipedia/en/9/97/Reality_%28film%29.jpg',
    'https://www.91-cdn.com/hub/wp-content/uploads/2021/06/Chhichhore-top-hotstar-movies-Hindi.jpg?tr=q-100',
    'https://orion-uploads.openroadmedia.com/md_81afe139738e-cimemovies_sicario.jpg',
    'https://0.soompi.io/wp-content/uploads/2017/05/04141303/bokjoo.jpg?s=900x600&e=t',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBNC9jUB-rF5EGKslRS5JG_ZPjIWrftMoCnw&usqp=CAU',
    'https://img1.hotstarext.com/image/upload/f_auto,t_vl/sources/r1/cms/prod/old_images/vertical/MOVIE/4358/1000164358/1000164358-v',
    'https://www.denofgeek.com/wp-content/uploads/2016/02/best-modern-sci-fi-movies_0.jpg?resize=768%2C432',
     'https://media.cntraveler.com/photos/543d7ecc58544c134c066f32/master/pass/wild-movie.jpg',
    'https://static.toiimg.com/photo/msid-90196072/90196072.jpg',
    'https://www.nme.com/wp-content/uploads/2020/10/Insidious-696x442.jpg',
     'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/movies-for-kids-2021-luca-1624279846.jpeg',

  ];
  var title=[
    'Romance',
    'Drama',
    'Family',
    'Reality',
    'Comedy',
    'Crime',
    'Food',
    'Action',
    'Biopic',
    'Science',
    'travel',
    'Documentry',
    'Horror',
    'Kids',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Genres'),
        actions: [
          IconButton(
              onPressed:(){},
              icon: Icon(Icons.search)
          )
        ],
      ),
      body: GridView.builder(

        itemCount: imageurl.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: MediaQuery.of(context).size.width*1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                //color: Colors.indigo
            ),
            child: Stack(
              children:[
                Opacity(
                  opacity: 0.6,
                  child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    width: MediaQuery.of(context).size.width*1,
                    height: MediaQuery.of(context).size.height*1,
                    imageUrl: imageurl[index],
                    fit: BoxFit.cover,
                   // color: Colors.black12,

                  ),
              ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height*0.19,
                  left: MediaQuery.of(context).size.height*0.07,
                    child: Text(
                      title[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold
                      ),
                    ))
          ]
            ),
          );

        },
      ),

    );
  }

}