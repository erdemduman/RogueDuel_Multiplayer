import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_rd/ui/viewmodel/game_viewmodel.dart' as Game;
import 'package:project_rd/styles.dart';
import 'package:provider/provider.dart';

class RollBackButtonUnit extends StatefulWidget {
  @override
  _RollBackButtonUnitState createState() => _RollBackButtonUnitState();
}

class _RollBackButtonUnitState extends State<RollBackButtonUnit> {
  Game.ViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<Game.ViewModel>(context);
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
    RaisedButton upper = _viewModel.rollBackButtonEnabled
        ? buttonGenerator("Roll", rollDice, Colors.white, Styles.buttonStyle())
        : buttonGenerator(
            "Roll", () {}, Colors.grey[400], Styles.disabledButtonStyle());

    RaisedButton bottom;
    if (_viewModel.isButtonBack) {
      bottom = _viewModel.rollBackButtonEnabled
          ? buttonGenerator("Back", _viewModel?.goToActionScenario,
              Colors.white, Styles.buttonStyle())
          : buttonGenerator(
              "Back", () {}, Colors.grey[400], Styles.disabledButtonStyle());
    } else {
      bottom = _viewModel.rollBackButtonEnabled
          ? buttonGenerator("Done", _viewModel?.goToStoryScenario, Colors.white,
              Styles.buttonStyle())
          : buttonGenerator(
              "Done", () {}, Colors.grey[400], Styles.disabledButtonStyle());
    }
    return [upper, bottom];
  }

  void rollDice() {
    _viewModel?.rollBackButtonEnabled = false;
    _viewModel?.diceString = ".";
    Future.delayed(Duration(seconds: 1), () => _viewModel?.diceString = "..");
    Future.delayed(Duration(seconds: 2), () => _viewModel?.diceString = "...");
    Future.delayed(
        Duration(seconds: 3),
        () => {
              _viewModel?.rollDice(),
              _viewModel?.diceString = _viewModel.diceString
            });
    Future.delayed(Duration(seconds: 3), () {
      _viewModel?.rollBackButtonEnabled = true;
      _viewModel.isButtonBack = false;
    });
  }
}
