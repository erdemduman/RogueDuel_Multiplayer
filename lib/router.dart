import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_rd/constants/routes.dart';
import 'package:project_rd/ui/page/game_page.dart';
import 'package:project_rd/ui/page/gift_page.dart';
import 'package:project_rd/ui/page/main_menu_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final args = settings.arguments;
  switch (settings.name) {
    case Routes.main_menu:
      return MaterialPageRoute(builder: (context) => MainMenuPage());
    case Routes.game:
      return MaterialPageRoute(builder: (context) => GamePage(args));
    case Routes.gift:
      return MaterialPageRoute(builder: (context) => GiftPage());
    default:
      return MaterialPageRoute(builder: (context) {
        return Container(
          child: Center(
            child: Text("There is no such route :("),
          ),
        );
      });
  }
}
