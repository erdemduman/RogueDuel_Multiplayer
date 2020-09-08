import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_rd/logic/provider/game_provider.dart' as Game;
import 'package:provider/provider.dart';

class DiceScenario extends StatefulWidget {
  @override
  _DiceScenarioState createState() => _DiceScenarioState();
}

class _DiceScenarioState extends State<DiceScenario> {
  Game.Provider _provider;

  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<Game.Provider>(context);
    return Container(
      child: Column(
        children: [
          Expanded(child: healthView(), flex: 12),
          Expanded(child: diceView(), flex: 40),
          Expanded(child: rollAndBackButtonView(), flex: 20)
        ],
      ),
    );
  }

  Container healthView() {
    return Container(
      child: Column(children: [
        Row(children: [
          Text("Player 1", style: TextStyle(fontSize: 25)),
          Spacer(),
          Text("Player 2", style: TextStyle(fontSize: 25)),
        ]),
        SizedBox(height: 10),
        Row(children: [
          Image.asset('assets/pixel_heart.png', height: 35),
          SizedBox(width: 10),
          Text("95", style: TextStyle(fontSize: 25)),
          Spacer(),
          Text("100", style: TextStyle(fontSize: 25)),
          SizedBox(width: 10),
          Image.asset('assets/pixel_heart.png', height: 35),
        ])
      ]),
    );
  }

  Container diceView() {
    return Container(
        child: Center(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            child: Image.asset('assets/dice.png'),
          ),
          Text(
            _provider?.diceNumber != null ? _provider?.diceNumber : "",
            style: TextStyle(fontSize: 40),
          )
        ],
      ),
    ));
  }

  Container rollAndBackButtonView() {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
            onPressed: () => rollDice(),
            child: Text("Roll"),
            color: Colors.black,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
                side: BorderSide(color: Colors.white))),
        RaisedButton(
            onPressed: _provider?.goToActionScenario,
            child: Text("Back"),
            color: Colors.black,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
                side: BorderSide(color: Colors.white)))
      ],
    ));
  }

  void rollDice() {
    _provider?.diceNumber = ".";
    Future.delayed(Duration(seconds: 1), () => _provider?.diceNumber = "..");
    Future.delayed(Duration(seconds: 2), () => _provider?.diceNumber = "...");
    Future.delayed(Duration(seconds: 3), () => _provider?.rollDice());
    Future.delayed(Duration(seconds: 5), () => _provider?.goToStoryScenario());
  }
}
