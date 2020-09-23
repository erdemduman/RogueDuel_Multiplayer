import 'dart:math';
import 'package:project_rd/constants/routes.dart';
import 'package:project_rd/logic/use_case/calculate_use_case.dart' as Calculate;
import 'base_viewmodel.dart' as Base;

class ViewModel extends Base.ViewModel implements Calculate.Callback {
  GameMode _gameMode;
  Scenario _scenario;
  String _currentCalculateString;
  int _pageNumber;
  String _diceString;
  bool _rollBackButtonEnabled;
  bool _isButtonBack;

  ViewModel() {}

  @override
  void onCreate([Base.Parameter navigationData]) {
    var parameter = navigationData as Parameter;
    _scenario = parameter.scenario;
    _gameMode = parameter.gameMode;
    _currentCalculateString = 10.toString();
    _pageNumber = 0;
    _rollBackButtonEnabled = true;
    _isButtonBack = true;
  }

  void pageViewChanged(int page) {
    _pageNumber = page;
    notifyListeners();
  }

  void changeCalculateValue(int number) async {}

  void goToStoryScenario() {
    _scenario = Scenario.Story;
    notifyListeners();
  }

  void goToDiceScenario(ActionType actionType) {
    _scenario = Scenario.Dice;
    _diceString = null;
    _isButtonBack = true;
    notifyListeners();
  }

  void goToActionScenario() {
    _scenario = Scenario.Action;
    notifyListeners();
  }

  void goToGiftPage() {
    routeService.goToRoute(Routes.choose_gift);
  }

  void rollDice() {
    _diceString = Random().nextInt(21).toString();
    notifyListeners();
  }

  void processGifts() {}

  @override
  void onDone() {}

  Scenario get scenario => _scenario;
  int get currentCalculateValue => int.parse(_currentCalculateString);
  int get pageNumber => _pageNumber;
  String get diceString => _diceString;
  bool get rollBackButtonEnabled => _rollBackButtonEnabled;
  bool get isButtonBack => _isButtonBack;

  set diceString(String value) {
    _diceString = value;
    notifyListeners();
  }

  set rollBackButtonEnabled(bool value) {
    _rollBackButtonEnabled = value;
    notifyListeners();
  }

  set isButtonBack(bool value) {
    _isButtonBack = value;
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
