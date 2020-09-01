import 'package:project_rd/constants/routes.dart';
import 'base_provider.dart' as Base;

class Provider extends Base.Provider {
  GameMode _gameMode;
  Scenario _scenario;
  int _currentCalculateValue;

  @override
  void onCreate([Base.Parameter navigationData]) {
    var parameter = navigationData as Parameter;
    _scenario = Scenario.Action;
    _gameMode = parameter.gameMode;
    _currentCalculateValue = 10;
  }

  void goToGiftPage() {
    routeService.goToRoute(Routes.gift);
  }

  void switchToStoryScenario() {
    _scenario = Scenario.Story;
    notifyListeners();
  }

  void changeCalculateValue(int number) {
    _currentCalculateValue = number;
    notifyListeners();
  }

  Scenario get scenario => _scenario;
  int get currentCalculateValue => _currentCalculateValue;
}

class Parameter extends Base.Parameter {
  GameMode gameMode;
}

enum GameMode { Singleplayer, Multiplayer }
enum Scenario { Action, Story }
