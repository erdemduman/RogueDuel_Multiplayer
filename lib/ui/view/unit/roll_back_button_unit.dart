import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_rd/logic/provider/game_provider.dart' as Game;
import 'package:project_rd/styles.dart';
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
      children: buttonSelection(),
    ));
  }

  RaisedButton buttonGenerator(String text, Function action, Color textColor,
      RoundedRectangleBorder shape) {
    return RaisedButton(
        onPressed: action,
        child: Text(text),
        color: Colors.black,
        textColor: textColor,
        shape: shape);
  }

  List<Widget> buttonSelection() {
    RaisedButton upper = _provider.rollBackButtonEnabled
        ? buttonGenerator("Roll", rollDice, Colors.white, Styles.buttonStyle())
        : buttonGenerator(
            "Roll", () {}, Colors.grey[400], Styles.disabledButtonStyle());

    RaisedButton bottom;
    if (_provider.isButtonBack) {
      bottom = _provider.rollBackButtonEnabled
          ? buttonGenerator("Back", _provider?.goToActionScenario, Colors.white,
              Styles.buttonStyle())
          : buttonGenerator(
              "Back", () {}, Colors.grey[400], Styles.disabledButtonStyle());
    } else {
      bottom = _provider.rollBackButtonEnabled
          ? buttonGenerator("Done", _provider?.goToStoryScenario, Colors.white,
              Styles.buttonStyle())
          : buttonGenerator(
              "Done", () {}, Colors.grey[400], Styles.disabledButtonStyle());
    }
    return [upper, bottom];
  }

  void rollDice() {
    _provider?.rollBackButtonEnabled = false;
    _provider?.diceString = ".";
    Future.delayed(Duration(seconds: 1), () => _provider?.diceString = "..");
    Future.delayed(Duration(seconds: 2), () => _provider?.diceString = "...");
    Future.delayed(
        Duration(seconds: 3),
        () => {
              _provider?.rollDice(),
              _provider?.diceString = _provider.diceString
            });
    Future.delayed(Duration(seconds: 3), () {
      _provider?.rollBackButtonEnabled = true;
      _provider.isButtonBack = false;
    });
  }
}
