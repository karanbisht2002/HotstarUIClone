import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'drawersScreen/channels.dart';
import 'drawersScreen/downloadscreen.dart';
import 'drawersScreen/genres.dart';
import 'drawersScreen/helpscreen.dart';
import 'drawersScreen/languageScreen.dart';
import 'drawersScreen/prizes.dart';
import 'drawersScreen/settingscreen.dart';
import 'drawersScreen/watchlist.dart';

class MyDrawer extends StatefulWidget{
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool value1=false;
  File? image;
  //var imageurlo;
  // Obtain shared preferences.
 // late final  prefs ;
  //late final String? action ;
 // late dynamic?imageuri;

Future imagegallery(ImageSource source) async
{
  //SharedPreferences prefs= await  SharedPreferences.getInstance();
  try
  {
    final image= await ImagePicker().pickImage(source: source);
    if(image==null)return;

    //final imageTemparory=File(image!.path);
      final imagepermanent= await saveImagePermanently(image.path);
    //  print("sjahd ${prefs.getString('imageurl').toString()}");

    setState(() {
      //imageurlo=prefs.setString('imageurl', image.path.toString());
      this.image=imagepermanent;
    });

  }
  catch (e)
  {
      print('failed to pick image');
  }

}
Future saveImagePermanently(String imagepath) async
{

  final directory=await getApplicationDocumentsDirectory();
  final name=basename(imagepath);
  final image=File('${directory.path}/$name');
  print('hhasjhjshjshj');
  print('ajsjds${image.path}');
    return File(imagepath).copy(image.path);
}



  Widget Dialogboxcustom(BuildContext context)
  {
    return AlertDialog(
         content: Container(
           //color: Colors.black26,
           width: MediaQuery.of(context).size.width*0.20,
           height: MediaQuery.of(context).size.height*0.14,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               InkWell(
                 onTap: ()  {
                  imagegallery(ImageSource.gallery);
                  Navigator.pop(context);
                 },
                 child: Stack(
                   children: [
                     Container(
                     width: MediaQuery.of(context).size.width*1,
             padding:EdgeInsets.only(
                 top: MediaQuery.of(context).size.height*0.01,
                 bottom: MediaQuery.of(context).size.height*0.01,
             ),
             //color: Colors.yellow,
                     child: Text(
                         'Gallery',
                       style: TextStyle(
                         fontSize: 25
                       ),
                     ),
                   ),
                     Positioned(
                       left: MediaQuery.of(context).size.width*0.22,
                       top: MediaQuery.of(context).size.height*0.01,
                       child: Icon(
                           Icons.image_outlined,
                         size: 30,

                       ),
                     )
           ]
                 ),
               ),
               Divider(
                 thickness: 2,
               ),
               InkWell(
                 onTap: ()
                 {
                   imagegallery(ImageSource.camera);
                   Navigator.pop(context);

                 },
                 child: Stack(
                     children: [
                       Container(
                         width: MediaQuery.of(context).size.width*1,
                         padding:EdgeInsets.only(
                           top: MediaQuery.of(context).size.height*0.01,
                           bottom: MediaQuery.of(context).size.height*0.01,
                         ),
                         //color: Colors.yellow,
                         child: Text(
                           'Camera',
                           style: TextStyle(
                               fontSize: 25
                           ),
                         ),
                       ),
                       Positioned(
                         left: MediaQuery.of(context).size.width*0.22,
                         top: MediaQuery.of(context).size.height*0.01,
                         child: Icon(
                           Icons.camera_alt_outlined,
                           size: 30,

                         ),
                       )
                     ]
                 ),
               ),

             ],
           ),
         ),

    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: value1==false?Colors.black:Colors.grey,
      child: Column(
        children: [

          Container(
         // color: Colors.blue,
          //width: MediaQuery.of(context).size.width*0.07,
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height*0.06
          ),
          child:
          Container(
            //color: Colors.yellow,
            child: Stack(
              children:[
                image!=null?
                CircleAvatar(
                backgroundImage:Image.file(image!).image,
                radius: 60,
              ): CircleAvatar(
                  backgroundImage:AssetImage(
                    'assets/images/profile.jpg',
                  ),
                  //backgroundImage: Image.file(imagepermanent.path).image,
                  radius: 60,
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height*0.10,
                  left: MediaQuery.of(context).size.width*0.23,
                  child: InkWell(
                    onTap: ()
                    {
                      showDialog(
                          context: context,
                          builder: (BuildContext context)
                          {
                          return Dialogboxcustom(context);
                          }
                          );
                    },
                    child: Icon(
                      Icons.add_a_photo_sharp,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                )
    ]
            ),
          ),
            ),
          Container(
            //height: MediaQuery.of(context).size.height*0.20,
            child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height*0.01,
                  left: MediaQuery.of(context).size.width*0.23
              ),
              child: Row(
                  children:[ Text(
                    'Karan Bisht',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white
                    ),
                  ),
                    Icon(
                        Icons.arrow_right,
                        size: 40,
                        color: Colors.white
                    )
                  ]
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width*1,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height*0.03,
                left: MediaQuery.of(context).size.width*0.03
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kid Safe',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                  ),
                ),

                CupertinoSwitch(
                  onChanged: (bool value) {
                    setState(() {
                      value1=!value1;
                    });
                  },
                  value: value1,
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height*0.02
              ),

              child:InkWell(
                onTap: ()
                {
                  Get.to(DownloadScreen());
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                          Icons.download,
                          color: Colors.white70
                      ),
                    ),
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.50,
                          child: Text(
                            'Downloads',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70
                            ),
                            //textAlign: TextAlign.start,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.50,
                          child: Text(
                            'watch videos ofline',
                            style: TextStyle(
                                color: Colors.white70
                            ),
                            // textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
          ),
          Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height*0.02
              ),
              child:InkWell(
                onTap: ()
                {
                  Get.to(WatchLaterList());
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                          Icons.watch_later_outlined,
                          color: Colors.white70
                      ),
                    ),
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.50,
                          child: Text(
                            'WatchLaterlist',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70
                            ),
                            //textAlign: TextAlign.start,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.50,
                          child: Text(
                            'Save to Watch Latter',
                            style: TextStyle(
                                color: Colors.white70
                            ),
                            // textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
          ),
          Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height*0.02
              ),

              child:InkWell(
                onTap: ()
                {
                  Get.to(Prizes());
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.wine_bar_rounded,
                          color: Colors.white70
                      ),
                    ),
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.50,
                          child: Text(
                            'Prizes',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70
                            ),
                            //textAlign: TextAlign.start,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.50,
                          child: Text(
                            'Prizes you have won',
                            style: TextStyle(
                                color: Colors.white70
                            ),
                            // textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
          ),
          Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height*0.02
              ),

              child:InkWell(
                onTap: ()
                {
                  Get.to(ChannelScreen());
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.wifi_channel,
                          color: Colors.white70
                      ),
                    ),
                    Text(
                      'Channels',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70
                      ),
                    )
                  ],
                ),
              )
          ),
          Container(
              child:InkWell(
                onTap: ()
                {
                  Get.to(LanguageScreen());
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.language,
                          color: Colors.white70
                      ),
                    ),
                    Text(
                      'Languages',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70
                      ),
                    )
                  ],
                ),
              )
          ),
          Container(
            child:InkWell(
              onTap: ()
              {
                Get.to(GenresScreen());
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.masks,
                        color: Colors.white70
                    ),
                  ),
                  Text(
                    'Genres',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70
                    ),
                  )
                ],
              ),
            ),
          ),

          Container(
              child:InkWell(
                onTap: ()
                {
                  Get.to(SettingScreen());
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.settings,
                          color: Colors.white70
                      ),
                    ),
                    Text(
                      'Preferences',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70
                      ),
                    )
                  ],
                ),
              )
          ),
          Container(
              child:InkWell(
                onTap: ()
                {
                  Get.to(HelpScreen());
                },
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.help_outline,
                            color: Colors.white70
                        )
                    ),
                    Text(
                      'Help',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70
                      ),
                    )
                  ],
                ),
              )
          ),

          Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height*0.05
            ),
            child: Row(
                children:[
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width*0.02
                    ),
                    child: Text(
                      'Privacy & Policy',
                      style: TextStyle(
                          color:Colors.white38
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width*0.02
                    ),child: Text(
                    'T&C',
                    style: TextStyle(
                        color:Colors.white38
                    ),
                  ),
                  ),
                  Text(
                    'V12331126',
                    style: TextStyle(
                        color:Colors.white38
                    ),
                  ),
                ]
            ),
          )

        ],
      ),
    );
  }
}