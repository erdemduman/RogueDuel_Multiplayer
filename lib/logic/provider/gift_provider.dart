import 'package:project_rd/constants/routes.dart';
import 'package:project_rd/logic/provider/game_provider.dart' as Game;

import 'base_provider.dart' as Base;

class Provider extends Base.Provider {
  @override
  void onCreate([Base.Parameter navigationData]) {}

  void goToActionScenario() {
    routeService.goToRoute(Routes.game,
        arguments: Game.Parameter()
          ..gameMode = Game.GameMode.Singleplayer
          ..scenario = Game.Scenario.Action);
  }

  void goToBack() {
    routeService.goBack();
  }
}

class Parameter extends Base.Parameter {}
