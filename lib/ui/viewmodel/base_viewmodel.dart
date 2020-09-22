import 'package:flutter/cupertino.dart';
import 'package:project_rd/service/locator.dart';
import 'package:project_rd/service/router_service.dart';

abstract class ViewModel extends ChangeNotifier {
  final RouteService routeService = locator<RouteService>();

  void onCreate([Parameter navigationData]) {}
  void onDestroy() {}
}

abstract class Parameter {}
