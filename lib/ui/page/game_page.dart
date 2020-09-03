import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_rd/ui/view/duel_view.dart';
import 'package:project_rd/ui/view/gift_view.dart';
import 'package:provider/provider.dart';
import 'package:project_rd/logic/provider/game_provider.dart' as Game;

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
      create: (context) => Game.Provider(),
      child: GamePageBody(widget.navigationData),
    );
  }
}

class GamePageBody extends StatefulWidget {
  final navigationData;

  GamePageBody(this.navigationData);

  @override
  _GamePageBodyState createState() => _GamePageBodyState();
}

class _GamePageBodyState extends State<GamePageBody> {
  Game.Provider _provider;

  @override
  void initState() {
    super.initState();
    _provider = Provider.of<Game.Provider>(context, listen: false);
    _provider?.onCreate(widget.navigationData);
  }

  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<Game.Provider>(context);
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [DuelView(), GiftView()],
      ),
      backgroundColor: Colors.black,
    );
  }
}
