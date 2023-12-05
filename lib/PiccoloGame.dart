import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class PiccoloGame extends StatefulWidget {
  List<String> param = [];
  PiccoloGame(List<String> players) {
    param = players;
  }

  @override
  State<StatefulWidget> createState() {
    return new _PiccoloGame(param);
  }
}

class _PiccoloGame extends State<PiccoloGame> {
  List<String> players = [];
  int turn = 0;
  List<String> cards = [];
  List<String> allCards = [];
  String read = '';
  bool turn1 = true;

  Future<List<String>> fetchFileData() async {
    read = await rootBundle.loadString('assets/card.txt');

    allCards = read.split('\n');

    return allCards;
  }

  _PiccoloGame(this.players) {
    if (players.isEmpty) {
      players.add("personne");
    }

    players.insert(0, " ");

    fetchFileData();
    print(allCards);
    cards = [];
    turn = 0;
  }

  @override
  Widget build(BuildContext context) {
    if (turn1) {
      cards.add(
          'Roses are red,\nViolet are blue,\nHello les NRV,\nSwipe pour picoler');
    } else {
      pickACard();
    }

    print(players);
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Swipe pour la suite'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: new Icon(Icons.videogame_asset),
          )
        ],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 37, 50, 64),
      body: Column(
        children: [
          Container(
            child: Card(
              child: Text(
                'Au tour de : \n' + players.elementAt(turn),
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 30),
                textAlign: TextAlign.center,
              ),
              color: Color.fromARGB(255, 241, 48, 77),
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
                        if (turn1) {
                          players.removeAt(0);
                          turn1 = false;
                        }
                        cards.remove(card);
                        turn++;
                        turn %= players.length;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Suivant'),
                          duration: Duration(milliseconds: 500),
                        ),
                      );
                    },
                    child: Center(
                      child: Container(
                        child: Card(
                          child: Text(
                            cards.first,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          color: Color.fromARGB(255, 241, 48, 77),
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
    cards.clear();
    int rnd = Random().nextInt(allCards.length);
    print(rnd);
    cards.add(allCards.elementAt(rnd));
    print(cards.length);
  }
}
