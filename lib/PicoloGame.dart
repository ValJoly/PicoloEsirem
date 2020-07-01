import 'package:flutter/material.dart';
import 'dart:math';

class PicoloGame extends StatefulWidget {

  List<String> param;
  PicoloGame(List<String> players) {
    param = players;
  }


  @override
  State<StatefulWidget> createState() {
    return new _PicoloGame(param);
  }


}

class _PicoloGame extends State<PicoloGame> {

  List<String> players;
  int turnMax;
  int turn;
  List<String> cards;

  _PicoloGame(this.players) {
    cards = new List();
    turnMax = players.length;
    turn = 0;
  }

  @override
  Widget build(BuildContext context) {
    pickACard();
    print(players);
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Swipe pour la suite'),
        actions: [Padding(
          padding: const EdgeInsets.only(right: 20),
          child: new Icon(Icons.videogame_asset),
        )],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: Column(
        children: [
          Container(
            child: Card(
              child: Text('Au tour de : \n' + players.elementAt(turn),style: TextStyle(fontSize: MediaQuery.of(context).size.height / 30 ) , textAlign: TextAlign.center,),
              color: Colors.deepPurple,
            ),
            height: MediaQuery.of(context).size.height / 10,
            width: MediaQuery.of(context).size.width * 3 / 4,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cards.length,
              itemBuilder: (context, index) {
                final card = cards.elementAt(index);
                return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      setState(() {
                        cards.remove(card);
                        turn++;
                        turn %= turnMax;
                      });
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Next'),
                          duration: Duration(milliseconds: 500),
                        ),
                      );
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
          ),
        ],
      ),
    );
  }

  void pickACard() {
    if (Random().nextInt(2)  == 1) {
      cards.add(
        'chargée de comm : \n Prends une photo avec ts les joueurs avant la fin de la partie, sinon cul sec',
      );
    } else {
      cards.add(
        'Surleau : \n Tu peux pas regarder ton téléphone pendant la partie, une gorgée à chaque manque',
      );
    }

  }
}