import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_rd/ui/view/action_scenario.dart';
import 'package:project_rd/ui/view/story_scenario.dart';
import 'package:project_rd/logic/provider/game_provider.dart' as Game;
import 'package:provider/provider.dart';

class DuelView extends StatefulWidget {
  @override
  _DuelViewState createState() => _DuelViewState();
}

class _DuelViewState extends State<DuelView> {
  Game.Provider _provider;

  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<Game.Provider>(context);
    return Container(
        child: Column(
          children: [
            Expanded(child: getScenario(_provider?.scenario)),
            Container(
              height: 60,
              width: double.infinity,
              child: RaisedButton(
                  onPressed: () {},
                  color: Colors.black,
                  child: Image.asset('assets/down_arrow.png')),
            )
          ],
        ),
        margin: EdgeInsets.fromLTRB(15, 40, 15, 10));
  }

  Widget getScenario(Game.Scenario scenario) {
    switch (scenario) {
      case Game.Scenario.Action:
        return ActionScenario();
        break;
      case Game.Scenario.Story:
        return StoryScenario();
        break;
      default:
    }
  }
}
