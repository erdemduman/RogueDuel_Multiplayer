import 'dart:math';
import 'package:project_rd/constants/routes.dart';
import 'package:project_rd/logic/use_case/calculate_use_case.dart' as Calculate;
import 'package:project_rd/model/player.dart';
import 'base_view_model.dart' as Base;

class ViewModel extends Base.ViewModel implements Calculate.Callback {
  Player _me;
  Player _opponent;

  GameMode _gameMode;
  Scenario _scenario;
  String _currentCalculateString;
  int _pageNumber;
  String _diceString;
  bool _rollBackButtonEnabled;
  bool _isButtonBack;
  Calculate.UseCase _calculateUseCase;
  Map<ActionType, DiceType> _diceTypeMapper = {
    ActionType.Attack: DiceType.Attack,
    ActionType.Defence: DiceType.Defence
  };

  Provider() {
    _calculateUseCase = Calculate.UseCase();
  }

  @override
  void onCreate([Base.Parameter navigationData]) {
    var parameter = navigationData as Parameter;
    _scenario = parameter.scenario;
    _gameMode = parameter.gameMode;
    _currentCalculateString = 10.toString();
    _pageNumber = 0;
    _rollBackButtonEnabled = true;
    _isButtonBack = true;
    createPlayers();
  }

  void createPlayers() {
    _me = Player(name: "Rogue", hp: 100);
    _opponent = Player(name: "Monster", hp: 100);
  }

  void pageViewChanged(int page) {
    _pageNumber = page;
    notifyListeners();
  }

  void changeCalculateValue(int number) async {
    _currentCalculateString = number.toString();
    await _calculateUseCase.executeAsync(
        Calculate.Parameter()
          ..me = _me
          ..opponent = _opponent
          ..diceString = _currentCalculateString
          ..isCalculate = true,
        this);
    notifyListeners();
  }

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

  Player get me => _me;
  Player get opponent => _opponent;
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
