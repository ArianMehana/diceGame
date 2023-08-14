import 'dart:math';

import 'package:flutter/material.dart';

//void main()=> runApp(MyApp());

void main(){
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Dice();
  }
}

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {

  int _player1 = 1;
  int _player2 = 2;
  String _winner = "";

  rollDice(){
    setState(() {
      this._player1 = Random().nextInt(6) + 1;
      this._player2 = Random().nextInt(6) + 1;
    });
    if(_player1>_player2) {
      print("Player 1 won!");
      _winner = "Player 1 won!";
    }
    else if(_player2>_player1) {
      print("Player 2 won!");
      _winner = "Player 2 won";
    }
    else {
      print("Draw!");
      _winner = "Draw!";
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dice Game"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Player 1",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),),
                    Text("Player 2",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image(image: AssetImage("images/dice$_player1.png"),
                        height: 150,
                        width: 150,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image(image: AssetImage("images/dice$_player2.png"),
                        height: 150,
                        width: 150,),
                    )
                  ],
                ),
              ],
            ),

            Center(
              child: OutlinedButton(onPressed: rollDice, child: Text("Play",
                style: TextStyle(
                    color: Colors.black
                ),),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),),
            ),
            SizedBox(height: 10,),
            Center(
              child: Text("$_winner",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20
                ),),
            )
          ],
        ),
        backgroundColor: Colors.teal,
      ),
    );
  }
}



