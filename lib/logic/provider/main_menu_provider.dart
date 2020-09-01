import 'package:project_rd/constants/routes.dart';
import 'package:project_rd/logic/logic_model/menu_item.dart';
import 'package:project_rd/logic/provider/game_provider.dart' as Game;
import 'base_provider.dart' as Base;

class Provider extends Base.Provider {
  bool _isMenuActive;
  List<MenuItem> _menuItems = [];
  List<MenuItem> _mainMenuItems = [];
  List<MenuItem> _multiplayerMenuItems = [];

  Provider() {
    isMenuActive = false;
  }

  @override
  void onCreate([Base.Parameter navigationData = null]) {
    initMenuItems();
  }

  void initMenuItems() {
    _mainMenuItems = [
      MenuItem("Singleplayer", _goToSinglePlayer),
      MenuItem("Multiplayer", _goToMultiplayer),
      MenuItem("Gifts"),
      MenuItem("Settings")
    ];
    _multiplayerMenuItems = [
      MenuItem("Quick Game"),
      MenuItem("Play With A Friend"),
      MenuItem("", () {}),
      MenuItem("Back", _goToMainMenu)
    ];
    if (_menuItems.isEmpty) _menuItems.addAll(_mainMenuItems);
  }

  void _goToSinglePlayer() {
    routeService.goToRoute(Routes.game,
        arguments: Game.Parameter()..gameMode = Game.GameMode.Singleplayer);
  }

  void _goToMultiplayer() {
    _menuItems.clear();
    _menuItems.addAll(_multiplayerMenuItems);
    notifyListeners();
  }

  void _goToMainMenu() {
    _menuItems.clear();
    _menuItems.addAll(_mainMenuItems);
    notifyListeners();
  }

  set isMenuActive(bool value) {
    _isMenuActive = value;
    notifyListeners();
  }

  bool get isMenuActive => _isMenuActive;
  List<MenuItem> get menuItems => _menuItems;
}

class Parameter extends Base.Parameter {}
