import 'package:PicoloEsirem/PicoloGame.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Home();
  }
}

class _Home extends State<Home> {

  List<String> players = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Joueurs'),
        leading: new Icon(Icons.account_box),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            'Swipe to delete a player \n Press \'Enter\' to add one',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: players.length,
            itemBuilder: (context, index) {
              String player = players.elementAt(index);
              return Dismissible(
                key: Key(player),
                onDismissed: (direction) {
                  setState(() {
                    players.remove(player);
                  });
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('remove $player'),
                      duration: Duration(milliseconds: 500),
                    ),
                  );
                  print(players);
                },
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.height / 12,
                    child: Card(
                    color: Colors.deepPurple,

                      child: Text(
                        player,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 24,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          child: TextField(
            onSubmitted: (String value) {
              setState(() {
                players.add(value);
              });

            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nom',
            ),
          ),
          width: MediaQuery.of(context).size.width / 2,
        ),
        Align(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.transparent,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return PicoloGame(players);
                      },
                    ),
                    //'/GamePage'
                  );

                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
            ),
          ),
          alignment: Alignment.bottomRight,
        ),
      ]),
    );
  }

  void addPlayer(String name) {
    players.add(name
        /*new Container(
        child: new Row(
          children: [
            new Text(
              name,
              style: new TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 15),
            ),
            new IconButton(
              onPressed: () {
                print('mange tes morts');
              },
              icon: new Icon(
                Icons.remove_circle,
              ),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),*/
        );
    print("submited");
  }
}
