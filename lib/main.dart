// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'game.dart';
import 'nextpage.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
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
      backgroundColor: const Color.fromARGB(255, 6, 62, 102),
      // // appBar: new AppBar(
      // //   title: const Text("Guessing Game"),
      // //   backgroundColor: Colors.black,
      // ),
      body: new Container(
        padding: const EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            // new Container(
            //   width: 150,
            //   height: 20,
            //   color: Colors.white,
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //         primary: Color.fromARGB(255, 3, 73, 121)),
            //     onPressed: () => null,
            //     child: const Text("Guessing Game"),
            //   ),
            // ),
            const Center(
                child: Text(
              "Guessing Game",
              maxLines: 1 ,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoSlab',
                fontSize: 30,
              ),
            )),

            new Container(
              child: Lottie.asset(
                'assets/gamepad.json',
                height: 500,
                width: 400,
              ),

              // fit: BoxFit.fill,
            ),
            new TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    // ignore: prefer_const_constructors
                    borderSide: BorderSide(
                        width: 2,
                        color: const Color.fromARGB(255, 3, 73, 121)), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  hintText: "Guess a number between 1-10",
                  filled: true, //<-- SEE HERE
                  fillColor: const Color.fromARGB(255, 243, 243, 245)),

              keyboardType: TextInputType.number,
              // decoration: const InputDecoration(
              controller: textEditionController,
              onSubmitted: (String input) {
                setState(() {
                  int number = int.parse(input);
                  Result result = game.nextMove(number);
                  String message;
                  switch (result) {
                    case Result.Correct:
                      message = 'HARI YAKO ! You have won ! ';
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyWidget()),
                      );

                      break;

                    case Result.Higher_than_expected:
                      message = 'LOWER THE VALUE YAKO !';

                      break;

                    case Result.Lower_the_value:
                      message = 'HIGHER VALUE NEXT TIME YAKO !';

                      break;

                    case Result.Input_in_range:
                      // message = 'WRONG INPUT YAKO, HARIYATA GAHAPANG';
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => MyWidget()),
                      // );

                      break;

                    case Result.Out_of_chances:
                      message = 'EWARAI YAKO, GAME OVER !';

                    // break;
                  }

                  // displayMessage = "$displayMessage\n$number : $message";
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
