import 'dart:math';

import 'package:project_rd/constants/routes.dart';
import 'base_provider.dart' as Base;

class Provider extends Base.Provider {
  GameMode _gameMode;
  Scenario _scenario;
  int _currentCalculateValue;
  int _pageNumber;
  String _diceNumber;

  @override
  void onCreate([Base.Parameter navigationData]) {
    var parameter = navigationData as Parameter;
    _scenario = parameter.scenario;
    _gameMode = parameter.gameMode;
    _currentCalculateValue = 10;
    _pageNumber = 0;
    _diceNumber = "0";
  }

  void goToGiftPage() {
    routeService.goToRoute(Routes.choose_gift);
  }

  void pageViewChanged(int page) {
    _pageNumber = page;
    notifyListeners();
  }

  void goToStoryScenario() {
    _scenario = Scenario.Story;
    notifyListeners();
  }

  void changeCalculateValue(int number) {
    _currentCalculateValue = number;
    notifyListeners();
  }

  void goToDiceScenario(ActionType actionType) {
    _scenario = Scenario.Dice;
    _diceNumber = null;
    notifyListeners();
  }

  void goToActionScenario() {
    _scenario = Scenario.Action;
    notifyListeners();
  }

  void rollDice() {
    _diceNumber = Random().nextInt(21).toString();
    notifyListeners();
  }

  Scenario get scenario => _scenario;
  int get currentCalculateValue => _currentCalculateValue;
  int get pageNumber => _pageNumber;
  String get diceNumber => _diceNumber;

  set diceNumber(String value) {
    _diceNumber = value;
    notifyListeners();
  }
}

class Parameter extends Base.Parameter {
  GameMode gameMode;
  Scenario scenario;
}

enum GameMode { Singleplayer, Multiplayer }
enum Scenario { Action, Story, Dice }
enum ActionType { Attack, Defence }
