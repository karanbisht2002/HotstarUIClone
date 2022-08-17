import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../Widgets/allcolor.dart';

class SettingScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.black,
     appBar: AppBar(
       backgroundColor: Colors.black,
       title: Text('Settings'),
     ),
     body: Column(
           children: [
             Container(
               width: MediaQuery.of(context).size.width*1,
               margin: EdgeInsets.only(
                 left: MediaQuery.of(context).size.width*0.02,
                 top: MediaQuery.of(context).size.height*0.02,
               ),
               child: Text(
                   'Video',
                 textAlign: TextAlign.start,
                 style: TextStyle(
                   color: Colors.white60,
                   fontSize: 20,
                 ),
               ),
             ),
             Container(
               margin: EdgeInsets.only(
                 top: MediaQuery.of(context).size.height*0.02
               ),
               width: MediaQuery.of(context).size.width*1,
               height: MediaQuery.of(context).size.height*0.13,
               decoration: BoxDecoration(
                 color: colormineblack
               ),
               child: Column(
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                         Container(
                           padding: EdgeInsets.only(
                             left: MediaQuery.of(context).size.width*0.10
                           ),
                         child: Text(
                             'AutoPlay Trailers ',
                           style: TextStyle(
                             color: Colors.white60,
                             fontSize: 18
                           ),
                         ),
                       ),
                       Padding(
                         padding: EdgeInsets.only(
                             right: MediaQuery.of(context).size.width*0.02),
                         child: CupertinoSwitch(
                           value: false,
                           onChanged: (bool value)
                           {
                             },
                            ),
                       ),
                     ],
                   ),
                   Divider(
                     thickness: 01,
                     color: Colors.white38,
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Container(
                         padding: EdgeInsets.only(
                             left: MediaQuery.of(context).size.width*0.10,
                           top: MediaQuery.of(context).size.height*0.005
                         ),
                         child: Text(
                           'Preferred Video Quality',
                           style: TextStyle(
                               color: Colors.white60,
                               fontSize: 18
                           ),
                         ),
                       ),
                       Padding(
                         padding:  EdgeInsets.only(
                             right: MediaQuery.of(context).size.width*0.03),
                         child: Icon(
                             Icons.keyboard_arrow_down,
                         size: 50,
                         color: Colors.white60,),
                       )

                     ],
                   ),


                 ],
               ),

             ),

             Container(
               width: MediaQuery.of(context).size.width*1,
               margin: EdgeInsets.only(
                 top: MediaQuery.of(context).size.width*0.02,
                   left: MediaQuery.of(context).size.width*0.02
               ),
               child: Text(
                 'Downloads',
                 textAlign: TextAlign.start,
                 style: TextStyle(
                   color: Colors.white60,
                   fontSize: 20,
                 ),
               ),
             ),
             Container(
               margin: EdgeInsets.only(
                   top: MediaQuery.of(context).size.height*0.02
               ),
               width: MediaQuery.of(context).size.width*1,
               height: MediaQuery.of(context).size.height*0.20,
               decoration: BoxDecoration(
                   color: colormineblack
               ),
               child: Column(
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Container(
                         padding: EdgeInsets.only(
                             left: MediaQuery.of(context).size.width*0.10
                         ),
                         child: Text(
                           'Default Download Quality',
                           style: TextStyle(
                               color: Colors.white60,
                               fontSize: 18
                           ),
                         ),
                       ),
                       Padding(
                         padding:  EdgeInsets.only(
                             right: MediaQuery.of(context).size.width*0.03),
                         child: Icon(
                           Icons.keyboard_arrow_down,
                           size: 50,
                           color: Colors.white60,),
                       )
                     ],
                   ),
                   Divider(
                     thickness: 03,
                     color: Colors.black,
                   ),
                      Container(
                        width: MediaQuery.of(context).size.width*1,
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width*0.10
                        ),
                        child: Text(
                          'Internal Storage',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 18,
                          ),
                        ),
                      ),
                   Container(
                     margin: EdgeInsets.only(
                       top: MediaQuery.of(context).size.height*0.03,
                       left: MediaQuery.of(context).size.width*0.12
                     ),
                     child: LinearPercentIndicator(
                       width: MediaQuery.of(context).size.width*0.80,
                       lineHeight: 05.0,
                       percent: 0.7,
                       backgroundColor: Colors.grey,
                       progressColor: Colors.blue,
                     ),
                   ),
                   Container(
                    // color: Colors.green,
                     margin: EdgeInsets.only(
                       left: MediaQuery.of(context).size.width*0.10,
                       right: MediaQuery.of(context).size.width*0.10,
                       top: MediaQuery.of(context).size.height*0.02,
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                          Text(
                            'Used 70%',
                            style: TextStyle(
                              color: Colors.white60
                            ),
                          ),
                         Text(
                             'Available 30%',
                             style: TextStyle(
                             color: Colors.white60
                         ),
                         ),
                       ],
                     ),
                   ),
                   //
                 ],
               ),
             ),
    Container(
      //color: Colors.greenAccent,
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width*0.09,
        top: MediaQuery.of(context).size.height*0.40,
      ),

      child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Rate Us',
            style: TextStyle(
              color: Colors.white60
            ),

          ),
          Text(
            'Privacy Policy',
            style: TextStyle(
                color: Colors.white60
            ),

          ),
          Text(
            'Term And Conditions',
            style: TextStyle(
                color: Colors.white60
            ),

          )
        ],
      ),
    )



    ],
     ),
   );
  }

}