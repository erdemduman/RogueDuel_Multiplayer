import 'package:flutter/material.dart';
import 'package:project_rd/router.dart';
import 'package:project_rd/service/router_service.dart';

import 'constants/routes.dart';
import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rogue's Duel",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
              fontFamily: 'Minecraft')),
      onGenerateRoute: generateRoute,
      initialRoute: Routes.main_menu,
      navigatorKey: locator<RouteService>().routerKey,
    );
  }
}
