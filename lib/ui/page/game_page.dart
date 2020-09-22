import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_rd/ui/view/duel_view.dart';
import 'package:project_rd/ui/view/gift_view.dart';
import 'package:provider/provider.dart';
import 'package:project_rd/ui/viewmodel/game_viewmodel.dart' as Game;

class GamePage extends StatefulWidget {
  final navigationData;

  GamePage(this.navigationData);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Game.ViewModel(),
      child: GamePageBody(widget.navigationData),
    );
  }
}

class GamePageBody extends StatefulWidget {
  final navigationData;
  List<Widget> pages = [];

  GamePageBody(this.navigationData);

  @override
  _GamePageBodyState createState() => _GamePageBodyState();
}

class _GamePageBodyState extends State<GamePageBody> {
  Game.ViewModel _provider;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _provider = Provider.of<Game.ViewModel>(context, listen: false);
    _provider?.onCreate(widget.navigationData);
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<Game.ViewModel>(context);
    widget.pages.addAll([DuelView(_pageController), GiftView(_pageController)]);
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => widget.pages[index % 2],
        onPageChanged: (page) => _provider?.pageViewChanged(page),
      ),
      backgroundColor: Colors.black,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
