
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'buttomNavigationScreen/disneyplush.dart';
import 'buttomNavigationScreen/movies.dart';
import 'buttomNavigationScreen/sportsscreen.dart';
import 'buttomNavigationScreen/tvscreen.dart';
import 'controler/moviecontroler.dart';
import 'drawerscreen.dart';
import 'buttomNavigationScreen/homeclass.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue,
      ),
      home:MyHomePage(),
      debugShowCheckedModeBanner: false,
      // getPages: [
      //
      // ],
    );
  }
}
class MyHomePage extends StatefulWidget
{
  @override
  _MyHomePage createState()=>_MyHomePage();

}
class _MyHomePage extends State<MyHomePage>
{
  final Moviecontroller moviecontroller=Get.put(Moviecontroller());

  int currentindex=0;
  List mynavigation=<Widget>[
    HomeClass(),
    Tv(),
    Disneyplush(),
    Movies(),
    SportsScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        //iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black87,
        //leadingWidth: 40,
        title: Image.asset(
          'assets/images/logo2.png',
          width: MediaQuery.of(context).size.height*0.20,
          //color: Colors.green,
        ),
        actions: [
          IconButton(onPressed: ()
          {},
              icon:Icon(Icons.search))
        ],
        titleSpacing:0,
        //elevation: 0,
      ),
      //endDrawer: Drawer(),
      bottomNavigationBar: Bottomnavbar(),
      drawer: MyDrawer(),
      body: mynavigation[currentindex],

    );
  }


  Widget Bottomnavbar()
  {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      currentIndex: currentindex,
      showUnselectedLabels: true,
      iconSize: 20,
      unselectedItemColor: Colors.white,
      // unselectedFontSize: 12,
      fixedColor: Colors.green,
      onTap: (index)
      {
        setState(() {
          currentindex=index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label:'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.airplay_outlined),
          label: 'TV',

        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/logo2.png',
            //color: Colors.green,
            fit: BoxFit.fill,
            //  height: 50,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.video_settings),
          label: 'Movies',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.sports_cricket),
            label: 'Sports',
            backgroundColor: Colors.black),
      ],
    );
  }

}