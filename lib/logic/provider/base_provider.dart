import 'package:flutter/cupertino.dart';
import 'package:project_rd/service/locator.dart';
import 'package:project_rd/service/router_service.dart';

class Provider extends ChangeNotifier {
  final RouteService routeService = locator<RouteService>();

  void onCreate([Parameter navigationData]) {}
  void onDestroy() {}
}

class Parameter {}
