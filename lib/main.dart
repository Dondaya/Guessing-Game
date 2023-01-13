// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'game.dart';


void main() {
  runApp(const MaterialApp(
    home: GameWidget(),
  ));
}

class GameWidget extends StatefulWidget {
  const GameWidget({super.key});

  @override
  State<StatefulWidget> createState() => new GameState();
}

class GameState extends State<GameWidget> {
  var game = Game();
  var displayMessage = "";
  var textEditionController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("Guessing Game"),
        backgroundColor: Colors.black,
      ),
      
      body: new Container(
        padding: const EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            new TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: "Guess a number between 1-100"),
              controller: textEditionController,
              onSubmitted: (String input) {
                setState(() {
                  int number = int.parse(input);
                  Result result = game.nextMove(number);
                  String message;
                  switch (result) {
                    case Result.Correct:
                      message = 'HARI YAKO ! You have won ! ';

                      break;

                    case Result.Higher_than_expected:
                      message = 'LOWER THE VALUE YAKO !';

                      break;

                    case Result.Lower_the_value:
                      message = 'HIGHER VALUE NEXT TIME YAKO !';

                      break;

                    case Result.Input_in_range:
                      message = 'WRONG INPUT YAKO, HARIYATA GAHAPANG';

                      break;

                    case Result.Out_of_chances:
                      message = 'EWARAI YAKO, GAME OVER !';

                      break;
                  }
                  displayMessage = "$displayMessage\n$number : $message";
                }); //setState
                textEditionController.text = "";
              },
            ),
            new Text(displayMessage)
          ],
        ),
      ),
    );
  } 
  
}
