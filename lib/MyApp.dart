import 'package:flutter/material.dart';
import 'Home.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Map<int, Color> color =
    {
      50:Color.fromRGBO(241, 48, 77, .1),
      100:Color.fromRGBO(241, 48, 77,.2),
      200:Color.fromRGBO(241, 48, 77,.3),
      300:Color.fromRGBO(241, 48, 77,.4),
      400:Color.fromRGBO(241, 48, 77,.5),
      500:Color.fromRGBO(241, 48, 77,.6),
      600:Color.fromRGBO(241, 48, 77,.7),
      700:Color.fromRGBO(241, 48, 77,.8),
      800:Color.fromRGBO(241, 48, 77,.9),
      900:Color.fromRGBO(241, 48, 77, 1),
    };
    return new MaterialApp(
      title: 'Piccolo ESIREM',
      theme: new ThemeData(
          primarySwatch: MaterialColor(0xFFf1304d, color)
      ),
      debugShowCheckedModeBanner: false,
      home: new Home(),
      routes: <String, WidgetBuilder> {
      },
    );
  }
}
