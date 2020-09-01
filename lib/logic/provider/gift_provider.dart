import 'base_provider.dart' as Base;

class Provider extends Base.Provider {
  @override
  void onCreate([Base.Parameter navigationData]) {}

  void goToBack() {
    routeService.goBack();
  }
}

class Parameter extends Base.Parameter {}
