import 'package:flutter/material.dart';
import 'PicoloGame.dart';
import 'Home.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Soirée ESIREM',
      theme: new ThemeData(
          primarySwatch: Colors.deepPurple
      ),
      debugShowCheckedModeBanner: false,
      home: new Home(),
      routes: <String, WidgetBuilder> {
      },
    );
  }
}
