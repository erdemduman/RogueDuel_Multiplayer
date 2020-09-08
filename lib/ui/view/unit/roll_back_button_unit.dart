import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_rd/logic/provider/game_provider.dart' as Game;
import 'package:provider/provider.dart';

class RollBackButtonUnit extends StatefulWidget {
  @override
  _RollBackButtonUnitState createState() => _RollBackButtonUnitState();
}

class _RollBackButtonUnitState extends State<RollBackButtonUnit> {
  Game.Provider _provider;

  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<Game.Provider>(context);
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
    Future.delayed(
        Duration(seconds: 3),
        () => {
              _provider?.rollDice(),
              _provider?.diceNumber = _provider.diceNumber
            });
    Future.delayed(Duration(seconds: 5), () => _provider?.goToStoryScenario());
  }
}
