import 'package:flutter/material.dart';
import 'PicoloGame.dart';
import 'Home.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Map<int, Color> color =
    {
      50:Color.fromRGBO(160, 0 ,0 , .1),
      100:Color.fromRGBO(160, 0 ,0 ,.2),
      200:Color.fromRGBO(160, 0 ,0 ,.3),
      300:Color.fromRGBO(160, 0 ,0 ,.4),
      400:Color.fromRGBO(160, 0 ,0 ,.5),
      500:Color.fromRGBO(160, 0 ,0 ,.6),
      600:Color.fromRGBO(160, 0 ,0 ,.7),
      700:Color.fromRGBO(160, 0 ,0 ,.8),
      800:Color.fromRGBO(160, 0 ,0 ,.9),
      900:Color.fromRGBO(160, 0 ,0 , 1),
    };
    return new MaterialApp(
      title: 'Soirée ESIREM',
      theme: new ThemeData(
          primarySwatch: MaterialColor(0xFFA00000, color)
      ),
      debugShowCheckedModeBanner: false,
      home: new Home(),
      routes: <String, WidgetBuilder> {
      },
    );
  }
}
