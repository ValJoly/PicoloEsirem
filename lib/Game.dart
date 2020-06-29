import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Game();
  }
}

class _Game extends State<Game> {
  List<String> cards = new List();
  /*generate(
    1,
    (index) =>
        'chargée de comm : \n Prends une photo avec ts les joueurs avant la fin de la partie, sinon cul sec',
  );*/

  @override
  Widget build(BuildContext context) {
    pickACard();
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Swipe pour la suite'),
        leading: new Icon(Icons.videogame_asset),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: ListView.builder(
        itemCount: cards.length,
        itemBuilder: (context, index) {
          final card = cards.elementAt(index);
          return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                setState(() {
                  cards.remove(card);
                });
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Next'),
                    duration: Duration(milliseconds: 500),
                  ),
                );
                setState(() {
                  cards.add(
                    'Kfet : \n Gère la musique pdt la partie',
                  );
                });
              },
              child: Center(
                child: Container(
                  child: Card(
                    child: Text(
                      card,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 2 / 3,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 4),
                ),
              ));
        },
      ),
    );
  }

  void pickACard() {
    cards.add(
      'chargée de comm : \n Prends une photo avec ts les joueurs avant la fin de la partie, sinon cul sec',
    );
  }
}