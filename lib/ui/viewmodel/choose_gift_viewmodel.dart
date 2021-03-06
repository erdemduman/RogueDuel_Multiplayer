import 'package:project_rd/constants/routes.dart';
import 'package:project_rd/ui/viewmodel/game_viewmodel.dart' as Game;

import 'base_viewmodel.dart' as Base;

class ViewModel extends Base.ViewModel {
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
