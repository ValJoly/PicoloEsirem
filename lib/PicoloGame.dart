import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:io';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

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

  String allCards;
  List<String> players;
  int turnMax;
  int turn;
  List<String> listsCards;
  List<String> cards;


  Future<List<String>> fetchFileData() async {
    allCards = await rootBundle.loadString('assets/card.txt');

    sleep(const Duration(seconds: 1));

    List<String> tmp = new List();
    tmp = allCards.split("§");

    return tmp;
  }

  _PicoloGame(this.players) {
    cards = new List();
    allCards = "";
    if (players.isEmpty) {
      players.add("personne");
    }
    turnMax = players.length;
    turn = 0;
  }


  @override
  Widget build(BuildContext context) {
    pickACard();

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
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Container(
            child: Card(
              child: Text('Au tour de : \n' + players.elementAt(turn),style: TextStyle(fontSize: MediaQuery.of(context).size.height / 30 ) , textAlign: TextAlign.center,),
              color: Color.fromARGB(255, 160, 0, 0),
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
                          color: Color.fromARGB(255, 160, 0, 0),
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

  void pickACard() async {
    cards.clear();
    listsCards = await fetchFileData();
    int rnd = Random().nextInt(listsCards.length);
    print(rnd);
    print(cards);

    cards.add(listsCards.elementAt(rnd).toString());

  }
}