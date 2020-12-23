import 'package:PiccoloEsirem/PiccoloGame.dart';
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
      backgroundColor: Color.fromARGB(255, 37, 50, 64),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            'Swipe pour supprimer un joueur \n Valide avec ton clavier pour ajouter le joueur',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white
            ),
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
                      content: Text('On vire $player'),
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
                    color: Color.fromARGB(255, 241, 48, 77),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height / 35)
                      ),
                      child: Text(
                        player,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
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
            style: TextStyle(
                color: Colors.white
             ),
            decoration: InputDecoration(
              fillColor: Color.fromARGB(255, 241, 48, 77),
              filled: true,
              border: OutlineInputBorder(),
              labelText: 'Nom'
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
                        return PiccoloGame(players);
                      },
                    ),
                    //'/GamePage'
                  );

                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Color.fromARGB(255, 241, 48, 77),
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
      players.add(name);
    //print("submited");
  }
}
