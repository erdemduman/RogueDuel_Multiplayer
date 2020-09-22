import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_rd/ui/view/main_menu_card.dart';
import 'package:provider/provider.dart';
import 'package:project_rd/ui/viewmodel/main_menu_provider.dart' as MainMenu;

class MainMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MainMenu.Provider(), child: MainMenuPageBody());
  }
}

class MainMenuPageBody extends StatefulWidget {
  @override
  _MainMenuPageBodyState createState() => _MainMenuPageBodyState();
}

class _MainMenuPageBodyState extends State<MainMenuPageBody> {
  MainMenu.Provider _provider;

  @override
  void initState() {
    super.initState();
    _provider = Provider.of<MainMenu.Provider>(context, listen: false);
    _provider.onCreate();
  }

  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<MainMenu.Provider>(context);
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [gameTitle(), menuItems()],
          ),
        ),
        color: Colors.black,
      ),
    );
  }

  TyperAnimatedTextKit gameTitle() {
    return TyperAnimatedTextKit(
      isRepeatingAnimation: false,
      speed: Duration(milliseconds: 80),
      text: ["Rogue's Duel."],
      onFinished: () => _provider.isMenuActive = true,
      textStyle: TextStyle(fontFamily: 'Minecraft', fontSize: 50),
    );
  }

  Container menuItems() {
    return Container(
      child: Visibility(
        child: ListView.builder(
            itemBuilder: (context, index) =>
                MainMenuCard(List.from(_provider.menuItems)[index]),
            itemCount: _provider.menuItems.length,
            shrinkWrap: true,
            physics: new NeverScrollableScrollPhysics()),
        visible: _provider.isMenuActive,
      ),
    );
  }
}
