import 'package:get_it/get_it.dart';
import 'package:project_rd/ui/route/router_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => RouteService());
}
